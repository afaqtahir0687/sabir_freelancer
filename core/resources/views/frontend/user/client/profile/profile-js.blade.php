<script>
    (function($){
        "use strict";
        $(document).ready(function(){

            $('.country_select2').select2({
                dropdownParent: $('.popup-fixed')
            });
            $('.state_select2').select2({
                dropdownParent: $('.popup-fixed')
            });
            $('.city_select2').select2({
                dropdownParent: $('.popup-fixed')
            });

            // profile photo change
            // document.querySelector('#profile_photo').addEventListener('change', function() {
            //     $("#profilePhotoModal").modal('show');
            //     if (this.files && this.files[0]) {
            //         let img = document.querySelector('.profile_photo_preview');
            //         img.onload = () => {
            //             URL.revokeObjectURL(img.src);  // no longer needed, free memory
            //         }
            //         img.src = URL.createObjectURL(this.files[0]); // set src to blob url
            //         document.querySelector(".profile_photo_upload").files = this.files;
            //         document.querySelector(".profile_photo_upload").value = this.value;
            //     }
            // });

            //change profile photo
            $(document).on('submit','#profile_photo_change',function(e){
                e.preventDefault();
                $.ajax({
                    url:"{{ route('client.profile.photo.edit') }}",
                    method:'post',
                    data: new FormData(this),
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function() {
                        $('#profilePhotoModal').modal('hide');
                        toastr_success_js("{{ __('Profile Photo Successfully Changed') }}");

                        window.location.reload();
                    },
                    error: function (err) {
                        let error = err.responseJSON;
                        $('.error_msg_container').html('');
                        $.each(error.errors, function (index, value) {
                            $('.error_msg_container').append('<p class="text-danger">'+value+'<p>');
                        });
                    }
                })
            });

               // change country and get state
               $(document).on('change', '#country_id', function() {
                    let country = $(this).val();
                    $.ajax({
                        method: 'post',
                        url: "{{ route('au.state.all') }}",
                        data: {
                            country: country
                        },
                        success: function(res) {
                            if (res.status == 'success') {
                                let all_options = "<option value=''>{{__('Select State')}}</option>";
                                let all_state = res.states;
                                $.each(all_state, function(index, value) {
                                    all_options += "<option value='" + value.id +
                                        "'>" + value.state + "</option>";
                                });
                                $(".get_country_state").html(all_options);
                                $(".state_info").html('');
                                if(all_state.length <= 0){
                                    $(".state_info").html('<span class="text-danger"> {{ __('No state found for selected country!') }} <span>');
                                }
                            }
                        }
                    })
                })

                // change state and get city
                $(document).on('change', '.get_country_state', function() {
                    let state = $(this).val();
                    $.ajax({
                        method: 'post',
                        url: "{{ route('au.city.all') }}",
                        data: {
                            state: state
                        },
                        success: function(res) {
                            if (res.status == 'success') {
                                let all_options = "<option value=''>{{__('Select City')}}</option>";
                                let all_city = res.cities;
                                $.each(all_city, function(index, value) {
                                    all_options += "<option value='" + value.id +
                                        "'>" + value.city + "</option>";
                                });
                                $(".get_state_city").html(all_options);
                                $(".city_info").html('');
                                if(all_city.length <= 0){
                                    $(".city_info").html('<span class="text-danger"> {{ __('No city found for selected state!') }} <span>');
                                }
                            }
                        }
                    })
                })

                // Pre-populate state and city dropdowns
                $(document).ready(function() {
                    let storedCountry = "{{ $user->country_id ?? '' }}";
                    let storedState = "{{ $user->state_id ?? '' }}";
                    let storedCity = "{{ $user->city_id ?? '' }}";

                    // Set the selected country, state, and city
                    $('#country_id').val(storedCountry).trigger('change');
                    function setStateAndCity(country, state, city) {
                        if (country) {
                            $.ajax({
                                method: 'post',
                                url: "{{ route('au.state.all') }}",
                                data: {
                                    country: country
                                },
                                success: function(res) {
                                    if (res.status == 'success') {
                                        let all_options = "<option value=''>{{__('Select State')}}</option>";
                                        $.each(res.states, function(index, value) {
                                            all_options += "<option value='" + value.id + "' " + (value.id == state ? 'selected' : '') + ">" + value.state + "</option>";
                                        });

                                        $(".get_country_state").html(all_options).val(state).trigger('change');
                                        $(".state_info").html('');
                                        if (res.states.length <= 0) {
                                            $(".state_info").html('<span class="text-danger"> {{ __("No state found for selected country!") }} </span>');
                                        }

                                        // Pre-populate city dropdown
                                        $.ajax({
                                            method: 'post',
                                            url: "{{ route('au.city.all') }}",
                                            data: {
                                                state: state
                                            },
                                            success: function(res) {
                                                if (res.status == 'success') {
                                                    let all_options = "<option value=''>{{__('Select City')}}</option>";
                                                    $.each(res.cities, function(index, value) {
                                                        all_options += "<option value='" + value.id + "' " + (value.id == city ? 'selected' : '') + ">" + value.city + "</option>";
                                                    });

                                                    $(".get_state_city").html(all_options);
                                                    $(".city_info").html('');
                                                    if (res.cities.length <= 0) {
                                                        $(".city_info").html('<span class="text-danger"> {{ __("No city found for selected state!") }} </span>');
                                                    }
                                                }
                                            }
                                        });
                                    }
                                }
                            });
                        }
                    }

                    setStateAndCity(storedCountry, storedState, storedCity);
                })

            //update profile
            $(document).on('submit','#edit_profile_form',function(e){
                e.preventDefault();

                let first_name = $('#first_name').val();
                let last_name = $('#last_name').val();
                let email = $('#email').val();
                let country = $('#country_id').val();
                let state = $('#state_id').val();
                let city = $('#city_id').val();
                let hasProfilePhoto = "{{ !empty(Auth::guard('web')->user()->image) }}"; // or 'client' guard if needed

                if (!hasProfilePhoto) {
                    toastr_warning_js("{{ __('Please upload a profile photo first before updating personal information') }}");
                    return false;
                }

                if (first_name == '' || last_name == '' || email == '' || country == '') {
                    toastr_warning_js('Except state and city all fields required !');
                    return false;
                } else {
                    $.ajax({
                        url: "{{ route('client.profile.edit') }}",
                        type: 'post',
                        data: {
                            first_name: first_name,
                            last_name: last_name,
                            email: email,
                            country: country,
                            state: state,
                            city: city,
                        },
                        success: function(res){
                            if(res.status == 'ok'){
                                toastr_success_js("{{ __('Profile Info Successfully Updated') }}");

                                // ✅ Redirect to Identity Verification history
                                window.location.href = "{{ route('client.identity.verification') }}";
                            }
                        },
                        error: function (err) {
                            let error = err.responseJSON;
                            $('.error_msg_container').html('');
                            $.each(error.errors, function (index, value) {
                                $('.error_msg_container').append('<p class="text-danger">'+value+'<p>');
                            });
                        }
                    });
                }
            });


        });
    }(jQuery));


    // todo toastr warning
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

    $(document).ready(function(){
        let cropper;

        $('#profile_photo').on('change', function(e) {
            const files = e.target.files;
            const done = function(url) {
                $('.profile_photo_preview').attr('src', url);
                $('#profilePhotoModal').modal('show');
            };

            let reader;
            let file;
            let url;

            if (files && files.length > 0) {
                file = files[0];
                if (URL) {
                    done(URL.createObjectURL(file));
                } else if (FileReader) {
                    reader = new FileReader();
                    reader.onload = function(e) {
                        done(reader.result);
                    };
                    reader.readAsDataURL(file);
                }
            }
        });

        $('#profilePhotoModal').on('shown.bs.modal', function() {
            const image = document.querySelector('#previewProfilePhoto');
            cropper = new Cropper(image, {
                aspectRatio: 1,
                viewMode: 3,
                cropBoxResizable: false,
                scalable: false,
                zoomable: false,
            });
        }).on('hidden.bs.modal', function() {
            if(cropper){
                cropper.destroy();
                cropper = null;
            }
        });

        $('.resize-done').on('click', function(e){
            e.preventDefault()
            const canvas = cropper.getCroppedCanvas({
                width: 80,
                height: 80,
            });


            $('.resize-done').attr('disabled', 'disabled')

            canvas.toBlob(function(blob) {
                const url = URL.createObjectURL(blob);
                const reader = new FileReader();
                reader.readAsDataURL(blob);
                reader.onloadend = function() {
                    const base64data = reader.result;
                    // $('.cropped_image').val(base64data);
                    $('.profile_photo_preview').attr('src', base64data);

                    const file = new File([blob], "cropped_image.png", {type: blob.type});
                    const dataTransfer = new DataTransfer();
                    dataTransfer.items.add(file);
                    $('.cropped_image').prop('files', dataTransfer.files);

                    // $('#profilePhotoModal').modal('hide');
                    $('#profile_photo_change').submit()
                    if(cropper){
                        cropper.destroy();
                        cropper = null;
                    }
                };
            });
        });
    });

</script>
