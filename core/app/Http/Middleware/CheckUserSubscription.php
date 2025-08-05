<?php


namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Modules\Subscription\Entities\UserSubscription;
use Carbon\Carbon;

class CheckUserSubscription
{
    public function handle(Request $request, Closure $next)
    {
        if (Auth::check()) {
            $user = Auth::user();

            $activeSubscription = UserSubscription::where('user_id', $user->id)
                ->where('status', 1)
                ->where('expire_date', '>=', now())
                ->first();

            if (!$activeSubscription) {
                $pendingSubscription = UserSubscription::where('user_id', $user->id)
                    ->where('status', 2)
                    ->where('expire_date', '>=', now())
                    ->first();

                if ($pendingSubscription) {

                    $paymentRoute = route('payment.index', ['subscription_id' => $pendingSubscription->id]);

                    if ($request->url() !== $paymentRoute) {
                        return redirect($paymentRoute)->with('error', 'Please complete your pending subscription payment.');
                    }
                }
            }
        }

        return $next($request);
    }
}

