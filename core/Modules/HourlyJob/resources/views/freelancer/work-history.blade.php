@extends('frontend.layout.master')
@section('site_title', __('Order Details'))
@section('style')
    <x-summernote.summernote-css />
    <style>
        .user-details-manage-list {display: flex;flex-direction: column;gap: 10px}
        .myOrder-single-content-para,
        .show_order_submit_description
        {white-space: pre-line}
    </style>
@endsection
@section('content')
    <main>
        <x-frontend.category.category />
        <x-breadcrumb.user-profile-breadcrumb :title="__('Work History')" :innerTitle="__('Work History')"/>

        <!-- Profile Details area Starts -->
        <div class="profile-area pat-100 pab-100 section-bg-2">
            <div class="container">

                <div class="row g-4">
                    <div class="col-lg-8">
                        <div class="myOrder-single bg-white padding-20 radius-10">
                            <div class="myOrder-single-item">
                                <x-validation.error />
                                <div class="myOrder-single-flex">
                                    <div class="myOrder-single-content">
                                        <span class="myOrder-single-content-id">#000{{ $order_details->id }}</span>
                                        <h4 class="myOrder-single-content-title mt-2">
                                            @if($order_details->is_project_job == 'project')
                                                <a href="javascript:void(0)"> {{ $order_details?->project->title ?? '' }} </a>
                                            @elseif($order_details->is_project_job == 'job')
                                                <a href="javascript:void(0)">{{ $order_details?->job->title ?? '' }}</a>
                                            @else
                                                {{ __('Custom order')}}
                                            @endif
                                        </h4>
                                        <div class="myOrder-single-content-btn flex-btn mt-3">
                                            <x-order.order-status :status="$order_details->status" />
                                            <x-order.is-custom :isCustom="$order_details->is_project_job" />
                                            <x-order.payment-verify :paymentVerifyCheck="$order_details" />
                                        </div>
                                    </div>
                                    <span class="myOrder-single-content-time">{{ $order_details->created_at->diffForHumans() }} </span>
                                </div>
                            </div>
                        </div>
                            <div class="myOrder-single bg-white padding-20 radius-10">
                                <div class="row g-4">

                                    <div class="col-xxl-3 col-lg-6 col-sm-6 col-md-4">
                                        <div class="myJob-wrapper-single-balance">
                                            <div class="myJob-wrapper-single-balance-contents">
                                                <div class="myJob-wrapper-single-balance-price d-flex gap-2 justify-content-between">
                                                    @if($order_details->status === 3)
                                                        <h4 class="contract_single__balance-price">{{ float_amount_with_currency_symbol($order_details->payable_amount) }}</h4>
                                                    @else
                                                        @php $earnings = \App\Models\OrderMilestone::where('order_id',$order_details->id)->where('status',2)->sum('price'); @endphp
                                                        <h4 class="contract_single__balance-price">{{ float_amount_with_currency_symbol($earnings)  }}</h4>
                                                    @endif
                                                    <span class="myJob-wrapper-single-balance-icon hover-question">
                                                        <i class="fa-solid fa-question"></i>
                                                        <span class="hover-active-content">{{ __('Earned balance means how much amount you have received for this order.') }}</span>
                                                    </span>
                                                </div>
                                                <p class="myJob-wrapper-single-balance-para">{{ __('Earned Balance') }}</p>
                                            </div>
                                        </div>
                                    </div>

                                    @if($order_details->is_fixed_hourly == 'hourly' && $order_details->status != 3)
                                        <div class="col-xxl-3 col-lg-6 col-sm-6 col-md-4">
                                            <div class="myJob-wrapper-single-balance">
                                                <div class="myJob-wrapper-single-balance-contents">
                                                    <div class="myJob-wrapper-single-balance-price d-flex gap-2 justify-content-between">
                                                        <h4 class="contract_single__balance-price">{{ float_amount_with_currency_symbol($order_details?->job->hourly_rate) }} </h4>
                                                        <span class="myJob-wrapper-single-balance-icon hover-question">
                                                            <i class="fa-solid fa-question"></i>
                                                            <span class="hover-active-content">{{ __('Hourly rate means how much amount client will pay for each hour after complete the order.') }}</span>
                                                        </span>
                                                    </div>
                                                    <p class="myJob-wrapper-single-balance-para">{{ __('Hourly Rate') }}</p>
                                                </div>
                                            </div>
                                        </div>
                                    @else
                                        <div class="col-xxl-3 col-lg-6 col-sm-6 col-md-4">
                                            <div class="myJob-wrapper-single-balance">
                                                <div class="myJob-wrapper-single-balance-contents">
                                                    <div class="myJob-wrapper-single-balance-price d-flex gap-2 justify-content-between">
                                                            @if($order_details->status != 3 && $order_details->payment_status != '')
                                                                <h4 class="contract_single__balance-price">{{ float_amount_with_currency_symbol($order_details->payable_amount) }}</h4>
                                                            @else
                                                                <h4 class="contract_single__balance-price">{{ site_currency_symbol() }} 0</h4>
                                                            @endif
                                                        <span class="myJob-wrapper-single-balance-icon hover-question">
                                                        <i class="fa-solid fa-question"></i>
                                                        <span class="hover-active-content">{{ __('Pending amount means how much amount you will get after complete this order.') }}</span>
                                                    </span>
                                                    </div>
                                                    <p class="myJob-wrapper-single-balance-para">{{ __('Pending Balance') }}</p>
                                                </div>
                                            </div>
                                        </div>
                                    @endif

                                    @if($order_details->is_fixed_hourly == 'hourly' && $order_details->status != 3)
                                        <div class="col-xxl-3 col-lg-6 col-sm-6 col-md-4">
                                            <div class="myJob-wrapper-single-balance">
                                                <div class="myJob-wrapper-single-balance-contents">
                                                    <div class="myJob-wrapper-single-balance-price d-flex gap-2 justify-content-between">
                                                        <span class="price-title">{{ $order_details?->job->estimated_hours }}</span>
                                                        <span class="myJob-wrapper-single-balance-icon hover-question">
                                                        <i class="fa-solid fa-question"></i>
                                                        <span class="hover-active-content">{{ __('Estimated hours refer to the approximate time a client can set for completing the order. The client can adjust this time before accepting the order.') }}</span>
                                                    </span>
                                                    </div>
                                                    <p class="myJob-wrapper-single-balance-para">{{ __('Estimated Hours') }}</p>
                                                </div>
                                            </div>
                                        </div>
                                    @else
                                        <div class="col-xxl-3 col-lg-6 col-sm-6 col-md-4">
                                            <div class="myJob-wrapper-single-balance">
                                                <div class="myJob-wrapper-single-balance-contents">
                                                    <div class="myJob-wrapper-single-balance-price d-flex gap-2 justify-content-between">
                                                        <span class="price-title">{{ float_amount_with_currency_symbol($order_details->commission_amount) }}</span>
                                                        <span class="myJob-wrapper-single-balance-icon hover-question">
                                                        <i class="fa-solid fa-question"></i>
                                                        <span class="hover-active-content">{{ __('Commission amount means how much amount admin will get from this order.') }}</span>
                                                    </span>
                                                    </div>
                                                    <p class="myJob-wrapper-single-balance-para">{{ __('Commission Amount') }}</p>
                                                </div>
                                            </div>
                                        </div>
                                    @endif

                                    @if($order_details->is_fixed_hourly == 'hourly' && $order_details->status != 3)
                                        <div class="col-xxl-3 col-lg-6 col-sm-6 col-md-4">
                                            <div class="myJob-wrapper-single-balance">
                                                <div class="myJob-wrapper-single-balance-contents">
                                                    <div class="myJob-wrapper-single-balance-price d-flex gap-2 justify-content-between">
                                                        <span class="price-title">{{ float_amount_with_currency_symbol($order_details->price) }}</span>
                                                        <span class="myJob-wrapper-single-balance-icon hover-question">
                                                        <i class="fa-solid fa-question"></i>
                                                        <span class="hover-active-content">{{ __('The approximate budget indicates the expected payment for this order. This amount may vary depending on the rate and the estimated working hours.') }}</span>
                                                    </span>
                                                    </div>
                                                    <p class="myJob-wrapper-single-balance-para">{{ __('Approximate  Budget') }}</p>
                                                </div>
                                            </div>
                                        </div>
                                    @else
                                        <div class="col-xxl-3 col-lg-6 col-sm-6 col-md-4">
                                            <div class="myJob-wrapper-single-balance">
                                                <div class="myJob-wrapper-single-balance-contents">
                                                    <div class="myJob-wrapper-single-balance-price d-flex gap-2 justify-content-between">
                                                        <span class="price-title">{{ float_amount_with_currency_symbol($order_details->price) }}</span>
                                                        <span class="myJob-wrapper-single-balance-icon hover-question">
                                                        <i class="fa-solid fa-question"></i>
                                                        <span class="hover-active-content">{{ __('Total budget means how much client will pay for this order.') }}</span>
                                                    </span>
                                                    </div>
                                                    <p class="myJob-wrapper-single-balance-para">{{ __('Total Budget') }}</p>
                                                </div>
                                            </div>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    <div class="col-lg-4">
                            <div class="profile-details-widget sticky_top_lg">
                                <div class="jobFilter-wrapper-item">
                                    <div class="jobFilter-about-clients">
                                        <div class="jobFilter-proposal-author-flex">
                                        <span class="user-details-manage-thumb">
                                            <div class="myOrder-single-block-item-author">
                                                <x-order.profile-image :image="$order_details?->user->image" :loadFrom="$order_details?->user->load_from" />
                                            </div>
                                        </span>
                                            <div class="jobFilter-proposal-author-contents">
                                                <h5 class="single-freelancer-author-name">
                                                    {{ $order_details?->user->first_name }}
                                                    {{ $order_details?->user->last_name }}
                                                    @if(Cache::has('user_is_online_' . $order_details?->user->id))
                                                        <span class="single-freelancer-author-status"> {{ __('Active') }} </span>
                                                    @else
                                                        <span class="single-freelancer-author-status-ofline"> {{ __('Inactive') }} </span>
                                                    @endif
                                                </h5>
                                                <p class="jobFilter-proposal-author-contents-subtitle mt-2">
                                                    @if($order_details?->user?->user_state?->state != null)
                                                        {{ $order_details?->user?->user_state?->state }},
                                                    @endif
                                                    {{ $order_details?->user?->user_country?->country }}
                                                    @if($order_details?->user?->user_verified_status == 1) <i class="fas fa-circle-check"></i>@endif

                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="jobFilter-about-clients">
                                        <div class="jobFilter-about-clients-single flex-between">
                                            <div class="jobFilter-about-clients-flex">
                                        <span class="jobFilter-about-clients-icon">
                                            <img
                                                    src="{{ asset('assets/static/icons/member_since.svg') }}" alt="">
                                        </span>
                                                <span class="jobFilter-about-clients-para"> {{ __('Member since') }} </span>
                                            </div>
                                            <h6 class="jobFilter-about-clients-completed">
                                                {{ $order_details?->user->created_at->toFormattedDateString() ?? '' }}
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="jobFilter-about-clients">
                                        <div class="jobFilter-about-clients-single flex-between">
                                            <div class="jobFilter-about-clients-flex">
                                    <span class="jobFilter-about-clients-icon">
                                        <img src="{{ asset('assets/static/icons/job_post.svg') }}" alt="">
                                    </span>
                                                <span class="jobFilter-about-clients-para">{{ __('Total Job') }}</span>
                                            </div>
                                            <h6 class="jobFilter-wrapper-item-completed">{{ $order_details?->user?->user_jobs?->count() }}</h6>
                                        </div>
                                    </div>

                                    @php
                                        $total_job = App\Models\JobPost::where('user_id', $order_details?->user->id)->count();
                                        $total_order = App\Models\Order::where('user_id', $order_details?->user->id)
                                            ->where('status', 3)
                                            ->count();

                                        $hiring_rate = '';
                                         if ($total_job > 0) {
                                           $hiring_rate = ($total_order * 100) / $total_job;
                                        }
                                    @endphp

                                    @if ($hiring_rate >= 1)
                                        <div class="jobFilter-about-clients">
                                            <div class="jobFilter-about-clients-single flex-between">
                                                <div class="jobFilter-about-clients-flex">
                                        <span class="jobFilter-about-clients-icon"> <img
                                                    src="{{ asset('assets/static/icons/hire_rate.svg') }}"
                                                    alt=""> </span>
                                                    <span class="jobFilter-about-clients-para">{{ __('Hire rate') }}</span>
                                                </div>
                                                <h6 class="jobFilter-wrapper-item-completed"> @if($hiring_rate > 100) 100% @else {{ round($hiring_rate) ?? 0 }}% @endif
                                                </h6>
                                            </div>
                                        </div>
                                    @endif

                                </div>
                            </div>
                        </div>
                </div>

                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="myJob-tabs mt-5">
                            <ul class="tabs">
                                <li data-tab="Description" class="active"> {{ __('Work History') }} </li>
                                <li data-tab="workHour"> {{ __('Total Work Hours') }} </li>
                            </ul>
                            <div class="tab-content-item mt-4 active" id="Description">
                                <div class="myOrder-single bg-white padding-20 radius-10">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>{{ __('Start Date') }}</th>
                                            <th>{{ __('End Date') }}</th>
                                            <th>{{ __('Work Hours') }}</th>
                                            <th>{{ __('Note') }}</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($all_histories as $history)
                                            <tr>
                                                <td>{{ $history->start_date }}</td>
                                                <td>{{ $history->end_date }}</td>
                                                <td>{{ $history->hours_worked }}</td>
                                                <td>{{ $history->notes }}</td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>

                                    <div class="deposit-history-pagination mt-4">
                                        <div class="custom_pagination mt-5">
                                            {{ $all_histories->links() }}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content-item mt-4" id="workHour">
                                <div class="myOrder-single bg-white padding-20 radius-10 d-flex gap-5">
                                    @php
                                        $decimalHours = number_format($total_work_time,2) ;
                                        $hours = floor($decimalHours);
                                        $minutes = ($decimalHours - $hours) * 60;
                                    @endphp
                                    @if($hours >= (int)(get_static_option('minimum_hour_for_realtime_earning') ?? 1))
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <h5>{{ __('Work Time So Far:') }} <small class="text-success fs-5">@php echo $hours . 'h ' . round($minutes) . 'm'; @endphp</small></h5>
                                                <br>
                                                <h5>{{ __('Earning So Far:') }} <small class="text-success fs-5">{{ float_amount_with_currency_symbol($order_total_amount_calculate) }}</small></h5>
                                            </div>
                                            <div class="col-lg-8">
                                                <x-notice.general-notice :description="__('Notice: Earnings are calculated based on your current work history. The client can manually adjust the work time if desired, which may result in changes to the earnings.')" />
                                            </div>
                                        </div>
                                    @else
                                        <h5>{{ __('No earnings yet to show.') }} </h5>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- Profile Details area end -->
    </main>
@endsection

