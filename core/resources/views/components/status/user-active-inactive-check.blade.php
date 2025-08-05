@if(Cache::has('user_is_online_'.$userID))
    <span class="single-freelancer-author-status"> {{ __('Online') }} </span>
@else
    <span class="single-freelancer-author-status-ofline"> {{ __('Offline') }} </span>
@endif