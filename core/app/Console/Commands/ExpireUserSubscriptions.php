<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Modules\Subscription\Entities\UserSubscription;
use Carbon\Carbon;

class ExpireUserSubscriptions extends Command
{
    protected $signature = 'subscriptions:expire';
    protected $description = 'Expire current user subscriptions and activate next pending subscription if available.';

    public function handle()
    {
        $now = Carbon::now();

        $expiredSubscriptions = UserSubscription::where('status', 1)
            ->where('expire_date', '<', $now)->get();

        foreach ($expiredSubscriptions as $expired) {

            $expired->status = 0;
            $expired->save();

            $nextPending = UserSubscription::where('user_id', $expired->user_id)
                ->where('status', 2)->orderBy('created_at', 'asc')->first();

            if ($nextPending) {
                $nextPending->status = 1; 
                $nextPending->save();
            }
        }

        $this->info('Expired subscriptions updated and next pending subscriptions activated.');
    }
}
