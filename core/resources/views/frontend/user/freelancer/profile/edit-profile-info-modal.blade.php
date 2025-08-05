<!-- Profile Settings Popup Starts -->
<div class="popup-overlay"></div>
<form id="edit_profile_form" method="post">
    @csrf
    <div class="popup-fixed profile-popup">
        <div class="popup-contents">
            <span class="popup-contents-close popup-close"> <i class="fas fa-times"></i> </span>
            <h2 class="popup-contents-title"> {{ __('Personal Information') }} </h2>
            <x-notice.general-notice :description="__('Notice: Except state and city all fields are required. Your identity verify documents info must be similar your personal info.')" />
            <div class="popup-contents-form custom-form profile-border-top">
                <div class="error_msg_container"></div>
                <div class="single-flex-input">
                    <x-form.text :title="__('First Name')" :type="__('text')" :name="'first_name'" :id="'first_name'" :placeholder="__('Type First Name')" :value="Auth::guard('web')->user()->first_name ?? '' "/>
                    <x-form.text :title="__('Last Name')" :type="__('text')" :name="'last_name'" :id="'last_name'" :placeholder="__('Type Last Name')" :value="Auth::guard('web')->user()->last_name ?? '' "/>
                </div>
                <div class="single-flex-input">
                    <x-form.email :title="__('Your Email')" :type="__('email')" :name="'email'" :id="'email'" :placeholder="__('Type Email')" :value="Auth::guard('web')->user()->email ?? '' "/>
                </div>
                <div class="form-group">
                    <label for="country_id">{{ __('ID issuing country') }}</label>
                    <select name="country" id="country_id" class="form--control country_select2">
                        <option value="">{{ __('Select Country') }}</option>
                        @foreach($countries as $country)
                            <option value="{{ $country->id }}" {{ old('country', $user_identity->country_id ?? '') == $country->id ? 'selected' : '' }}>
                                {{ $country->country }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label for="state_id">{{ __('State') }}</label>
                    <select name="state" id="state_id" class="form--control state_select2 get_country_state">
                        <option value="">{{ __('Select State') }}</option>
                        {{-- You can optionally pre-load state options here based on old values --}}
                    </select>
                </div>

                <div class="form-group">
                    <label for="city_id">{{ __('City (optional)') }}</label>
                    <select name="city" id="city_id" class="form--control city_select2 get_state_city">
                        <option value="">{{ __('Select City') }}</option>
                        {{-- You can optionally pre-load city options here based on old values --}}
                    </select>
                </div>
                <div class="single-flex-input">
                    <div class="single-flex-input">
                        <div class="single-input">
                            <label class="label-title">{{ __('Select Experience Level') }}</label>
                            <select name="level" id="level" class="form-control">
                                <option value="">{{ __('Select') }}</option>
                                <option value="junior" @if(Auth::guard('web')->check() && Auth::guard('web')->user()->experience_level == 'junior') selected @endif>{{ __('Junior') }}</option>
                                <option value="midlevel"  @if(Auth::guard('web')->check() && Auth::guard('web')->user()->experience_level == 'midLevel') selected @endif>{{ __('Mid Level') }}</option>
                                <option value="senior"  @if(Auth::guard('web')->check() && Auth::guard('web')->user()->experience_level == 'senior') selected @endif>{{ __('Senior') }}</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="popup-contents-btn flex-btn profile-border-top justify-content-end">
                <a href="javascript:void(0)" class="btn-profile btn-outline-gray btn-hover-danger color-one popup-close"> <i class="las la-arrow-left"></i> {{__('Cancel')}} </a>
                <button type="submit" class="btn-profile btn-bg-1">{{ __('Update Profile') }}</button>
            </div>
        </div>
    </div>
</form>
</div>
<!-- Profile Settings Popup Ends -->
