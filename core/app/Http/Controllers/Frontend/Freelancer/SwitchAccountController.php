<?php

namespace App\Http\Controllers\Frontend\Freelancer;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class SwitchAccountController extends Controller
{
    public function switch()
    {
        $user = Auth::user();
        $newUserType = $user->user_type == 1 ? 2 : 1;

        Auth::logout();
        $user->update(['user_type' => $newUserType]);
        Auth::login($user);

        if ($newUserType == 1) {
            return redirect()->route('client.dashboard');
        } else {
            return redirect()->route('freelancer.dashboard');
        }
    }
}


