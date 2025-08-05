{{--
<footer class="footer-area footer-fluid white-footer footer-bg-1">
    <div class="container">
        <div class="footer-area-wrapper footer-bg-1">
            <div class="row gx-5 footer-area-top">
                {!! render_frontend_sidebar('footer_one') !!}
            </div>

            <div class="copyright-area copyright-border">
                <div class="row">
                    <div class="col-12">
                        <div class="footer-widget-para">
                            {!! render_footer_copyright_text() !!}
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</footer>
--}}


<footer class="footer-area footer-fluid white-footer footer-bg-1 footer-bg-add">
    <div class="container">
        <div class="footer-area-wrapper footer-bg-1">
            <div class="row gx-5 footer-area-top">
                <div class="col-lg-3 col-sm-6 mt-4">
                    <div class="footer-widget widget">
                        <div class="footer-contents-logo">
                            <a href="https://www.rightfreelancer.com" class="footer-contents-logo-img"><img src="https://www.rightfreelancer.com/assets/uploads/media-uploader/logo17263285861726730559.png" alt="logo"></a>
                        </div>
                        <div class="footer-widget-inner mt-4">
                            <p class="footer-widget-para">Through right freelancer platform, clients can hire freelancers to do work in areas such as graphic
                                designer, software development, writing, SEO, an..</p>
                            <div class="footer-widget-social mt-4">
                                <ul class="footer-widget-social-list list-style-none">
                                    <li class="footer-widget-social-list-item">
                                        <a class="footer-widget-social-list-link" href="{{url('https://www.facebook.com/rightfreelancer')}}"> <i
                                                    class="fab fa-facebook-f"></i> </a>
                                    </li>
                                    <li class="footer-widget-social-list-item">
                                        <a class="footer-widget-social-list-link" href="{{url('https://www.youtube.com/@rightfreelancer')}}"> <i
                                                    class="fab fa-youtube"></i> </a>
                                    </li>
                                    <li class="footer-widget-social-list-item">
                                        <a class="footer-widget-social-list-link" href="{{url('https://www.instagram.com/rightfreelancer')}}"> <i
                                                    class="fab fa-instagram"></i> </a>
                                    </li>
                                    <li class="footer-widget-social-list-item">
                                        <a class="footer-widget-social-list-link" href="{{url('https://www.linkedin.com/company/rightfreelancer')}}"> <i
                                                    class="fab fa-linkedin-in"></i> </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 mt-4">
                    <div class="footer-widget widget">
                        <h4 class="footer-widget-title">Freelancer</h4>
                        <div class="footer-widget-inner mt-4">
                            <ul class="footer-widget-link-list">
                                <li class="footer-widget-link-list-item">
                                    <a href="{{url('jobs')}}">Jobs</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{url('https://www.rightfreelancer.com/categories/website-development')}}">Categories</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{url('projects')}}">Projects (gigs)</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{url('talents')}}">Talents</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{route('affiliate-programme')}}">Affiliate Programme</a>
                                </li>
                                
                                <li class="footer-widget-link-list-item">
                                    <a href="{{url('packages/all')}}">Packages</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{url('/contact-us')}}">Contact Us</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{url('blogs/all')}}">Blogs</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 mt-4">
                    <div class="footer-widget widget">
                        <h4 class="footer-widget-title">Company</h4>
                        <div class="footer-widget-inner mt-4">
                            <ul class="footer-widget-link-list">
                                <li class="footer-widget-link-list-item">
                                    <a href="{{route('about-us')}}">About Us</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{route('how-it-works')}}">How It Works</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{route('fees-and-charge')}}">Fees and Charges</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{route('privacy-policy')}}">Privacy Policy</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{route('terms-of-service')}}">Terms of Service</a>
                                </li>
                               
                                <li class="footer-widget-link-list-item">
                                    <a href="{{url('win-work-with-rewards')}}">Win Works and Rewards</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{route('investor-relations')}}">Investor Relations</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{route('trust-and-safety')}}">Trust & Safety</a>
                                </li>
                                
                                <li class="footer-widget-link-list-item">
                                    <a href="{{route('support')}}">Support</a>
                                </li>
                               
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-sm-6 mt-4">
                    <div class="footer-widget widget">
                        <h4 class="footer-widget-title">Explore More</h4>
                        <div class="footer-widget-inner mt-4">
                            <ul class="footer-widget-link-list">
                                <li class="footer-widget-link-list-item">
                                    <a href="{{url('https://www.rightfreelancer.com/talents')}}">Freelancers by Skill</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{url('#')}}">Freelancers in USA</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{url('#')}}">Freelancers in Australia</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{url('#')}}">Freelancers in UK</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{url('#')}}">Freelancers in Saudi Arabia</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{url('#')}}">Freelancers in UAE</a>
                                </li>
                                <li class="footer-widget-link-list-item">
                                    <a href="{{url('jobs')}}">Find Jobs</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyright-area copyright-border">
                <div class="row">
                    <div class="col-12">
                        <div class="footer-widget-para">
                            <p> &copy; {{ date('Y') }} All right reserved by <a href="{{url('/')}}" style="color: #309400;" target="_blank">RightFreelancer</a> &nbsp;<span style="color: #888;">Beta Version</span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>