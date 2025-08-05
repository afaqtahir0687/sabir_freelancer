<?php

namespace Modules\Subscription\Http\Controllers\Frontend;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Modules\Subscription\Entities\Subscription;
use Modules\Subscription\Entities\SubscriptionType;
use Modules\Subscription\Entities\UserSubscription;
use Carbon\Carbon;


class FrontendSubscriptionController extends Controller
{
    public function subscriptions()
    {
        $subscription_types = SubscriptionType::with('subscriptions')->whereHas('subscriptions')
            ->select('id', 'type', 'validity')->get();
    
        $subscriptions = Subscription::with(['features', 'subscription_type'])->where('status', 1)->orderBy('price', 'asc')
            ->select(['id', 'subscription_type_id', 'title', 'logo', 'price', 'limit'])->paginate(18);
    
        $current_plan_id = null;
        $current_plan_price = null;
    
        if (auth()->check()) {
            $user_subscription = UserSubscription::where('user_id', auth()->id())->where('status', 1)->where('expire_date', '>', now())
                ->orderBy('expire_date', 'asc')->first();
    
            $current_plan_id = $user_subscription?->subscription_id;
            $current_plan_price = $user_subscription?->subscription?->price;
    
            if ($user_subscription && $user_subscription->expire_date > now()) {
                $current_plan_id = $user_subscription->subscription_id;
                $current_plan_price = $user_subscription->subscription->price;
            } else {
                $current_plan_id = null;
                $current_plan_price = null;
            }
        }
    
        return view('subscription::frontend.subscriptions.subscriptions', compact(
            'subscription_types', 'subscriptions', 'current_plan_id', 'current_plan_price'
        ));
    }
    
    public function downgradeSubscription(Request $request)
    {
        $user = auth()->user();
        $subscription_id = $request->subscription_id;
    
        $current_subscription = UserSubscription::where('user_id', $user->id)
            ->where('status', 1)
            ->where('expire_date', '>', now())
            ->first();
            
        if ($current_subscription) {
    
            $new_subscription = Subscription::findOrFail($subscription_id);
            
            $new_user_subscription = new UserSubscription();
            $new_user_subscription->user_id = $user->id;
            $new_user_subscription->subscription_id = $subscription_id;
            $new_user_subscription->status = 2;  
    
            $new_user_subscription->expire_date = Carbon::now()->addDays($new_subscription->subscription_type->validity);
    
            $new_user_subscription->price = $new_subscription->price; 
            $new_user_subscription->limit = $new_subscription->limit; 
            $new_user_subscription->save();
    
            return response()->json(['status' => 'success']);
        }
    
        return response()->json(['status' => 'failed', 'msg' => 'No active subscription found']);
    }
    

    // pagination
    function pagination(Request $request)
    {
        if($request->ajax()){
            $subscriptions = Subscription::with(['features','subscription_type'])->latest()->select(['id','subscription_type_id','title','logo','price','limit'])->paginate(12);
            return view('subscription::frontend.subscriptions.search-result', compact('subscriptions'))->render();
        }
    }

    // subscription filter
    public function filter_subscriptions(Request $request)
    {
        $type_id = $request->type_id;

        if ($type_id == 'all') {
            $subscriptions = Subscription::with(['features','subscription_type'])
                ->select(['id','subscription_type_id','title','logo','price','limit'])
                ->where('status', 1)->orderBy('price', 'asc')
                ->paginate(18);
        } else {
            $subscriptions = Subscription::with(['features','subscription_type'])
                ->select(['id','subscription_type_id','title','logo','price','limit'])
                ->where('subscription_type_id', $type_id)
                ->where('status', 1)
                ->orderBy('price', 'asc')->get();
        }

        $current_plan_id = null;
        if (auth()->check()) {
            $activeSubscription = UserSubscription::where('user_id', auth()->id())
                ->where('status', 1)
                ->where('expire_date', '>', now())
                ->orderBy('expire_date', 'asc')
                ->first();

            $current_plan_id = $activeSubscription?->subscription_id ?? null;
        }

        return $subscriptions->count() >= 1
            ? view('subscription::frontend.subscriptions.search-result', compact(['subscriptions', 'type_id', 'current_plan_id']))->render()
            : response()->json(['status' => 'nothing']);
    }
    //user login
    public function user_login(Request $request)
    {
        $email_or_username = filter_var($request->username, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';
        $request->validate([
            'username' => 'required|string',
            'password' => 'required|min:6'
        ],
        [
            'username.required' => sprintf(__('%s is required'),$email_or_username),
            'password.required' => __('password is required')
        ]);

        return Auth::guard('web')->attempt([$email_or_username => $request->username, 'password' => $request->password])
        ? response()->json(['status' => 'success','balance' => Auth::user()->user_wallet->balance ?? 0 ])
        : response()->json(['msg' => sprintf(__('Your %s or Password Is Wrong !!'),$email_or_username),'status' => 'failed']);
    }
}
