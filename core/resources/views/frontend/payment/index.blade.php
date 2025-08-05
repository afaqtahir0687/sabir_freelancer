@extends('frontend.layout.master')

@section('meta_title'){{ __('Packages') }}@endsection
<style>
    main.container {
        background: #fff;
        border: 1px solid #eee;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }

    main.container h4 {
        font-weight: 600;
        margin-bottom: 1rem;
        color: #333;
        color: #309400;
    }

    main.container .payment-gateway-wrapper ul {
        list-style: none;
        padding: 0;
        display: flex;
        gap: 20px;
        justify-content: start;
    }

    main.container .payment-gateway-wrapper ul li {
        border: 2px solid #ddd;
        border-radius: 8px;
        padding: 10px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    main.container .payment-gateway-wrapper ul li:hover,
    main.container .payment-gateway-wrapper ul li.active {
        border-color: #309400;
        box-shadow: 0 0 10px rgba(48, 148, 0, 0.2);
    }

    main.container .payment-gateway-wrapper ul li img {
        width: 80px;
        height: auto;
        display: block;
    }

    main.container .btn-primary {
        padding: 10px 30px;
        font-size: 16px;
        border-radius: 6px;
    }

    main.container .fw-bold {
        font-size: 18px;
        color: #2a2a2a;
    }

    main.container .mb-4,
    main.container .mt-4 {
        margin-top: 1.5rem !important;
        margin-bottom: 1.5rem !important;
    }
</style>

@section('content')
<main class="container py-4 mb-3 mt-3 ">

    <h4>{{ __('Choose Payment Method') }}</h4>

    <form action="{{ route('subscriptions.buy') }}" method="POST" enctype="multipart/form-data" id="payment-form">
        @csrf
        <input type="hidden" name="subscription_id" value="{{ $userSubscription->id }}">
        <input type="hidden" name="downgrade" id="downgrade_status" value="0">

        <!-- Hidden field that will be updated via JS based on the selected gateway -->
        <input type="hidden" name="payment_method" id="payment_method_hidden" value="">

        @if (Auth::check() && Auth::user()->user_wallet?->balance > 0)
            <div class="mb-3">
                <label class="form-label">{{ __('Wallet Balance:') }}</label>
                <div class="fw-bold">{{ float_amount_with_currency_symbol(Auth::user()->user_wallet->balance) }}</div>
            </div>
        @endif
            <div class="payment-gateway-wrapper payment_getway_image mb-4 mt-4" style="width:480px">
                <input type="hidden" name="selected_payment_gateway" id="order_from_user_wallet" value="paypal">
                <ul>
                        <li data-gateway="paypal" class="selected active"><div class="img-select"><img src="{{ asset('assets/uploads/media-uploader/paypal1731059254.png') }}" alt=""></div>
                        </li>
                        <li data-gateway="stripe"><div class="img-select"><img src="{{ asset('assets/uploads/media-uploader/stripe1731059585.png') }}" alt=""></div>
                    </li>
                </ul>
            </div>
        <!-- <div class="mb-4">
            {!! \App\Helper\PaymentGatewayList::renderPaymentGatewayForForm(false) !!}
        </div> -->

        <div class="mb-4">
            <h4>{{ __('Click below to proceed') }}</h4><br>
            <div class="d-flex gap-3">
                @if (Auth::check() && Auth::user()->user_type == 2)
                    <button type="submit" class="btn btn-primary">
                        {{ __('Buy Now') }}
                    </button>
                @endif
            </div>
        </div>
    </form>

</main>
@endsection

@section('script')
    <x-frontend.payment-gateway.gateway-select-js />
    @include('subscription::frontend.subscriptions.subscriptions-js')

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const gatewaySelect = document.querySelector('select[name="selected_payment_gateway"]');
            const hiddenInput = document.getElementById('payment_method_hidden');

            function updatePaymentMethod() {
                hiddenInput.value = gatewaySelect.value;
            }

            if (gatewaySelect) {
                updatePaymentMethod(); // Set on load
                gatewaySelect.addEventListener('change', updatePaymentMethod); // Set on change
            }
        });
    </script>
@endsection
