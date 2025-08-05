@extends('frontend.layout.master')
@section('site_title',__('Wallet History'))
@section('style')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />

    <style>
        .single-profile-settings-flex {
            justify-content: space-between;
        }
        .single-profile-settings-contents .single-profile-settings-contents-upload-btn {
            padding: 0;
        }
        .single-profile-settings .single-profile-settings-thumb {
            max-width: unset;
        }
        .balance-wallet {
            color: var(--paragraph-color);
        }
        .balance-wallet strong {
            color: var(--heading-color);
        }
        .single-profile-settings-thumb {
            width:unset;
        }

         .identity-verifying-flex {
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap; 
    gap: 10px;
}

.identity-verifying-list {
    flex: 1 1 0;
    min-width: 200px;  
    max-width: 250px;
    padding: 10px;
    box-sizing: border-box;
    background: #f8f8f8;
    border: 1px solid #ccc;
    border-radius: 5px;
    cursor: default;
    pointer-events: none;
}
.identity-verifying-list-contents-details-title {
    font-size: 14px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.identity-verifying-list-contents-flex {
    align-items: center;
    display: flex;
    gap: 8px;
}
.identity-verifying-list.completed {
    pointer-events: none;
    background-color: #d4edda;
    border-color: #309400;
    color: #155724;
    cursor: default;
}

.identity-verifying-list.completed i {
    color: #309400;
}

    </style>
@endsection

@section('content')
    <main>
        <x-breadcrumb.user-profile-breadcrumb :title="__('Wallet History')" :innerTitle="__('Wallet History')"/>

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
                                        <x-form.form-title :title="__('Profile Info')" :class="'single-profile-settings-header-title'" />
                                        <div>
                                            @include('frontend.user.partials.profile_completed_progressbar')
                                        </div>
                                    </div>
                                    <p class="mt-2">{{ __(key: 'Please complete the following four steps to complete your profile setup. This will help us to better understand your skills and experience.') }}</p>
                                     <!-- <strong>✅ Identity verification has been successfully completed. Please Your identity is now verified by the admin</strong><br> -->
                                </div>
                                <div class="identity-verifying-form custom-form profile-border-top">
                                    <div class="identity-verifying-flex">
                                        <div class="identity-verifying-list custom-radio {{ $step1Complete ? 'completed disabled' : '' }}">
                                            <div class="identity-verifying-list-flex">
                                                <div class="identity-verifying-list-contents">
                                                    <div class="identity-verifying-list-contents-flex">
                                                        <div class="identity-verifying-list-contents-icon">
                                                            <i class="fa-solid fa-user"></i>
                                                        </div>
                                                        <div class="identity-verifying-list-contents-details">
                                                            <h5 class="identity-verifying-list-contents-details-title">{{ __('Personal Information') }}</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="identity-verifying-list custom-radio account-setup-box {{ $step2Complete ? 'completed' : '' }}">
                                            <div class="identity-verifying-list-flex">
                                                <div class="identity-verifying-list-contents">
                                                <div class="identity-verifying-list-contents-flex">
                                                    <div class="identity-verifying-list-contents-icon">
                                                    <i class="fa-solid fa-user-gear"></i>
                                                    </div>
                                                    <div class="identity-verifying-list-contents-details">
                                                    <h5 class="identity-verifying-list-contents-details-title">{{ __('Account Setup') }}</h5>
                                                    </div>
                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="identity-verifying-list custom-radio {{ $step4Complete ? 'completed' : '' }}">
                                            <div class="identity-verifying-list-flex">
                                                <div class="identity-verifying-list-contents">
                                                    <div class="identity-verifying-list-contents-flex">
                                                        <div class="identity-verifying-list-contents-icon">
                                                            <i class="fa-solid fa-wallet"></i>
                                                        </div>
                                                        <div class="identity-verifying-list-contents-details">
                                                            <h5 class="identity-verifying-list-contents-details-title">{{ __('Wallet') }}</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="identity-verifying-list custom-radio {{ $step3Complete ? 'completed' : '' }}">
                                            <div class="identity-verifying-list-flex">
                                                <div class="identity-verifying-list-contents">
                                                    <div class="identity-verifying-list-contents-flex">
                                                        <div class="identity-verifying-list-contents-icon">
                                                            <i class="fa-solid fa-fingerprint"></i>
                                                        </div>
                                                        <div class="identity-verifying-list-contents-details">
                                                            <h5 class="identity-verifying-list-contents-details-title">{{ __('Identity Verification') }}</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="single-profile-settings mt-4" id="display_client_profile_photo">
                                <div class="single-profile-settings-flex">

                                    <div class="single-profile-settings-thumb">
                                        <h4 class="balance-wallet">{{ __('Balance:') }}
                                            <strong>{{ float_amount_with_currency_symbol($total_wallet_balance ?? 00) }}</strong>
                                        </h4>
                                        <p class="job-progress mt-2">{{ __('Earning+Deposit') }}</p>
                                    </div>
                                    <div class="d-flex gap-2">
                                        @if($total_wallet_balance >= get_static_option('minimum_withdraw_amount'))
                                        <div class="single-profile-settings-contents">
                                            <div class="single-profile-settings-contents-upload">
                                                <div class="single-profile-settings-contents-upload-btn">
                                                    @if(moduleExists('SecurityManage'))
                                                        @if(Auth::guard('web')->user()->freeze_withdraw == 'freeze')
                                                            <button type="button" class="btn btn-danger" disabled>{{ __('Withdraw Request') }}</button>
                                                        @else
                                                            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#withdrawModal">{{ __('Withdraw Request') }}</button>
                                                        @endif
                                                    @else
                                                        <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#withdrawModal">{{ __('Withdraw Request') }}</button>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                        @endif
                                        <div class="single-profile-settings-contents">
                                            <div class="single-profile-settings-contents-upload">
                                                <div class="single-profile-settings-contents-upload-btn">
                                                    <button class="btn-profile btn-bg-1" data-bs-toggle="modal" data-bs-target="#paymentGatewayModal">{{ __('Deposit to Wallet') }}</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> 

                            @php
                                $bank_account = Modules\Wallet\Entities\BankAccount::where('user_id', auth()->id())->first();
                            @endphp

                            <div class="mt-5 d-flex justify-content-center">
                                <div class="card shadow rounded w-100" style="max-width: 500px;">
                                    <div class="card-body">
                                        <h4 class="card-title text-center mb-4">{{ __('Bank Information') }}</h4>

                                        <form action="{{ route('freelancer.bank.submit') }}" method="POST">
                                            @csrf

                                          <div class="form-group mb-3">
                                                <label for="country_id">{{ __('ID issuing country') }}</label>
                                                <select name="country" id="country_id" class="form-control country_select2">
                                                    <option value="">{{ __('Select Country') }}</option>
                                                    @foreach($countries as $country)
                                                        <option value="{{ $country->id }}" {{ old('country', $bank_account->country_id ?? '') == $country->id ? 'selected' : '' }}>
                                                            {{ $country->country }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="form-group mb-3">
                                                <label for="bank_name">{{ __('Bank Name') }}</label>
                                                <input type="text" class="form-control" id="bank_name" name="bank_name" value="{{ old('bank_name', $bank_account->bank_name ?? '') }}" placeholder="{{ __('Enter Bank Name') }}" required>
                                            </div>

                                            <div class="form-group mb-3">
                                                <label for="account_title">{{ __('Account Title') }}</label>
                                                <input type="text" class="form-control" id="account_title" name="account_title" value="{{ old('account_title', $bank_account->account_title ?? '') }}" placeholder="{{ __('Enter Account Title') }}" required>
                                            </div>

                                            <div class="form-group mb-3">
                                                <label for="swis_code">{{ __('SWIFT Code') }}</label>
                                                <input type="text" class="form-control" id="swis_code" name="swis_code" value="{{ old('swis_code', $bank_account->swis_code ?? '') }}" placeholder="{{ __('Enter SWIFT Code') }}">
                                            </div>

                                            <div class="form-check form-check-inline mb-2">
                                                <input class="form-check-input" type="checkbox" id="show_iban" name="show_iban" {{ old('show_iban', $bank_account ? $bank_account->iban_number : '') ? 'checked' : '' }}>
                                                <label class="form-check-label" for="show_iban">{{ __('Add IBAN') }}</label>
                                            </div>
                                            <div class="form-group mt-3 {{ old('show_iban', $bank_account ? $bank_account->iban_number : '') ? '' : 'd-none' }}" id="iban_field">
                                                <label for="iban_number">{{ __('IBAN Number') }}</label>
                                                <input type="text" class="form-control" id="iban_number" name="iban_number" value="{{ old('iban_number', $bank_account ? $bank_account->iban_number : '') }}" placeholder="{{ __('Enter IBAN Number') }}">
                                            </div>

                                            <div class="form-check form-check-inline mb-2">
                                                <input class="form-check-input" type="checkbox" id="show_account" name="show_account" {{ old('show_account', $bank_account ? $bank_account->account_number : '') ? 'checked' : '' }}>
                                                <label class="form-check-label" for="show_account">{{ __('Add Account Number') }}</label>
                                            </div>

                                            <div class="form-group mt-3 {{ old('show_account', $bank_account ? $bank_account->account_number : '') ? '' : 'd-none' }}" id="account_field">
                                                <label for="account_number">{{ __('Account Number') }}</label>
                                                <input type="text" class="form-control" id="account_number" name="account_number" value="{{ old('account_number', $bank_account ? $bank_account->account_number : '') }}" placeholder="{{ __('Enter Account Number') }}">
                                            </div>

                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary mt-3 px-4">{{ __('Submit') }}</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="single-profile-settings mt-4" id="display_client_profile_info">
                                <div class="single-profile-settings-header">
                                    <x-validation.error />
                                    <div class="single-profile-settings-header-flex">
                                        <x-form.form-title :title="__('Wallet History')" :class="'single-profile-settings-header-title'" />
                                        <x-search.search-in-table :id="'string_search'" :placeholder="__('Enter date to search')" />
                                    </div>
                                </div>
                                <div class="single-profile-settings-inner profile-border-top">
                                    <div class="custom_table style-04 search_result">
                                          @include('wallet::freelancer.wallet.search-result')
                                    </div>
                                </div>
                            </div>
                            <!-- Bank Information Box -->
                            <div class="single-profile-settings mt-4">
                                <div class="single-profile-settings-header">
                                    <x-form.form-title :title="__('Bank Information')" :class="'single-profile-settings-header-title'" />
                                </div>
                                <div class="single-profile-settings-inner profile-border-top">
                                    <div class="custom_table style-04">
                                        <table>
                                            <thead>
                                            <tr>
                                                <th>{{ __('Country') }}</th>
                                                <th>{{ __('Bank Name') }}</th>
                                                <th>{{ __('Account Title') }}</th>
                                                <th>{{ __('SWIFT Code') }}</th>
                                                <th>{{ __('IBAN Number') }}</th>
                                                <th>{{ __('Account Number') }}</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @if($bank_account)
                                                <tr>
                                                    <td>{{ $bank_account->country->country ?? '' }}</td>
                                                    <td>{{ $bank_account->bank_name }}</td>
                                                    <td>{{ $bank_account->account_title }}</td>
                                                    <td>{{ $bank_account->swis_code }}</td>
                                                    <td>{{ $bank_account->iban_number ?? '' }}</td>
                                                    <td>{{ $bank_account->account_number ?? '' }}</td>
                                                </tr>
                                            @else
                                                <tr>
                                                    <td colspan="6">{{ __('No bank account information found.') }}</td>
                                                </tr>
                                            @endif
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Profile Settings area end -->
        @include('wallet::freelancer.wallet.withdraw-modal')
        <x-frontend.payment-gateway.gateway-markup :title="__('You can deposit to your wallet from the available payment gateway')"/>
    </main>
@endsection


@section('script')
    @include('wallet::freelancer.wallet.wallet-js')
    <x-frontend.payment-gateway.gateway-select-js />

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const ibanCheckbox = document.getElementById('show_iban');
        const accountCheckbox = document.getElementById('show_account');
        const ibanField = document.getElementById('iban_field');
        const accountField = document.getElementById('account_field');

        ibanCheckbox.addEventListener('change', function () {
            ibanField.classList.toggle('d-none', !this.checked);
        });

        accountCheckbox.addEventListener('change', function () {
            accountField.classList.toggle('d-none', !this.checked);
        });
    });
</script>

<script>
      $(document).ready(function () {
    $('.country_select2').select2({
        dropdownParent: $('.card-body')
    });
});

</script>
<script>
  function toastr_success_js(msg){
    toastr.options = {
        "closeButton": true,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "timeOut": "5000",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    toastr.success(msg, "Success!");
}

</script>

@if(session('success'))
    <script>
        toastr_success_js(@json(session('success')));
    </script>
@endif

@endsection
