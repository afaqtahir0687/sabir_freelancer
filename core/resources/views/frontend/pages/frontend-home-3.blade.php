@php use App\Models\JobPost;use App\Models\Project;use App\Models\User;use Illuminate\Support\Facades\Cache;use
Illuminate\Support\Facades\DB;use Modules\Service\Entities\Category;use
plugins\PageBuilder\Addons\Category\CategoryProjectOne;use plugins\PageBuilder\PageBuilderSetup; @endphp
@extends('frontend.layout.master')

@section('content')
    <!-- Banner area Starts -->
    <div class="banner-area banner-area-padding section-bg-1" data-padding-top="64" data-padding-bottom="59" style="">
        <div class="container">
            <div class="row gy-5 align-items-center flex-column-reverse flex-lg-row">
                <div class="col-lg-7">
                    <div class="banner-single">
                        <div class="banner-single-content">
                            <h1 class="banner-single-content-title"> Hire Right Freelancer <br />At Right Time For Any
                                Job Online</h1>
                            <p class="banner-single-content-para">

                                Connect to over 1M freelancer experts with World’s Fastest and most Affordable Freelance
                                platform. </p>

                            <div class="btn-wrapper flex-btn mt-5">
                                <a href="/jobs" class="cmn-btn btn-bg-1"> Find Job </a>
                                <a href="/projects" class="cmn-btn btn-outline-1 color-one"> Find Project </a>
                            </div>
                            <div class="banner-single-content-logo mt-5">
                                <h5 class="banner-single-content-logo-title"> Trusted by: </h5>
                                <ul class="banner-single-content-logo-list list-style-none my-4">
                                    <li class="banner-single-content-logo-list-item">
                                        <span class="banner-single-content-logo-list-link">
                                            <img src="{{asset('assets/frontend/img/trust1.jpg')}}" alt="" />
                                        </span>
                                    </li>
                                    <li class="banner-single-content-logo-list-item">
                                        <span class="banner-single-content-logo-list-link">
                                            <img src="{{asset('assets/frontend/img/trust2.jpg')}}" alt="" />
                                        </span>
                                    </li>
                                    <li class="banner-single-content-logo-list-item">
                                        <span class="banner-single-content-logo-list-link">
                                            <img src="{{asset('assets/frontend/img/trust3.jpg')}}" alt="" />
                                        </span>
                                    </li>
                                    <li class="banner-single-content-logo-list-item">
                                        <span class="banner-single-content-logo-list-link">
                                            <img src="{{asset('assets/frontend/img/trust4.jpg')}}" alt="" />
                                        </span>
                                    </li>
                                    <!-- <li class="banner-single-content-logo-list-item">
                                        <span class="banner-single-content-logo-list-link">
                                            <img src="{{asset('assets/frontend/img/trust1.jpg')}}" alt="" />
                                        </span>
                                    </li> -->
                                    <li class="banner-single-content-logo-list-item">
                                        <a href="https://www.ssl.com/" target="_blank" class="banner-single-content-logo-list-link">
                                            <img src="{{ asset('assets/frontend/img/ssl.png') }}" alt="SSL Secured" style="max-height: 40px;" />
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="banner-right-content">
                        <div class="banner-right-content-thumb wow slideInUp" data-wow-delay=".4s">
                            <img src="/assets/static/img/banner/banner.png" alt="img">
                        </div>
                        <div class="banner-right-content-shape">
                            <img src="/assets/img-shape117035905251703684257.svg" alt="" />
                            <img src="/assets/img-shape217035905251703684257.svg" alt="" />
                        </div>

                        @if($topFreelancers->count())
                            @php $topOne = $topFreelancers->first(); @endphp
                            <div class="banner-right-content-bottom text-center mb-4">
                                <div class="banner-right-content-profile wow fadeIn" data-wow-delay=".4s">
                                    <div
                                        class="banner-right-content-profile-flex align-items-center d-flex justify-content-center gap-3">
                                        <div class="banner-right-content-profile-thumb">
                                            <img src="{{ asset('assets/uploads/profile/' . $topOne->image) }}"
                                                alt="{{ $topOne->first_name }}">
                                        </div>
                                        <div class="banner-right-content-profile-content">
                                            <h6 class="mt-3">{{ $topOne->first_name }} {{ $topOne->last_name }}</h6>
                                            <p>Our Top Freelancer</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endif

                        <div class="banner-right-content-top">
                            <div class="banner-right-content-rating wow zoomIn" data-wow-delay=".3s">
                                <div class="banner-right-content-rating-icon">
                                    <img src="/assets/static/img/banner/rating.svg" alt="rating">
                                </div>
                               
                                    {!! freelancer_rating_for_profile_details_page($topOne->id) !!}
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner area end -->

    <!-- Choose area starts -->
    <section class="choose-area" data-padding-top="102" data-padding-bottom="75">
        <div class="container">
            <div class="row gy-5">
                <div class="col-lg-6">
                    <div class="choose-contents">
                        <div class="section-title">
                            <div class="subtitle"><span> Why choose us? </span></div>
                            <h2 class="title"> We value each relationship on our platform</h2>
                            <p class="section-para">Our Freelancers aren&#039;t Bots; they&#039;re human beings with a
                                sense of humour within the bounds of their job. We believe in forming long-term
                                relationships with both our Talent &amp; our Clients.</p>
                        </div>
                        <ul class="choose-contents-list mt-4">
                            <li class="choose-contents-list-item">Less fees</li>
                            <li class="choose-contents-list-item">Live support</li>
                            <li class="choose-contents-list-item">No fees for client</li>
                            <li class="choose-contents-list-item">Verified users</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="choose-wrapper">
                        <div class="choose-wrapper-thumb-shapes">
                            <img src="/assets/choose_thumb_shape1717413870.svg" alt="" />
                        </div>
                        <div class="choose-wrapper-thumb">
                            <img src="/assets/choose_thumb1717413871.png" alt="" />
                        </div>
                        <div class="choose-wrapper-shapes">
                            <img src="/assets/choose_shapes1717413916.png" alt="" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Choose area ends -->

    @php
        $projectPromotionWidget = \App\Models\PageBuilder::where('addon_name', 'ProjectPromotion')->first();
    @endphp
    {!! plugins\PageBuilder\PageBuilderSetup::render_widgets_by_name_for_frontend(plugins\PageBuilder\PageBuilderSetup::getWidgetArgs($projectPromotionWidget)) !!}

    @php
        $promotionProfile = \App\Models\PageBuilder::where('addon_name', 'ProfilePromotion')->first();
    @endphp
    {!! plugins\PageBuilder\PageBuilderSetup::render_widgets_by_name_for_frontend(plugins\PageBuilder\PageBuilderSetup::getWidgetArgs($promotionProfile)) !!}

    
    <!-- How it Works  Clients area starts -->
    <section class="category-area pat-50 pab-50 section-bg-1" data-padding-top="50" data-padding-bottom="50" style="">
        <div class="container">
            <div class="section-title center-text">
                <h2 class="title"> How it Works For Clients </h2>
                <p>SPost the work you want as a job offer. Allow freelancers to apply and fulfill your work. Be
                    satisfied. Pay them and give them a review.</p>
            </div>
            <div class="row gy-4 mt-4">
                <div class="col-lg-12">
                    <div class="heading">
                        <div class="how-to-sec">
                            <div class="how-to"><span class="how-icon"><i class="la la-search-plus"></i></span>
                                <h3>Post a job</h3>
                                <p>Post a job and the required skills. We will help you match with the right talent in
                                    no time.</p>
                            </div>
                            <div class="how-to"><span class="how-icon"><i class="la la-user"></i></span>
                                <h3>Hire an Right Applicant</h3>
                                <p>Get instant access to the Right Freelancer Profiles, compare the proposals, chat in
                                    real time and award the job that suits best to your needs.
                                </p>
                            </div>
                            <div class="how-to"><span class="how-icon"><i class="la la-suitcase"></i></span>
                                <h3>Get the Work Done</h3>
                                <p>Share your digital assets in Right Freelancer secure environment and get the work
                                    done on the agreed time.</p>
                            </div>
                            <div class="how-to"><span class="how-icon"><i class="la la-cc-mastercard"></i></span>
                                <h3>Pay and Review</h3>
                                <p>Pay the Right Freelancer for the work you authorize and satisfied through easier
                                    Paypal, Matercard, or visa global payments system.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="browse-all-cat"><a href="{{route('client.job.create')}}" title="">Post Your Job FREE</a>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- How it Works For Clients area end -->


    @php
        $categoryProjectOneWidget = \App\Models\PageBuilder::where('addon_name', 'CategoryProjectOne')->first();
        $CategoryJobOne = \App\Models\PageBuilder::where('addon_name', 'CategoryJobOne')->first();
    @endphp
    {!! PageBuilderSetup::render_widgets_by_name_for_frontend(PageBuilderSetup::getWidgetArgs($categoryProjectOneWidget)) !!}

    <!-- Category area starts -->
    <section class="category-area pat-50 pab-50" data-padding-top="50" data-padding-bottom="50" style="background-color:#fbfbfb;">
        <div class="container">
            <div class="section-title center-text">
            <h2 class="title"> How Projects (GIGS) Work </h2>
            <p>Post your Projects (gigs) as a freelancer, make sure they are right for the Clients, and then sit back to let them buy them and leave you reviews.</p>
            </div>
            <div class="row gy-4 mt-4">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 print-block print-block-left lrmargin mt-3">
                            <div class="w-print-block frist">
                                <div class="print-icon"><i><img src="{{asset('assets/frontend/img/static/icon-1.jpg')}}" alt="rating" style="max-width: 100%; height: auto;"></i></div>
                                <div class="print-number"><span>01</span></div>
                                <div class="print-txt">
                                    <p>Freelancer Post</p>
                                </div>
                                <div class="print-title"><a href="#">Projects(gigs) They Offer</a></div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 print-block print-block-center lrmargin mt-3">
                            <div class="w-print-block">
                                <div class="print-icon"><i><img src="{{asset('assets/frontend/img/static/icon-2.jpg')}}" alt="rating" style="max-width: 100%; height: auto;"></i></div>
                                <div class="print-number"><span>02</span></div>
                                <div class="print-txt">
                                    <p>Clients Will</p>
                                </div>
                                <div class="print-title"><a href="#">Hires(Buy) Them</a></div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 print-block print-block-right lrmargin mt-3">
                            <div class="w-print-block">
                                <div class="print-icon"><i><img src="{{asset('assets/frontend/img/static/icon-3.jpg')}}" alt="rating" style="max-width: 100%; height: auto;"></i></div>
                                <div class="print-number"><span>03</span></div>
                                <div class="print-txt">
                                    <p>Clients Will Leave</p>
                                </div>
                                <div class="print-title"><a href="#">Feedback and Pay</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    <div class="col-lg-12">
                        <div class="browse-all-cat"><a href="{{route('client.job.create')}}" title="">Post Your Project Gigs FREE</a></div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Category area end -->

    @php
        $CategoryJobOne = \App\Models\PageBuilder::where('addon_name', 'CategoryJobOne')->first();
    @endphp
    {!! PageBuilderSetup::render_widgets_by_name_for_frontend(PageBuilderSetup::getWidgetArgs($CategoryJobOne)) !!}

    @php
        $explore_projects = Project::select('id', 'title', 'slug', 'user_id', 'basic_regular_charge', 'basic_discount_charge', 'basic_delivery', 'description', 'image', 'load_from')
            ->where('project_on_off', '1')
            ->where('status', '1')
            ->whereHas('project_creator')
            ->take(5)->inRandomOrder()->get();
    @endphp
    <!-- Latest Project area starts -->
    <section class="project-area pat-50 pab-50 section-bg-1" data-padding-top="55" data-padding-bottom="52">
        <div class="container">

            <div class="section-title text-left append-flex">
                <h2 class="title"> Utilise Top Projects (gigs)</h2>
                <div class="d-flex flex-column gap-2 align-items-end">
                    <div>
                    </div>
                    <div class="append-project"></div>
                </div>
            </div>
            <p>Filtered for your needs (gigs)</p>
            <p>Top Projects (gigs) allow applicants to offer their Projects to the end user. These can be beyond the
                scope of digital media and online work. For example, now you can hire designer, developer, seo expert,
                plumbing and housekeeping Projects on competitive rates at Right Freelancer. Choose from the biggest
                network of freelancers and professionals in various fields.</p>


            <div class="row mt-5">
                <div class="col-12">
                    <div class="global-slick-init project-slider nav-style-one slider-inner-margin" data-rtl="false"
                        data-appendArrows=".append-project" data-arrows="true" data-infinite="true" data-dots="false"
                        data-slidesToShow="3" data-swipeToSlide="true" data-autoplaySpeed="2500"
                        data-prevArrow='<div class="prev-icon"><i class="fa-solid fa-arrow-left"></i></div>'
                        data-nextArrow='<div class="next-icon"><i class="fa-solid fa-arrow-right"></i></div>'
                        data-responsive='[{"breakpoint": 1400,"settings": {"slidesToShow": 3}},{"breakpoint": 1200,"settings": {"slidesToShow": 2}},{"breakpoint": 992,"settings": {"slidesToShow": 2}},{"breakpoint": 768,"settings": {"slidesToShow": 1}},{"breakpoint": 576, "settings": {"slidesToShow": 1} }]'>

                        @foreach($explore_projects as $project)
                            <div class="project-item wow fadeInUp" data-wow-delay=".1s">
                                <div class="single-project radius-10">
                                    <div class="single-project-thumb">
                                       <a href="/assets/qixer-service-provider-buyer-mobile-appp">
                                            @if (!empty($project->image) && file_exists(public_path('assets/uploads/project/' . $project->image)))
                                                <img src="{{ asset('assets/uploads/project/' . $project->image) }}"
                                                    alt="{{ $project->title }}">
                                            @else
                                                <img src="{{ asset('assets/uploads/project/project-default-logo.jpeg') }}"
                                                    alt="Default Project Image">
                                            @endif
                                        </a>

                                    </div>
                                    <div class="single-project-content">
                                        {!! project_rating($project->id) !!}
                                        <h4 class="single-project-content-title" style=" overflow: hidden; text-overflow: ellipsis; display: block; width: 100%;">
                                            <a
                                                href="{{ route('project.details', ['username' => $project->project_creator?->username, 'slug' => $project->slug]) }}">
                                                {{\Illuminate\Support\Str::limit($project->title, 60)}}
                                            </a>
                                        </h4>
                                    </div>
                                    <div class="single-project-bottom flex-between">
                                        @if($project->basic_discount_charge)
                                            <span class="single-project-content-price">
                                                ${{$project->basic_discount_charge}}
                                                <s>${{$project->basic_regular_charge}}</s>
                                            </span>
                                        @endif
                                        <span class="single-project-content-price">
                                            ${{$project->basic_regular_charge}}
                                        </span>
                                        <div class="single-project-delivery">
                                            <span class="single-project-delivery-icon"> <i class="fa-regular fa-clock"></i>
                                                Delivery </span>
                                            <span class="single-project-delivery-days"> {{$project->basic_delivery}}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Project area end -->

    <section class="wt-haslayout wt-main-section wt-paddingnull wt-bannerholdervtwo"
        style="background-image: url('{{asset('assets/frontend/img/static/1557484284-banner.jpg')}}'); background-size: cover; background-position: center; background-repeat: no-repeat;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="wt-companydetails d-flex flex-column flex-lg-row gap-5">
                        
                        <!-- Agency Block -->
                        <div class="wt-companycontent w-100">
                            <div class="wt-companyinfotitle">
                                <h2>Begin As An Agency</h2>
                            </div>
                            <div class="wt-description">
                                <p>Whether, you are a web design/web development company,
                                    digital marketing agency, woo-commerce, e-commerce, fashion industry or textile
                                    firm, on our platform, you will get the right employers and freelancers who can work
                                    easily in flexible and a cooperative manner with you. Your all creative designing,
                                    creative writing and digital marketing needs will be met up to your requirements.
                                    Our freelancers will make your job successful faster than you could have possibly
                                    imagined before. Find them right here- right now and leave the rest on us.</p>
                            </div>
                            <div class="wt-btnarea">
                                <a href="{{ route('user.register') }}" class="wt-btn">Join Now</a>
                            </div>
                        </div>

                        <!-- Freelancer Block -->
                        <div class="wt-companycontent w-100">
                            <div class="wt-companyinfotitle">
                                <h2>Begin As A Freelancer</h2>
                            </div>
                            <div class="wt-description">
                                <p>From all around the world, over 1 Million freelancers have
                                    joined RightFreelancer to showcase their talent, skills and earn million bucks
                                    online and now they are hunting the joyful life through that freelance earned money.
                                    Yes ! With RightFreelancer hourly or fixed price jobs, you can also skyrocket your
                                    independent career. If you join this good company, you will be among the best
                                    freelancers around the world and get cash flow to grow your business as an
                                    independent entrepreneur sooner than later.</p>
                            </div>
                            <div class="wt-btnarea">
                                <a href="{{ route('user.register') }}" class="wt-btn">Join Now</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Brand logo area starts -->
    <div class="brand-area pat-50 pab-100" data-padding-top="50" data-padding-bottom="50">
        <div class="container">
            <div class="row">
                <div class="col-12">

                    <div class="wt-sectionhead">
                        <div class="wt-sectiontitle">
                            <h2>Sponsored Companies </h2>
                            Sponsored Companies for your website benefit
                        </div>
                        <div class="wt-description">
                            <p>Securing sponsorships for a website can provide mutual benefits
                                for both you and the sponsoring companies. To attract sponsors, you need to demonstrate
                                how the partnership will benefit them in terms of visibility, engagement, and alignment
                                with their brand goals.</p>
                        </div>
                    </div>
                    <!-- End Heding -->

                    <div class="global-slick-init attraction-slider slider-inner-margin" data-rtl="" data-slidesToShow="6"
                        data-infinite="true" data-arrows="false" data-dots="false" data-swipeToSlide="true"
                        data-autoplay="true" data-autoplaySpeed="2500"
                        data-prevArrow='<div class="prev-icon"><i class="fas fa-angle-left"></i></div>'
                        data-nextArrow='<div class="next-icon"><i class="fas fa-angle-right"></i></div>'
                        data-responsive='[{"breakpoint": 1400,"settings": {"slidesToShow": 6}},{"breakpoint": 1200,"settings": {"slidesToShow": 4}},{"breakpoint": 992,"settings": {"slidesToShow": 4}},{"breakpoint": 768,"settings": {"slidesToShow": 3}},{"breakpoint": 576, "settings": {"slidesToShow": 2} }]'>
                        <!-- <div class="single-brand">
                            <a href="#/" class="single-brand-thumb">
                                <img src="/assets/Logo 61700402717.png" alt="" />
                            </a>
                        </div> -->
                        <div class="single-brand">
                           <a href="https://meemsoft.com/" target="_blank" rel="noopener noreferrer" class="single-brand-thumb">
                                <img src="{{ asset('/assets/homepage_logo/m-logo.jpg') }}"  alt="Meemsoft Logo" />
                            </a>

                        </div>
                        <div class="single-brand">
                            <a href="https://www.sheensol.com/" target="_blank" rel="noopener noreferrer" class="single-brand-thumb">
                                <img src="{{ asset('/assets/homepage_logo/sheensol.jpg') }}"  alt="Sheensol Logo" />
                            </a>
                        </div>

                       <div class="single-brand">
                            <a href="https://www.crelogics.com/" target="_blank" rel="noopener noreferrer" class="single-brand-thumb">
                                <img src="{{ asset('/assets/homepage_logo/crelogics.jpg') }}" alt="Crelogics Logo" />
                            </a>
                        </div>

                       <div class="single-brand">
                            <a href="https://www.arhamsoft.com/" target="_blank" rel="noopener noreferrer" class="single-brand-thumb">
                                <img src="{{ asset('/assets/homepage_logo/arhamsoft.jpg') }}" alt="ArhamSoft Logo" />
                            </a>
                        </div>

                        <div class="single-brand">
                            <a href="https://www.fancymart.pk/" target="_blank" rel="noopener noreferrer" class="single-brand-thumb">
                                <img src="{{ asset('/assets/homepage_logo/fancymart.jpg') }}" alt="FancyMart Logo" />
                            </a>
                        </div>

                       <div class="single-brand">
                            <a href="https://www.digitalwebsolution.com/" target="_blank" rel="noopener noreferrer" class="single-brand-thumb">
                                <img src="{{ asset('/assets/homepage_logo/digital-web-solution.jpg') }}"  alt="Digital Web Solutions Logo" />
                            </a>
                        </div>

                        <div class="single-brand">
                            <a href="https://www.softsolutions.com.pk/" class="single-brand-thumb" target="_blank" rel="noopener">
                                <img src="{{ asset('/assets/homepage_logo/soft-solutions.jpg') }}" alt="Soft Solutions" />
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Brand Logo area end -->



    <!-- appStore area starts -->
    <!-- <section class="appStore-area pat-100 pab-100">
        <div class="container">
            <div class="row gy-5 justify-content-center">
                <div class="col-xl-6 col-lg-9">
                    <div class="single-appStore">
                        <div class="single-appStore-flex">
                            <div class="single-appStore-contents">
                                <h3 class="single-appStore-contents-title">
                                    <a href="javascript:void(0)">Download Freelancers Mobile App</a>
                                </h3>
                                <div class="single-appStore-btn flex-btn gap-2 mt-4">
                                    <a href="#">
                                        <img src="/assets/appStore11717415066.jpg" alt="" />
                                    </a>
                                    <a href="#">
                                        <img src="/assets/appStore21717415066.jpg" alt="" />
                                    </a>
                                </div>
                                <div class="single-appStore-shapes">
                                    <img src="/assets/choose_shapes1717424980.png" alt="" />
                                </div>
                            </div>
                            <div class="single-appStore-thumb wow fadeInUp" data-wow-delay=".2s">
                                <img src="/assets/Freelancer1717417807.png" alt="" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-9">
                    <div class="single-appStore">
                        <div class="single-appStore-flex">
                            <div class="single-appStore-contents">
                                <h3 class="single-appStore-contents-title">
                                    <a href="javascript:void(0)">Download Clients Mobile App</a>
                                    <div class="single-appStore-btn flex-btn gap-2 mt-4">
                                        <a href="#">
                                            <img src="/assets/appStore11717415066.jpg" alt="" />
                                        </a>
                                        <a href="#">
                                            <img src="/assets/appStore21717415066.jpg" alt="" />
                                        </a>
                                    </div>
                                    <div class="single-appStore-shapes">
                                        <img src="/assets/choose_shapes1717424980.png" alt="" />
                                    </div>
                            </div>
                            <div class="single-appStore-thumb wow fadeInUp" data-wow-delay=".5s">
                                <img src="/assets/Client1717417807.png" alt="" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    <!-- appStore area end -->

    @php
        $topFreelancers = Cache::remember('topFreelancers', 3600, function () {
            return \App\Models\Order::select('freelancer_id', DB::raw('COUNT(*) as paid_orders_count'))
                ->where('payment_status', 'complete')
                ->with('freelancer')
                ->groupBy('freelancer_id')
                ->orderBy('paid_orders_count', 'desc')
                ->limit(3)
                ->get()
                ->map(function ($item) {
                    $freelancer = $item->freelancer;
                    $freelancer->paid_orders_count = $item->paid_orders_count;
                    return $freelancer;
                });
        });
    @endphp
    <section class="section-top-follower">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center mt-5">
                    <hr
                        style="height: 2px; background: linear-gradient(to right, #6a11cb, #2575fc); margin: 0 auto 20px auto; border: none;">

                    <h3 class="fw-bold position-relative d-inline-block mb-4"
                        style="font-size: 2rem; font-family: 'Poppins', sans-serif; letter-spacing: 1px; color: #343a40; padding-bottom: 10px;">
                        Top RightFreelancer
                        <span
                            style="position: absolute; left: 50%; transform: translateX(-50%); bottom: 0; height: 3px; width: 60px; background-color: #2575fc; border-radius: 2px;"></span>
                    </h3>
                </div>

                @foreach($topFreelancers as $topFreelancer)
                    <div class="col-sm-6 col-md-4 margin-bt">
                        <div class="media li-group padding-sm">
                            <div class="pull-left">
                                <a href="{{ route('freelancer.profile.details', $topFreelancer->username) }}">
                                    <img style="width: 80px" src="{{asset('assets/uploads/profile/' . $topFreelancer->image)}}"
                                        alt="Faiz Mohiuddin"
                                        class="border-image-profile img-circle photo-card media-object img-circle">
                                </a>
                            </div>
                            <div class="media-body clearfix text-overflow">
                                <strong class="media-heading">
                                    <a
                                        href="{{ route('freelancer.profile.details', $topFreelancer->username) }}">{{$topFreelancer->first_name}}{{$topFreelancer->last_name}}</a>
                                </strong>
                                <p class="text-col">
                                    <small> ( {{$topFreelancer->paid_orders_count ?? 0}} Projects )</small>
                                </p>
                            </div><!-- media-body -->
                        </div><!-- ******** Media ****** -->
                    </div>
                @endforeach


                <div class="col-md-12 text-center margin-top-mv">
                    <hr>
                    <a href="{{route('talents.all')}}" class="btn btn-primary btn-sm"
                        style="padding-left: 30px; padding-right: 30px;">View all</a>
                </div>

            </div>
        </div>
    </section>

    @php
        $totalJobs = Cache::remember('totalJobs', 3600, function () {
            return JobPost::count();
        });

        $totalProjects = Cache::remember('totalProjects', 3600, function () {
            return Project::count();
        });

        $totalUsers = Cache::remember('totalUsers', 3600, function () {
            return User::count();
        });

    @endphp
    <section id="counter" class="section-c">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="wrap-section-c wrap-desktop">
                        <div class="wsc-right">
                            <div class="wscr-text os-animation" data-os-animation-delay="0.8s" data-os-animation="flipInY">
                                Connecting<br>
                                <b>Clients</b> With Talents Around the World<b> From Last <br />2 Years.</b>
                            </div>
                        </div>
                        <div class="wsc-left">
                            <div class="wscl-wrap os-animation" data-os-animation-delay="0.5s" data-os-animation="fadeInUp">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="box-count">
                                            <div class="bcount-left">
                                                <div class="abclin">
                                                    <div class="bclin">
                                                        <div class="stats"><span>{{$totalJobs}}</span>
                                                            <h5>Jobs </h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="box-count">
                                            <div class="bcount-left">
                                                <div class="abclin">
                                                    <div class="bclin">
                                                        <div class="stats"><span>{{$totalUsers}}</span>
                                                            <h5>Users</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="box-count">
                                            <div class="bcount-left">
                                                <div class="abclin">
                                                    <div class="bclin">
                                                        <div class="stats"><span>{{$totalProjects}}</span>
                                                            <h5>Projects (gigs)</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="sc-bg"></div>
    </section>

@endsection