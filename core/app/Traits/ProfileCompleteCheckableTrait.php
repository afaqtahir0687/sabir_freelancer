<?php

namespace App\Traits;

use App\Models\User;
use Illuminate\Support\Facades\Auth;

trait ProfileCompleteCheckableTrait
{
    public function getUserProfileCompletionParam(User $user): array
    {
        $profileCompleteParameter = [
            'profile' => false,
            'email_verification' => false,
            'user_verification' => false,
        ];
        if($user->country_id){
            $profileCompleteParameter['profile'] = true;
        }
//        if($user->google_2fa_enable_disable_disable){
//            $profileCompleteParameter['2fa'] = true;
//        }
        if($user->is_email_verified){
            $profileCompleteParameter['email_verification'] = true;
        }
        if($user->user_verified_status){
            $profileCompleteParameter['user_verification'] = true;
        }

        return $profileCompleteParameter;
    }
    public function checkProfileIsComplete(User $user): bool
    {
        $profileCompleteParameter = $this->getUserProfileCompletionParam($user);
        foreach ($profileCompleteParameter as $value) {
            if (!$value) {
                return false;
            }
        }

        return true;
    }
    public function getProfileCompleteInPercent(User $user): float
    {
        $profileCompleteParameter = $this->getUserProfileCompletionParam($user);

        $totalParameters = count($profileCompleteParameter);
        $completedParameters = 0;

        foreach ($profileCompleteParameter as $value) {
            if ($value) {
                $completedParameters++;
            }
        }

        return round(($completedParameters / $totalParameters) * 100);
    }
}