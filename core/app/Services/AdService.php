<?php

namespace App\Services;

use App\Exceptions\WalletInsufficientBalance;
use App\Exceptions\WalletNotFoundException;
use App\Models\Ad;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Modules\Wallet\Entities\Wallet;

class AdService
{
    public function payByWallet(Request $request)
    {
        $ad = Ad::findOrFail($request->id);

        $adTotalPrice = $ad->ppq * $ad->quantity;
        $wallet = Wallet::where('user_id', auth()->id())->first();

        throw_if(empty($wallet), WalletNotFoundException::class);
        throw_if($wallet->balance < $adTotalPrice, WalletInsufficientBalance::class);

        $ad->update(['is_paid' => true, 'gateway_slug' => 'wallet', 'status' => 'active']);
        $wallet->update([
            'balance' => $wallet->balance - $adTotalPrice
        ]);
    }
}