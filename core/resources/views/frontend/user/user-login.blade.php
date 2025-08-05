@extends('frontend.layout.master')
@section('site_title', __('User Login'))
@section('style')
    <style>
        .autoLogin {
            border: none;
            background-color: green;
            color: #fff;
            border-radius: 5px;
            padding: 5px;
            transition: all 300ms;
            cursor: pointer;
        }

        .login-box{
            background-color: white;
            border-radius: 12px;
            padding: 15px;
        }
    </style>
@endsection

@section('content')
    <!-- login Area Starts -->
    <section class="login-area pat-100 pab-100 section-bg-1">
        <div class="container">
            <div class="row gy-5 align-items-center justify-content-between">
                <div class="col-lg-5 mx-auto">
                    <div class="login-wrapper login-box">
                        <div class="login-wrapper-contents">
                            <h3 class="login-wrapper-contents-title">{{ get_static_option('login_page_title') ?? __('Log In ') }}</h3>
                            <x-validation.error/>
                            <div class="error-message"></div>
                            <form class="login-wrapper-contents-form custom-form" id="user_auto_login_form" method="post" action="{{ route('user.login') }}">
                                @csrf

                                <div class="single-input mt-4">
                                    <label class="label-title mb-3">{{ __('Email Or User Name') }}</label>
                                    <input class="form--control" type="text" name="username" id="username" placeholder="{{ __('Email Or User Name') }}">
                                </div>
                                <div class="single-input mt-4">
                                    <label class="label-title mb-3"> {{ __('Password') }} </label>
                                    <div class="single-input-inner">
                                        <input class="form--control" type="password" name="password" id="password" placeholder="{{ __('Type Password') }}">
                                        <div class="icon toggle-password">
                                            <div class="show-icon"> <i class="fas fa-eye-slash"></i> </div>
                                            <span class="hide-icon"> <i class="fas fa-eye"></i> </span>
                                        </div>
                                    </div>
                                </div>
                                <button id="signin_form" class="submit-btn w-100 mt-4" type="submit"> {{ get_static_option('login_page_button_title') ?? __('Sign In Now') }} </button>
                                <span class="account color-light mt-3">{{ __("Don't have an account?") }} <a class="color-one" href="{{ route('user.register') }}"> {{ __('SignUp Now') }}</a> </span>
                            </form>
                            <div class="single-checkbox mt-3">
                                <div class="checkbox-inline">
                                    <input class="check-input" name="remember"  type="checkbox" id="check15">
                                    <label class="checkbox-label" for="check15"> {{ __('Remember Me') }} </label>
                                </div>
                                <div class="forgot-password">
                                    <a href="{{ route('user.forgot.password') }}" class="forgot-btn color-one">{{ __('Forgot Password') }} </a>
                                </div>
                            </div>
                                <!-- @if(get_static_option('login_page_social_login_enable_disable') == 'on')
                                    <div class="login-bottom-contents">
                                        <div class="login-others">
                                            <div class="login-others-single">
                                                <a href="{{ route('login.google.redirect') }}" class="login-others-single-btn w-100">
                                                    <i class="fa-brands fa-google"></i>
                                                    <span class="login-para"> {{ __('Sign In With Google') }} </span>
                                                </a>
                                            </div>
                                            <div class="login-others-single">
                                                <a href="{{ route('login.facebook.redirect') }}" class="login-others-single-btn w-100">
                                                    <i class="fa-brands fa-facebook"></i>
                                                    <span class="login-para"> {{ __('Sign In With Facebook') }} </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                @endif -->
                            {{--login only for demo start--}}
                            @if(url()->current() == 'https://xilancer.xgenious.com/login')
                                <div class="mt-5">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>{{ __('Username') }}</th>
                                                <th>{{ __('Password') }}</th>
                                                <th>{{ __('Action') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody style="border-top: none;">
                                            <tr>
                                                <td id="freelancer_username">freelancer</td>
                                                <td id="freelancer_password">12345678</td>
                                                <td><button type="button" class="autoLogin" id="freelancerLogin">{{ __('Freelancer Login') }}</button></td>
                                            </tr>
                                            <tr>
                                                <td id="client_username">client</td>
                                                <td id="client_password">12345678</td>
                                                <td><button type="button" class="autoLogin" id="clientLogin">{{ __('Client Login') }}</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            @endif
                            {{--login only for demo end--}}

                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- login Area end -->
@endsection


{{--todo register script--}}
@section('script')
<script>
(function ($) {
    "use strict";
    $(document).ready(function () {

        // Auto login for client
        $(document).on('click', '#clientLogin', function () {
            let username = $('#client_username').text();
            let password = $('#client_password').text();
            $('#username').val(username);
            $('#password').val(password);

            $('#signin_form').trigger('click');
        });

        // Auto login for freelancer
        $(document).on('click', '#freelancerLogin', function () {
            let username = $('#freelancer_username').text();
            let password = $('#freelancer_password').text();
            $('#username').val(username);
            $('#password').val(password);

            $('#signin_form').trigger('click');
        });

        // Login form submit
        $(document).on('click', '#signin_form', function (e) {
            e.preventDefault();

            let el = $(this);
            let erContainer = $(".error-message");
            erContainer.html('');
            el.text('{{ __("Please Wait...") }}');

            $.ajax({
                url: "{{ route('user.login') }}",
                type: "POST",
                data: {
                    username: $('#username').val(),
                    password: $('#password').val(),
                    remember: $('#remember').is(':checked') ? 1 : 0,
                    _token: '{{ csrf_token() }}'
                },
                error: function (data) {
                    var errors = data.responseJSON;
                    erContainer.html('<div class="alert alert-danger"></div>');

                    if (errors && errors.errors) {
                        $.each(errors.errors, function (index, value) {
                            erContainer.find('.alert.alert-danger').append('<p>' + value + '</p>');
                        });
                    } else {
                        erContainer.find('.alert.alert-danger').append('<p>{{ __("Something went wrong. Please try again.") }}</p>');
                    }

                    el.text('{{ __("Login") }}');
                },
                success: function (data) {
                    console.log(data);
                    $('.alert.alert-danger').remove();

                    if (data.status === 'redirect-to-payment') {

                        window.location.href = data.redirect_url;
                        return;
                    }

                    if (data.status === 'client-login') {
                        el.text('{{ __("Redirecting...") }}');
                        erContainer.html('<div class="alert alert-' + data.type + '">' + data.msg + '</div>');
                        let redirectPath = "{{ route('client.dashboard') }}";

                        @if(!empty(request()->get('return')))
                            redirectPath = "{{ url('/'.request()->get('return')) }}";
                        @endif

                        window.location = redirectPath;
                    } else if (data.status === 'freelancer-login') {
                        el.text('{{ __("Redirecting...") }}');
                        erContainer.html('<div class="alert alert-' + data.type + '">' + data.msg + '</div>');
                        let redirectPath = "{{ route('freelancer.dashboard') }}";

                        @if(!empty(request()->get('return')))
                            redirectPath = "{{ url('/'.request()->get('return')) }}";
                        @endif

                        window.location = redirectPath;
                    } else {
                        erContainer.html('<div class="alert alert-' + data.type + '">' + data.msg + '</div>');
                        el.text('{{ __("Login") }}');
                    }
                }
            });
        });
    });
})(jQuery);
</script>

@endsection



