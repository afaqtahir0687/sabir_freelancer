<script>
    (function($){
        "use strict";
        $(document).ready(function(){
            $('.country_select2').select2();
            $('.state_select2').select2();
            $('.city_select2').select2();

            // change country and get state
            $('.identity-verifying-list').on('click', function() {
                $(this).find('input[type="radio"]').prop('checked', true).trigger('change');
            });
            $('.verify-radio').on('change', function() {
                let selectedValue = $(this).closest('.identity-verifying-list').find('.identity-verifying-list-contents-details-title').text();
                $('#verify_by').val(selectedValue);

                let inputTitle = '';
                let inputPlaceholder = '';
                switch (selectedValue) {
                    case 'National ID Card':
                        inputTitle = '{{ __("National ID number") }}';
                        inputPlaceholder = '{{ __("Enter id number") }}';
                        @if(isset($user_identity) && $user_identity->verify_by == 'National ID Card')
                            $('#national_id_number').val("{{ $user_identity->national_id_number ?? '' }}");
                            $('.front_image').attr('src', "{{ asset('assets/uploads/verification/'.$user_identity->front_image) }}");
                            $('.back_image').attr('src', "{{ asset('assets/uploads/verification/'.$user_identity->back_image) }}");
                        @else
                            $('#national_id_number').val('');
                            $('.front_image').attr('src', '');
                            $('.back_image').attr('src', '');
                        @endif
                        break;
                    case 'Driving License':
                        inputTitle = '{{ __("Driving License number") }}';
                        inputPlaceholder = '{{ __("Enter driving license number") }}';
                        @if(isset($user_identity) && $user_identity->verify_by == 'Driving License')
                            $('#national_id_number').val("{{ $user_identity->national_id_number ?? '' }}");
                            $('.front_image').attr('src', "{{ asset('assets/uploads/verification/'.$user_identity->front_image) }}");
                            $('.back_image').attr('src', "{{ asset('assets/uploads/verification/'.$user_identity->back_image) }}");
                        @else
                            $('#national_id_number').val('');
                            $('.front_image').attr('src', '');
                            $('.back_image').attr('src', '');
                        @endif
                        break;
                    case 'Passport':
                        inputTitle = '{{ __("Passport number") }}';
                        inputPlaceholder = '{{ __("Enter passport number") }}';
                        @if(isset($user_identity) && $user_identity->verify_by == 'Passport')
                            $('#national_id_number').val("{{ $user_identity->national_id_number ?? '' }}");
                            $('.front_image').attr('src', "{{ asset('assets/uploads/verification/'.$user_identity->front_image) }}");
                            $('.back_image').attr('src', "{{ asset('assets/uploads/verification/'.$user_identity->back_image) }}");
                        @else
                            $('#national_id_number').val('');
                            $('.front_image').attr('src', '');
                            $('.back_image').attr('src', '');
                        @endif
                        break;
                }

                $('label[for="national_id_number"]').text(inputTitle);
                $('#national_id_number').attr('placeholder', inputPlaceholder);
            });


           let selectedValue = $('.verify-radio:checked').closest('.identity-verifying-list').find('.identity-verifying-list-contents-details-title').text();
           let inputTitle = '';
           let inputPlaceholder = '';
           switch (selectedValue) {
               case 'National ID Card':
                   inputTitle = '{{ __("National ID number") }}';
                   inputPlaceholder = '{{ __("Enter id number") }}';
                   break;
               case 'Driving License':
                   inputTitle = '{{ __("Driving License number") }}';
                   inputPlaceholder = '{{ __("Enter driving license number") }}';
                   break;
               case 'Passport':
                   inputTitle = '{{ __("Passport number") }}';
                   inputPlaceholder = '{{ __("Enter passport number") }}';
                   break;
           }
           $('label[for="national_id_number"]').text(inputTitle);
           $('#national_id_number').attr('placeholder', inputPlaceholder);


            // Country to State
            $('#country').on('change', function () {
                let country = $(this).val();

                $(".get_country_state").html('<option value="">Loading...</option>').trigger('change.select2');

                $.ajax({
                    method: 'post',
                    url: "{{ route('au.state.all') }}",
                    data: {
                        country: country
                    },
                    success: function (res) {
                        if (res.status == 'success') {
                            let all_options = "<option value=''>{{__('Select State')}}</option>";
                            $.each(res.states, function (index, value) {
                                all_options += "<option value='" + value.id + "'>" + value.state + "</option>";
                            });

                            $(".get_country_state").html(all_options).trigger('change.select2');
                            $(".state_info").html('');
                            if (res.states.length <= 0) {
                                $(".state_info").html('<span class="text-danger"> {{ __("No state found for selected country!") }} </span>');
                            }

                            // Reset city dropdown
                            $(".get_state_city").html('<option value="">Select City</option>').trigger('change.select2');
                        }
                    }
                });
            });

            // State to City
            $('#state').on('change', function() {
                let state = $(this).val();
                if (!state) return;

                $(".get_state_city").html('<option value="">Loading...</option>');

                $.ajax({
                    method: 'post',
                    url: "{{ route('au.city.all') }}",
                    data: {
                        state: state
                    },
                    success: function(res) {
                        let all_options = "<option value=''>{{__('Select City')}}</option>";
                        if (res.status === 'success') {
                            res.cities.forEach(city => {
                                all_options += `<option value="${city.id}">${city.city}</option>`;
                            });
                        }

                        $(".get_state_city").html(all_options).trigger('change.select2');
                        $(".city_info").html(res.cities.length ? '' : '<span class="text-danger">{{ __("No city found for selected state!") }}</span>');
                    }
                });
            });


            let storedCountry = "{{ $user_identity->country_id ?? '' }}";
            let storedState = "{{ $user_identity->state_id ?? '' }}";
            let storedCity = "{{ $user_identity->city_id ?? '' }}";

            $('#country').val(storedCountry).trigger('change');

            function setStateAndCity(country, state, city) {
                if (country) {
                    $.ajax({
                        method: 'post',
                        url: "{{ route('au.state.all') }}",
                        data: {
                            country: country
                        },
                        success: function (res) {
                            if (res.status == 'success') {
                                let all_options = "<option value=''>{{__('Select State')}}</option>";
                                $.each(res.states, function (index, value) {
                                    all_options += "<option value='" + value.id + "' " + (value.id == state ? 'selected' : '') + ">" + value.state + "</option>";
                                });

                                $(".get_country_state").html(all_options).trigger('change.select2');
                                $(".state_info").html('');
                                if (res.states.length <= 0) {
                                    $(".state_info").html('<span class="text-danger"> {{ __("No state found for selected country!") }} </span>');
                                }

                                // Set the selected city
                                if (state) {
                                    $.ajax({
                                        method: 'post',
                                        url: "{{ route('au.city.all') }}",
                                        data: {
                                            state: state
                                        },
                                        success: function(res) {
                                            let all_options = "<option value=''>{{__('Select City')}}</option>";
                                            if (res.status === 'success') {
                                                res.cities.forEach(cityItem => {
                                                    all_options += `<option value="${cityItem.id}" ` + (cityItem.id == city ? 'selected' : '') + `>${cityItem.city}</option>`;
                                                });
                                            }

                                            $(".get_state_city").html(all_options).trigger('change.select2');
                                            $(".city_info").html(res.cities.length ? '' : '<span class="text-danger">{{ __("No city found for selected state!") }}</span>');
                                        }
                                    });
                                }
                            }
                        }
                    });
                }
            }

            setStateAndCity(storedCountry, storedState, storedCity);

            //front image preview
            $('.front_image_preview').hide();
            document.querySelector('#front_image').addEventListener('change', function() {
                $('.front_image_preview').show();
                $('.front_image').hide();
                $(".identity-verifying-upload").find('span').first().hide()
                $(".identity-verifying-upload").find('p').first().text("{{__('Click to change photo')}}")
                if (this.files && this.files[0]) {
                    let img = document.querySelector('.front_image_preview');
                    img.onload = () => {
                        URL.revokeObjectURL(img.src);  // no longer needed, free memory
                    }

                    img.src = URL.createObjectURL(this.files[0]); // set src to blob url
                    document.querySelector(".front_image_upload").files = this.files;
                    document.querySelector(".front_image_upload").value = this.value;
                }
            });

            //back image preview
            $('.back_image_preview').hide();
            document.querySelector('#back_image').addEventListener('change', function() {
                $('.back_image_preview').show();
                $('.back_image').hide();
                $(".identity-verifying-upload").find('span').last().hide()
                $(".identity-verifying-upload").find('p').last().text("{{__('Click to change photo')}}")

                if (this.files && this.files[0]) {
                    let img = document.querySelector('.back_image_preview');
                    img.onload = () => {
                        URL.revokeObjectURL(img.src);  // no longer needed, free memory
                    }
                    img.src = URL.createObjectURL(this.files[0]); // set src to blob url
                    document.querySelector(".back_image_upload").files = this.files;
                    document.querySelector(".back_image_upload").value = this.value;
                }
            });

            //identity verification request
            $(document).on('submit','#submit_client_verify_info',function(e){
                e.preventDefault();
                let country = $('#country').val();
                let state = $('#state').val();
                let city = $('#city').val();
                let address = $('#address').val();
                let zipcode = $('#zipcode').val();
                let national_id_number = $('#national_id_number').val();
                let front_image = $('#front_image').val();
                let back_image = $('#back_image').val();
                if(country == '' || address == '' || national_id_number == '' || front_image == '' || back_image == ''){
                    toastr_warning_js("{{ __('Except city all fields required !') }}");
                    return false;
                }else{
                    $('.verification_load_spinner').html('<i class="fas fa-spinner fa-pulse"></i>')
                    $.ajax({
                        url:"{{ route('client.identity.verification') }}",
                        method:'post',
                        data: new FormData(this),
                        cache: false,
                        contentType: false,
                        processData: false,
                        success:function(res){
                            $('.error_msg_container').html('');
                           if(res.status=='success'){
                               $('#display_client_identity_verification').load(location.href + " #display_client_identity_verification");
                               $('.front_image_preview').html('');
                               $('.front_image').hide();
                               $('.back_image_preview').hide();
                               $(".identity-verifying-upload").find('span').first().hide()
                               $(".identity-verifying-upload").find('p').first().text("{{__('Click to change photo')}}")
                               toastr_success_js("{{ __('Documents successfully submitted') }}");
                           }
                        },
                        error: function (err) {
                            let error = err.responseJSON;
                            $('.error_msg_container').html('');
                            $.each(error.errors, function (index, value) {
                                $('.error_msg_container').append('<p class="text-danger">'+value+'<p>');
                            });
                        }
                    })
                }
            });

        });
    }(jQuery));

    //toastr warning
    function toastr_warning_js(msg){
        Command: toastr["warning"](msg, "Warning !")
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
    }

    //toastr success
    function toastr_success_js(msg){
        Command: toastr["success"](msg, "Success !")
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
    }
</script>
