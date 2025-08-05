<?php

namespace App\Http\Controllers\Auth;

use App\Helper\LogActivity;
use App\Http\Controllers\Controller;
use App\Http\Requests\AdminLoginRequest;
use App\Http\Services\AdminLoginService;
use App\Models\User;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use App\Mail\BasicMail;
use Modules\Subscription\Entities\UserSubscription;
use Modules\Subscription\Entities\Subscription;
use Illuminate\Support\Str; 
use Illuminate\Support\Facades\DB;
use App\Helper\PaymentGatewayRequestHelper;




class LoginController extends Controller
{
    use AuthenticatesUsers;

//    protected $redirectTo = '/';
    public function redirectTo()
    {
        return route('homepage');
    }

    public function __construct()
    {
//        $this->middleware()->except(['logout','userLogin']);
    }

    public function username()
    {
        return 'username';
    }

    public function adminLogin(AdminLoginRequest $request)
    {
        if($request->isMethod('post')){
            $email_or_username = filter_var($request->username, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';
            if (Auth::guard('admin')->attempt([$email_or_username => $request->username, 'password' => $request->password], $request->get('remember'))) {
                return response()->json([
                    'msg' => __('Login Success Redirecting'),
                    'status' => 'ok',
                    'type' => 'success'
                ]);
            }
            return response()->json([
                'msg' => sprintf(__('Your %s or Password Is Wrong !!'),$email_or_username),
                'status' => 'not_ok',
                'type' => 'danger'
            ]);
        }
        return view('backend.pages.auth.login');
    }

    public function adminLogout(){
        Auth::guard('admin')->logout();
        return redirect()->route('admin.login')->with(['msg'=>__('You Logged Out !!'),'type'=> 'danger']);
    }

    /**
     * Show the application's login form.
     *
     * @return \Illuminate\Http\Response
     */
    public function userLogin(Request $request)
    {
        if ($request->isMethod('post')) {
            $email_or_username = filter_var($request->username, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';
            
            $request->validate([
                'username' => 'required|string',
                'password' => 'required|min:6'
            ], [
                'username.required' => sprintf(__('%s required'), $email_or_username),
                'password.required' => __('password required')
            ]);
    
            if (Auth::guard('web')->attempt([$email_or_username => $request->username, 'password' => $request->password], $request->get('remember'))) {
                
                $user = Auth::user();
    
                $activeSubscription = UserSubscription::where('user_id', $user->id)
                ->where('status', 1)
                ->where('expire_date', '>', now())
                ->first();

            if (!$activeSubscription) {

                $pendingSubscription = UserSubscription::with('subscription')
                    ->where('user_id', $user->id)
                    ->where('status', 2) 
                    ->where('expire_date', '>', now()) 
                    ->orderByDesc('created_at')
                    ->first();

                if ($pendingSubscription && $pendingSubscription->subscription) {

                    return response()->json([
                        'type' => 'success',
                        'status' => 'redirect-to-payment',
                        'redirect_url' => route('payment.index', [
                            'subscription_id' => $pendingSubscription->subscription->id
                        ])
                    ]);
                } else {

                    $freePlan = Subscription::where('price', 0)->first();
                    if ($freePlan) {
                        UserSubscription::create([
                            'user_id' => $user->id,
                            'subscription_id' => $freePlan->id,
                            'price' => $freePlan->price,
                            'limit' => $freePlan->limit,
                            'expire_date' => now()->addDays(optional($freePlan->subscription_type)->validity ?? 30),
                            'payment_gateway' => 'free',
                            'payment_status' => 'Complete',
                            'status' => 1,
                        ]);
                    }
                }
            }

    

                if ($user->user_type == 1) {
                    if (moduleExists('SecurityManage')) {
                        LogActivity::addToLog('User logged in', 'Client');
                    }
                    return response()->json([
                        'msg' => __('Login Success Redirecting'),
                        'type' => 'success',
                        'status' => 'client-login'
                    ]);
                } else {
                    if (moduleExists('SecurityManage')) {
                        LogActivity::addToLog('User logged in', 'Freelancer');
                    }
                    return response()->json([
                        'msg' => __('Login Success Redirecting'),
                        'type' => 'success',
                        'status' => 'freelancer-login'
                    ]);
                }
            }
    
            return response()->json([
                'msg' => sprintf(__('Your %s or Password Is Wrong !!'), $email_or_username),
                'type' => 'danger',
                'status' => 'not_ok'
            ]);
        }
    
        return view('frontend.user.user-login');
    }
    
    public function paymentIndex()
    {
        $userId = auth()->id(); 
        $userSubscription = UserSubscription::with('subscription')
            ->where('user_id', $userId)
            ->where('status', 2)
            ->whereHas('subscription', function ($query) {
                $query->where('id', '!=', 10);
            })
            ->latest('id')
            ->first();
    
        if (!$userSubscription) {
            return redirect()->back()->with('error', 'No pending subscription available.');
        }
    
        return view('frontend.payment.index', compact('userSubscription'));
    }

    public function forgetPassword(Request $request){

        if($request->isMethod('post')){
            $request->validate(['email' => 'required|email']);

            $email = User::select('email','email_verify_token')->where('email',$request->email)->first();
            if($email){
                //send otp mail
                $otp_code = sprintf("%d", random_int(123456, 999999));
                try {
                    Mail::to($email->email)->send(new BasicMail([
                        'subject' =>  __('Otp Email'),
                        'message' => '
                            <div style="text-align: center; padding: 20px; background-color: #f7f7f7; border: 1px solid #ddd; border-radius: 10px;">
                                <h2 style="color: #333;">'.__('Your OTP code is').'</h2>
                                <p style="font-size: 36px; font-weight: bold; color: #309400;">'.$otp_code.'</p>
                                <p style="color: #666;">'.__('Please use this OTP code to verify your account').'</p>
                            </div>
                            '
                    ]));
                }
                catch (\Exception $e) {}

                User::where('email',$request->email)->update(['email_verify_token'=>$otp_code]);

                Session::put('email',$email->email);
                return redirect()->route('user.forgot.password.otp');
            }
            return back()->with(toastr_error(__('Email not found please enter a valid email')));
        }
        return view('frontend.user.forgot-password');
    }



    // public function forgetPassword(Request $request)
    // {
    //     if ($request->isMethod('post')) {
    //         $request->validate(['email' => 'required|email']);

    //         $user = User::where('email', $request->email)->first();

    //         if ($user) {
    //             $otp_code = sprintf("%d", random_int(123456, 999999));

    //             try {
    //                 $message = get_static_option('password_reset_message') ?? __('Your OTP code is: ') . $otp_code;
    //                 $message = str_replace(["@otp"], [$otp_code], $message);
    //                 Mail::to($user->email)->send(new BasicMail([
    //                     'subject' => get_static_option('password_reset_subject') ?? __('Password Reset Email'),
    //                     'message' => $message
    //                 ]));
    //             } catch (\Exception $e) {
    //                 // Log the exception or handle it accordingly
    //                 \Log::error('Error sending password reset email: ' . $e->getMessage());
    //                 return back()->with(toastr_error(__('Error sending password reset email')));
    //             }

    //             $user->email_verify_token = $otp_code;
    //             $user->save();

    //             Session::put('email', $user->email);

    //             return redirect()->route('user.forgot.password.otp');
    //         }

    //         return back()->with(toastr_error(__('Email not found. Please enter a valid email')));
    //     }

    //     return view('frontend.user.forgot-password');
    // }


    public function passwordResetOtp(Request $request){

        if($request->isMethod('post')){
            $user_email = session()->get('email');

            $find_email = User::where('email',$user_email)->where('email_verify_token',$request->otp)->first();
            if($find_email){
                Session::put('user_email',$find_email->email);
                Session::put('user_otp',$request->otp);
                return redirect()->route('user.forgot.password.reset');
            }
        }
        return view('frontend.user.password-reset-otp');
    }

    public function passwordReset(Request $request)
    {
        if ($request->isMethod('post')) {
            $request->validate([
                'password' => ['required', 'string', 'min:6', 'max:191', 'regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]+$/'],
                'confirm_password' => 'required|min:6|max:191|same:password',
            ], [
                'password.regex' => 'Password must include uppercase, lowercase, number, and special character.',
            ]);

            $user_email = session()->get('user_email');
            $user_otp = session()->get('user_otp');

            $user = User::select(['email','user_type','email_verify_token'])->where('email',$user_email)->where('email_verify_token',$user_otp)->first();

            if($user){
                User::where('email',$user_email)
                    ->where('email_verify_token',$user_otp)
                    ->update(['password' => Hash::make($request->password)]);
                return redirect()->route('user.login');
            }else{
                return back()->with(toastr_warning(__('User not found')));
            }
        }
        return view('frontend.user.password-reset');
    }

    public function reset_passwordValidation(Request $request)
    {
        $password = $request->password;
        $passwordRegex = '/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$/';
        if (preg_match($passwordRegex, $password)) {
            $status = 'strong';
            $msg = __('Password is strong');
        } else {
            $status = 'weak';
            $msg = __('Password must include uppercase, lowercase, number, and special character');
        }
        return response()->json([
            'status' => $status,
            'msg' => $msg,
        ]);
    }

   public function reset_passwordMatchValidation(Request $request)
    {
        $password = $request->password;
        $confirmPassword = $request->confirm_password;
        if ($password == $confirmPassword && !empty($password) && !empty($confirmPassword)) {
            $status = 'match';
            $msg = __('Passwords match');
        } else {
            $status = 'not_match';
            $msg = __('Passwords do not match');
        }
        return response()->json([
            'status' => $status,
            'msg' => $msg,
        ]);
    }
}
