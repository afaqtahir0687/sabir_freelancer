@extends('frontend.layout.master')
@section('site_title',__('Ad Management'))
@section('style')
    <style>
        .total_balance{background-color: #e3e1ff !important;}
    </style>
@endsection

@section('content')
    <main>
        <x-breadcrumb.user-profile-breadcrumb :title="__('Ad Management')" :innerTitle="__('Ad Management')"/>
        <!-- Profile Settings area Starts -->
        <div class="responsive-overlay"></div>
        <div class="profile-settings-area pat-100 pab-100 section-bg-2">
            <div class="container">
                <div class="row g-4">
                    @include('frontend.user.layout.partials.sidebar')
                    <div class="col-xl-9 col-lg-8">
                        <div class="profile-settings-wrapper">

                            <div class="single-profile-settings">
                                <div class="single-profile-settings-header">
                                    <div class="single-profile-settings-header-flex">
                                        <x-form.form-title :title="__('Ad List')" :class="'single-profile-settings-header-title'" />
                                        <a href="{{ route('ad.create') }}" class="btn-profile btn-bg-1"> {{ __('Create Ad') }} </a>
                                    </div>
                                </div>
                                <div class="single-profile-settings-inner profile-border-top">
                                    <div class="custom_table style-04">
                                        @include('frontend.user.partials.ad_table', ['isFreelancer' => true])
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>



                </div>
            </div>
        </div>
        <!-- Profile Settings area end -->
    </main>
@endsection
