<?php

namespace App\View\Composers;

use App\Traits\ProfileCompleteCheckableTrait;
use Illuminate\View\View;

class ProfileComposer
{
    use ProfileCompleteCheckableTrait;

    public function compose(View $view): void
    {
        $view->with('profile_percent_completed', $this->getProfileCompleteInPercent(auth('web')->user()));
    }
}