@extends('frontend.layout.master')
@section('site_title',__('Account Setup'))
@section('content')
    <!-- Account Setup area Starts -->
    <div class="account-area pat-100 pab-100">
        <div class="container">
            <div class="setup-header setup-top-border">
                <div class="setup-header-flex">
                    <div class="setup-header-left">
                        <h4 class="setup-header-title">{{ get_static_option('account_page_title') ?? __('Setup Your Account') }}</h4>
                    </div>
                    <!-- <div class="setup-header-right">
                        <a href="{{ route('homepage') }}" class="setup-header-skip">{{ get_static_option('account_page_skip_title') ?? __('Skip') }}</a>
                    </div> -->
                </div>
       
                
<style>
    .identity-verifying-flex {
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap; 
    gap: 10px;
}

.identity-verifying-list {
    flex: 1 1 0;
    min-width: 200px;  
    max-width: 250px;
    padding: 10px;
    box-sizing: border-box;
    background: #f8f8f8;
    border: 1px solid #ccc;
    border-radius: 5px;
    cursor: default;
    pointer-events: none;
}
.identity-verifying-list-contents-details-title {
    font-size: 14px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.identity-verifying-list-contents-flex {
    align-items: center;
    display: flex;
    gap: 8px;
}
.identity-verifying-list.completed {
    pointer-events: none;
    background-color: #d4edda;
    border-color: #309400;
    color: #155724;
    cursor: default;
}

.identity-verifying-list.completed i {
    color: #309400;
}

</style>

<div class="single-profile-settings">
    <div class="single-profile-settings-header">
        <div class="single-profile-settings-header-flex">
            <x-form.form-title :title="__('Profile Info')" :class="'single-profile-settings-header-title'" />
            <div>
                @include('frontend.user.partials.profile_completed_progressbar')
            </div>
        </div>
        <p class="mt-2">{{ __(key: 'Please complete the following four steps to complete your profile setup. This will help us to better understand your skills and experience.') }}</p>
    </div>
    <div class="identity-verifying-form custom-form profile-border-top">
        <div class="identity-verifying-flex">
            <div class="identity-verifying-list custom-radio {{ $step1Complete ? 'completed disabled' : '' }}">
                <div class="identity-verifying-list-flex">
                    <div class="identity-verifying-list-contents">
                        <div class="identity-verifying-list-contents-flex">
                            <div class="identity-verifying-list-contents-icon">
                                <i class="fa-solid fa-user"></i>
                            </div>
                            <div class="identity-verifying-list-contents-details">
                                <h5 class="identity-verifying-list-contents-details-title">{{ __('Personal Information') }}</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="identity-verifying-list custom-radio account-setup-box {{ $step2Complete ? 'completed' : '' }}">
            <!-- <div class="identity-verifying-list custom-radio {{ $step2Complete ? 'completed' : '' }}"> -->
                <div class="identity-verifying-list-flex">
                    <div class="identity-verifying-list-contents">
                    <div class="identity-verifying-list-contents-flex">
                        <div class="identity-verifying-list-contents-icon">
                        <i class="fa-solid fa-user-gear"></i>
                        </div>
                        <div class="identity-verifying-list-contents-details">
                        <h5 class="identity-verifying-list-contents-details-title">{{ __('Account Setup') }}</h5>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
             <div class="identity-verifying-list custom-radio {{ $step4Complete ? 'completed' : '' }}">
                <div class="identity-verifying-list-flex">
                    <div class="identity-verifying-list-contents">
                        <div class="identity-verifying-list-contents-flex">
                            <div class="identity-verifying-list-contents-icon">
                                <i class="fa-solid fa-wallet"></i>
                            </div>
                            <div class="identity-verifying-list-contents-details">
                                <h5 class="identity-verifying-list-contents-details-title">{{ __('Wallet') }}</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="identity-verifying-list custom-radio {{ $step3Complete ? 'completed' : '' }}">
                <div class="identity-verifying-list-flex">
                    <div class="identity-verifying-list-contents">
                        <div class="identity-verifying-list-contents-flex">
                            <div class="identity-verifying-list-contents-icon">
                                <i class="fa-solid fa-fingerprint"></i>
                            </div>
                            <div class="identity-verifying-list-contents-details">
                                <h5 class="identity-verifying-list-contents-details-title">{{ __('Identity Verification') }}</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

            </div>
            <div class="setup-wrapper setup-top-border setup-bottom-border">
                <div class="setup-wrapper-flex">
                    <div>
                        @include('frontend.user.freelancer.account.sidebar')
                    </div>
                    <div>
                        @include('frontend.user.freelancer.account.introduction')
                        @include('frontend.user.freelancer.account.experience.experience')
                        @include('frontend.user.freelancer.account.education.education')
                        @include('frontend.user.freelancer.account.work.work')
                        @include('frontend.user.freelancer.account.skill.skill')
                        @include('frontend.user.freelancer.account.hourly.hourly-rate')
                        @include('frontend.user.freelancer.account.pre-next')
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Account Setup area end -->
@endsection

{{--todo register script--}}
@section('script')
    @include('frontend.user.freelancer.account.account-setup-js')
@endsection



