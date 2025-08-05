<script>
    (function($){
        "use strict";
        $(document).ready(function(){
            $('.country_select2').select2();
            $('.state_select2').select2();
            $('.city_select2').select2();

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

            $(".get_country_state").html('<option value="">{{ __("Select State") }}</option>');
            $(".get_state_city").html('<option value="">{{ __("Select City") }}</option>');

            $.ajax({
                method: 'post',
                url: "{{ route('au.state.all') }}",
                data: { country: country },
                success: function (res) {
                    if (res.status === 'success') {
                        let options = "<option value=''>{{ __('Select State') }}</option>";
                        $.each(res.states, function (index, value) {
                            options += `<option value="${value.id}">${value.state}</option>`;
                        });

                        $(".get_country_state").html(options).trigger('change.select2');

                        $(".state_info").html(res.states.length ? '' : '<span class="text-danger">{{ __("No state found for selected country!") }}</span>');
                    }
                }
            });
        });

        // Load cities when state is selected
        $('#state').on('change', function () {
            let state = $(this).val();
            if (!state) return;

            $(".get_state_city").html('<option value="">{{ __("Select City") }}</option>');

            $.ajax({
                method: 'post',
                url: "{{ route('au.city.all') }}",
                data: { state: state },
                success: function (res) {
                    let options = "<option value=''>{{ __('Select City') }}</option>";
                    if (res.status === 'success') {
                        res.cities.forEach(city => {
                            options += `<option value="${city.id}">${city.city}</option>`;
                        });
                    }

                    $(".get_state_city").html(options).trigger('change.select2');
                    $(".city_info").html(res.cities.length ? '' : '<span class="text-danger">{{ __("No city found for selected state!") }}</span>');
                }
            });
        });

        let storedCountry = "{{ $user_identity->country_id ?? '' }}";
        let storedState = "{{ $user_identity->state_id ?? '' }}";
        let storedCity = "{{ $user_identity->city_id ?? '' }}";

        function setStateAndCity(country, state, city) {
            if (!country) return;

            $.ajax({
                method: 'post',
                url: "{{ route('au.state.all') }}",
                data: { country },
                success: function (res) {
                    if (res.status === 'success') {
                        let stateOptions = "<option value=''>{{ __('Select State') }}</option>";
                        $.each(res.states, function (index, value) {
                            stateOptions += `<option value="${value.id}" ${value.id == state ? 'selected' : ''}>${value.state}</option>`;
                        });

                        $(".get_country_state").html(stateOptions).trigger('change.select2');
                        $(".state_info").html(res.states.length ? '' : '<span class="text-danger">{{ __("No state found for selected country!") }}</span>');

                        if (state) {
                            $.ajax({
                                method: 'post',
                                url: "{{ route('au.city.all') }}",
                                data: { state },
                                success: function (res) {
                                    let cityOptions = "<option value=''>{{ __('Select City') }}</option>";
                                    if (res.status === 'success') {
                                        res.cities.forEach(cityItem => {
                                            cityOptions += `<option value="${cityItem.id}" ${cityItem.id == city ? 'selected' : ''}>${cityItem.city}</option>`;
                                        });
                                    }

                                    $(".get_state_city").html(cityOptions).trigger('change.select2');
                                    $(".city_info").html(res.cities.length ? '' : '<span class="text-danger">{{ __("No city found for selected state!") }}</span>');
                                }
                            });
                        }
                    }
                }
            });
        }

        // Trigger on load
        setStateAndCity(storedCountry, storedState, storedCity);


            //front image preview
            $('.front_image_preview').hide();
            document.querySelector('#front_image').addEventListener('change', function() {
                $('.front_image_preview').show();
                $('.front_image').hide();
                $(".identity_verify_front").find('span').first().hide();
                $(".identity_verify_front").find('p').first().text("{{__('Click to change photo')}}");

                if (this.files && this.files[0]) {
                    let img = document.querySelector('.front_image_preview');
                    img.onload = () => URL.revokeObjectURL(img.src); // clean memory
                    img.src = URL.createObjectURL(this.files[0]);
                    // 🔥 DO NOT set .value for file inputs
                    // 🔥 DO NOT manually set .files unless duplicating inputs
                }
            });

                // Back image preview
            $('.back_image_preview').hide();
            document.querySelector('#back_image').addEventListener('change', function() {
                $('.back_image_preview').show();
                $('.back_image').hide();
                $(".identity_verify_back").find('span').last().hide();
                $(".identity_verify_back").find('p').last().text("{{__('Click to change photo')}}");

                if (this.files && this.files[0]) {
                    let img = document.querySelector('.back_image_preview');
                    img.onload = () => URL.revokeObjectURL(img.src);
                    img.src = URL.createObjectURL(this.files[0]);
                }
            });


            //identity verification request
            $(document).on('submit','#submit_freelancer_verify_info',function(e){
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
                    $.ajax({
                        url:"{{ route('freelancer.identity.verification') }}",
                        method:'post',
                        data: new FormData(this),
                        cache: false,
                        contentType: false,
                        processData: false,
                        success:function(res){
                            $('.error_msg_container').html('');
                            if(res.status=='success'){
                                $('#display_freelancer_identity_verification').html(res);
                                $('#display_freelancer_identity_verification').load(location.href + " #display_freelancer_identity_verification");
                                $('.back_image_preview').hide();
                                $('.front_image_preview').hide();
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

    // toastr warning
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
    // toastr success
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
