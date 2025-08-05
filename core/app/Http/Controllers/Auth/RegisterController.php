<?php

namespace App\Http\Controllers\Auth;


use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Mail;
use App\Mail\BasicMail;
use Modules\Subscription\Entities\Subscription;
use Modules\Subscription\Entities\UserSubscription;
use Modules\Wallet\Entities\Wallet;
use Illuminate\Validation\Rule;



class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
//    protected $redirectTo = '/';
    public function redirectTo(){
        return route('homepage');
    }
    public function __construct()
    {
        //
    }

    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:191'],
            'captcha_token' => ['nullable'],
            'username' => ['required', 'string', 'string', 'max:255', 'unique:users'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ],[
            'captcha_token.required' => __('google captcha is required'),
            'name.required' => __('name is required'),
            'name.max' => __('name is must be between 191 character'),
            'username.required' => __('username is required'),
            'username.max' => __('username is must be between 191 character'),
            'username.unique' => __('username is already taken'),
            'email.unique' => __('email is already taken'),
            'email.required' => __('email is required'),
            'password.required' => __('password is required'),
            'password.confirmed' => __('both password does not matched'),
        ]);
    }

    public function userNameAvailability(Request $request)
    {
        $username = User::where('username',$request->username)->first();
        if(!empty($username) && $username->username == $request->username){
            $status = 'not_available';
            $msg = __('Sorry! Username name is not available');
        }else{
            $status = 'available';
            $msg = __('Congrats! Username name is available');
        }
        return response()->json([
            'status'=>$status,
            'msg'=>$msg,
        ]);
    }

    public function emailAvailability(Request $request)
    {
        $email = User::where('email',$request->email)->first();
        if(!empty($email) && $email->email == $request->email){
            $status = 'not_available';
            $msg = __('Sorry! Email has already taken');
        }else{
            $status = 'available';
            $msg = __('Congrats! Email is available');
        }
        return response()->json([
            'status'=>$status,
            'msg'=>$msg,
        ]);
    }
    public function phoneNumberAvailability(Request $request)
    {
        $phone = User::where('phone',$request->phone)->first();
        if(!empty($phone) && $phone->phone == $request->phone){
            $status = 'not_available';
            $msg = __('Sorry! Phone Number has already taken');
        }else{
            $status = 'available';
            $msg = __('Congrats! Phone number is available');
        }
        return response()->json([
            'status'=>$status,
            'msg'=>$msg,
            'phone'=>$phone,
        ]);
    }

     public function userRegister(Request $request)
    {
        if ($request->isMethod('post')) {
            $request->validate([
                'first_name' => 'required|regex:/^[a-zA-Z0-9]+$/u|max:191',
                'last_name' => 'required|regex:/^[a-zA-Z0-9]+$/u|max:191',
                'email' => 'required|email|unique:users|max:191',
                'username' => 'required|unique:users|max:191',
                'phone' => 'required|unique:users|max:191',
                'password' => 'required|min:6|max:191',
                'confirm_password' => 'required|same:password',
                'terms_condition' => 'required',
            ]);

            if (!empty(get_static_option('site_google_captcha_enable'))) {
                $request->validate([
                    'recaptchaResponse' => 'required',
                ]);
            }

            $email_verify_token = sprintf("%d", random_int(123456, 999999));

            $user = User::create([
                'first_name' => $request->first_name,
                'last_name' => $request->last_name,
                'email' => $request->email,
                'username' => $request->username,
                'phone' => $request->phone,
                'password' => Hash::make($request->password),
                'user_type' => $request->user_type,
                'terms_condition' => 1,
                'email_verify_token' => $email_verify_token,
            ]);

            Wallet::create([
                'user_id' => $user->id,
                'balance' => 0,
                'remaining_balance' => 0,
                'withdraw_amount' => 0,
                'status' => 1
            ]);

            if ($user) {
                if ($request->user_type == 1) {
                    $user_type = 'client';
                } else {
                    // Add default subscription if any
                    $subscription_details = Subscription::with('subscription_type:id,validity')
                        ->select(['id', 'subscription_type_id', 'price', 'limit'])
                        ->where('id', get_static_option('register_subscription'))
                        ->where('status', '1')->first();

                    if ($subscription_details) {
                        $expire_date = Carbon::now()->addDays($subscription_details?->subscription_type?->validity);
                        UserSubscription::create([
                            'user_id' => $user->id,
                            'subscription_id' => $subscription_details->id,
                            'price' => $subscription_details->price,
                            'limit' => $subscription_details->limit,
                            'expire_date' => $expire_date,
                            'payment_gateway' => 'Trial',
                            'manual_payment_payment' => '',
                            'payment_status' => 'complete',
                            'status' => 1,
                        ]);
                    }

                    $user_type = 'freelancer';
                }

                // Send OTP email only
             try {
                    $otpMessage = '
                        <div style="font-family: Arial, sans-serif; background-color: #f8f9fa; padding: 30px; border-radius: 10px; max-width: 500px; margin: auto; border: 1px solid #e0e0e0;">
                            <h2 style="color: #343a40; font-size: 22px; margin-bottom: 15px;">' . __('Email Verification') . '</h2>
                            <p style="font-size: 16px; color: #555;">' . __('Hi') . ' <strong>' . $user->first_name . ' ' . $user->last_name . '</strong>,</p>
                            <p style="font-size: 15px; color: #333;">' . __('Here is your verification code:') . '</p>
                            <div style="margin: 20px 0; text-align: center;">
                                <span style="display: inline-block; font-size: 32px; font-weight: bold; color: #309400; background: #e9f5ff; padding: 10px 20px; border-radius: 6px;">' . $email_verify_token . '</span>
                            </div>
                            <p style="font-size: 13px; color: #888;">' . __('If you did not request this code, you can safely ignore this email.') . '</p>
                        </div>
                    ';

                    Mail::to($user->email)->send(new BasicMail([
                        'subject' => __('Otp Email'),
                        'message' => $otpMessage
                    ]));
                } catch (\Exception $e) {}


                // Send admin notification
                try {
                    $admin_message = get_static_option('user_register_message') ?? __('A new user has registered.');
                    $admin_message = str_replace(
                        ["@name", "@email", "@username", "@userType"],
                        [$user->first_name . ' ' . $user->last_name, $user->email, $user->username, $user_type],
                        $admin_message
                    );

                    Mail::to(get_static_option('site_global_email'))->send(new BasicMail([
                        'subject' => get_static_option('user_register_subject') ?? __('New User Registration'),
                        'message' => $admin_message
                    ]));
                } catch (\Exception $e) {}

                // Auto login
                if (Auth::guard('web')->attempt(['username' => $request->username, 'password' => $request->password])) {
                    return response()->json(['status' => $request->user_type == 1 ? 'client' : 'freelancer']);
                }
            }
        }

        return view('frontend.user.user-register');
    }


    public function emailVerify(Request $request)
    {
        $user_details = Auth::guard('web')->user();

        if ($request->isMethod('post')) {
            $this->validate($request, [
                'email_verify_token' => 'required|max:191'
            ], [
                'email_verify_token.required' => __('Verify code is required')
            ]);

            $user_match = User::where([
                'email_verify_token' => $request->email_verify_token,
                'email' => $user_details->email
            ])->first();

            if (!is_null($user_match)) {
                $user_match->is_email_verified = 1;
                $user_match->email_verify_token = null;
                $user_match->save();

                try {
                    $user_type = $user_match->user_type == 1 ? 'client' : 'freelancer';

                    $message = get_static_option('user_register_welcome_message') ?? __('Your registration has been successfully completed.');
                    $message = str_replace(
                        ["@name", "@email", "@username", "@password", "@userType"],
                        [
                            $user_match->first_name . ' ' . $user_match->last_name,
                            $user_match->email,
                            $user_match->username,
                            '*****',
                            $user_type
                        ],
                        $message
                    );

                    Mail::to($user_match->email)->send(new BasicMail([
                        'subject' => get_static_option('user_register_welcome_subject') ?? __('Welcome to Our Platform'),
                        'message' => $message
                    ]));
                } catch (\Exception $e) {}

                return $user_match->user_type == 1
                    ? redirect()->route('client.profile')
                    : redirect()->route('freelancer.profile');
            }

            toastr_warning(__('Your verification code is wrong.'));
            return back();
        }

        // Resend OTP if needed
        $verify_token = $user_details->email_verify_token ?? null;

        if (is_null($verify_token)) {
            $verify_token = sprintf("%d", random_int(123456, 999999));
            $user_details->email_verify_token = $verify_token;
            $user_details->save();

            try {
                $message_body = '
                    <div style="font-family: Arial, sans-serif; padding: 20px; background-color: #f9f9f9; border-radius: 8px;">
                        <h2 style="color: #333; font-size: 22px;">' . __('Email Verification') . '</h2>
                        <p style="font-size: 16px; color: #555;">' . __('Your verification code is:') . '</p>
                        <div style="margin: 10px 0;">
                            <span style="font-size: 32px; color: #309400; font-weight: bold;">' . $verify_token . '</span>
                        </div>
                        <p style="font-size: 14px; color: #999;">' . __('This code will expire soon. If you didn\'t request this, you can ignore this email.') . '</p>
                    </div>
                ';

                Mail::to($user_details->email)->send(new BasicMail([
                    'subject' => sprintf(__('Verify your email address - %s'), get_static_option('site_title')),
                    'message' => $message_body
                ]));
            } catch (\Exception $e) {}
        }

        return view('frontend.user.email-verify');
    }



   public function resendCode()
    {
        $user_details = Auth::guard('web')->user();
        $verify_token = $user_details->email_verify_token ?? null;

        try {
            // Generate and save new token if it doesn't exist
            if (is_null($verify_token)) {
                $verify_token = sprintf("%d", random_int(100000, 999999)); // numeric OTP
                $user_details->email_verify_token = $verify_token;
                $user_details->save();
            }

            // Build beautiful HTML email
            $message_body = '
                <div style="font-family: Arial, sans-serif; background-color: #f8f9fa; padding: 30px; border-radius: 10px; max-width: 500px; margin: auto; border: 1px solid #e0e0e0;">
                    <h2 style="color: #343a40; font-size: 22px; margin-bottom: 15px;">' . __('Email Verification') . '</h2>
                    <p style="font-size: 16px; color: #555;">' . __('Hi') . ' <strong>' . $user_details->name . '</strong>,</p>
                    <p style="font-size: 15px; color: #333;">' . __('Here is your verification code:') . '</p>
                    <div style="margin: 20px 0; text-align: center;">
                        <span style="display: inline-block; font-size: 32px; font-weight: bold; color: #309400; background: #e9f5ff; padding: 10px 20px; border-radius: 6px;">' . $verify_token . '</span>
                    </div>
                    <p style="font-size: 13px; color: #888;">' . __('If you did not request this code, you can safely ignore this email.') . '</p>
                </div>
            ';

            Mail::to($user_details->email)->send(new BasicMail([
                'subject' => sprintf(__('Verify your email address - %s'), get_static_option('site_title')),
                'message' => $message_body
            ]));
        } catch (\Exception $e) {
            // You can log error if needed
            // \Log::error('Resend OTP email failed: ' . $e->getMessage());
        }

        return redirect()->back()->with([
            'msg' => __('Verification code resent. Please check your inbox or spam folder.'),
            'type' => 'success'
        ]);
    }

}
