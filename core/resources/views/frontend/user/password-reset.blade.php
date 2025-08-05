@extends('frontend.layout.master')
@section('site_title',__('Password Reset'))
@section('style')
    <style>
        .verify-form input{
            height:50px;
            padding-left: 5px;
        }
        button.close {
            width: 30px;
            height: 30px;
            border: none;
            background: #000;
            color: #fff;
            border-radius: 3px;
            float: right;
            font-size: 20px;
        }
        .verify-form .verify-account{
            border-radius: 5px;
            font-size: 16px;
        }
        .submit-btn {
            margin: 0 auto;
            display: block;
        }   
    </style>
@endsection
@section('content')
    <!-- login Area Starts -->
    <section class="login-area pat-100 pab-100">
        <div class="container custom-container-one">
            <div class="login-wrapper">
                <div class="login-wrapper-contents margin-inline login-shadow login-padding">
                    <h2 class="single-title"> {{ __('Password Reset!') }} </h2>
                    <x-validation.error />
                    <form class="login-wrapper-form custom-form" method="post" action="{{ route('user.forgot.password.reset') }}">
                        @csrf
                        <div class="input-flex-item">
                            <div class="single-input mt-0">
                                <label class="label-title mb-2"> {{ __('Create Password') }} </label>
                                <div class="single-input-inner">
                                    <input class="form--control" type="password" name="password" id="password"
                                        placeholder="{{ __('Type Password') }}">
                                </div>
                            </div>
                            <div class="single-input mt-4">
                                <label class="label-title mb-2"> {{ __('Confirm Password') }} </label>
                                <div class="single-input-inner">
                                    <input class="form--control" type="password" name="confirm_password"
                                        id="confirm_password" placeholder="{{ __('Confirm Password') }}">
                                    <span id="password_match_validation"></span>
                                </div>
                            </div>
                        </div>
                        <span id="password_validation"></span>
                        <button class="submit-btn w-50 mt-1" type="submit"> {{ __('Submit Now') }} </button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- login Area end -->
@endsection

@section('script')
    <script>
        $(document).on('keyup', '#password, #confirm_password', function() {
            let password = $("#password").val();
            let confirmPassword = $("#confirm_password").val();
            $.ajax({
                url: "{{ route('user.reset.password.match.validation') }}",
                type: 'post',
                data: {
                    password: password,
                    confirm_password: confirmPassword
                },
                success: function(res) {
                    if (res.status == 'match') {
                        $("#password_match_validation").html("<span style='color: green;'>" + res.msg + "</span>");
                    } else {
                        $("#password_match_validation").html("<span style='color: red;'>" + res.msg + "</span>");
                    }
                }
            });
        });

        $(document).on('keyup', '#password', function() {
            let password = $(this).val();
            let validations = [
                { regex: /.{6,}/, message: 'Password must be at least 6 characters', valid: false },
                { regex: /[a-z]/, message: 'Password must include lowercase letters', valid: false },
                { regex: /[A-Z]/, message: 'Password must include uppercase letters', valid: false },
                { regex: /\d/, message: 'Password must include numbers', valid: false },
                { regex: /[@$!%*#?&]/, message: 'Password must include special characters', valid: false },
            ];

            validations.forEach(function(validation) {
                if (validation.regex.test(password)) {
                    validation.valid = true;
                }
            });

            let errorHtml = '<ul>';
            validations.forEach(function(validation) {
                if (validation.valid) {
                    errorHtml += '<li style="color: green;">' + validation.message + '</li>';
                } else {
                    errorHtml += '<li style="color: red;">' + validation.message + '</li>';
                }
            });
            errorHtml += '</ul>';

            $("#password_validation").html(errorHtml);
        });
    </script>
@endsection