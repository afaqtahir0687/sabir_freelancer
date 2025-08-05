<?php

namespace App\Http\Controllers\Frontend\Client;

use App\Exceptions\WalletInsufficientBalance;
use App\Exceptions\WalletNotFoundException;
use App\Http\Controllers\Controller;
use App\Models\Ad;
use App\Services\AdService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

class AdController extends Controller
{
    public function index()
    {
        $ads = Ad::where('user_id', Auth::id())->latest()->get();
        return view('frontend.user.client.ad.list', compact('ads'));
    }

    public function pay(Request $request)
    {
        $this->validate($request, [
            'id' => ['required', Rule::exists('ads', 'id')->where('user_id', auth()->id())],
        ]);

        try {
            DB::beginTransaction();
            (new AdService())->payByWallet($request);
            DB::commit();
        }catch (WalletNotFoundException $exception){
            return back()->with(toastr_error('Wallet not found'));
        }catch (WalletInsufficientBalance $exception){
            return back()->with(toastr_warning('Insufficient balance'));
        }

        return redirect()->route('client.ad.manage')->with(toastr_success('Payment successfull'));
    }
}
