<div class="modal fade" id="paymentGatewayModal" tabindex="-1" aria-labelledby="paymentGatewayModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="{{ route('subscriptions.buy') }}" method="post" enctype="multipart/form-data" id="payment-form">
            <input type="hidden" name="subscription_id" id="subscription_id">
            <input type="hidden" name="downgrade" id="downgrade_status" value="0"> <!-- Hidden field to indicate downgrade -->
            @csrf
            <div class="modal-content">
                <div class="modal-header">
                    @if(Auth::guard('web')->check())
                        @if(Auth::guard('web')->user()->user_type == 1)
                            <x-notice.general-notice :description="__('Notice: Please login as a freelancer to buy a Packages.')" />
                        @else
                            <h4 id="modal-title">{{ __('Buy Package') }}</h4>
                        @endif
                    @endif
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                </div>
                <div class="modal-body">
                    <div id="free-plan-message" style="display: none;">
                        <p>{{ __('Are you sure you want to downgrade your current package? This may limit some of the features you\'re currently using. Please confirm.') }}</p>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                            <button type="button" class="btn btn-primary" id="free_plan_confirm_button">Yes</button>
                        </div>
                    </div>
                    <div class="confirm-payment payment-border" id="payment-section">
                        <div class="single-checkbox">
                            <div class="checkbox-inlines">
                                <label class="checkbox-label load_after_login" for="choose">
                                <div class="payment-gateway-wrapper payment_getway_image" style="width:480px">
                                    <input type="hidden" name="selected_payment_gateway" id="order_from_user_wallet" value="paypal">
                                    <ul>
                                            <li data-gateway="paypal" class="selected active"><div class="img-select"><img src="{{ asset('assets/uploads/media-uploader/paypal1731059254.png') }}" alt=""></div>
                                            </li>
                                            <li data-gateway="stripe"><div class="img-select"><img src="{{ asset('assets/uploads/media-uploader/stripe1731059585.png') }}" alt=""></div>
                                        </li>
                                    </ul>
                                </div>
                                    @if (Auth::check() && Auth::user()->user_wallet?->balance > 0)
                                        {!! \App\Helper\PaymentGatewayList::renderWalletForm() !!}
                                        <span class="wallet-balance mt-2 d-block">{{ __('Wallet Balance:') }}
                                            <strong class="main-balance">{{ float_amount_with_currency_symbol(Auth::user()->user_wallet?->balance) }}</strong></span>
                                        <br>
                                        <span class="display_balance"></span>
                                        <br>
                                        <span class="deposit_link"></span>
                                    @endif
                                    <!-- {!! \App\Helper\PaymentGatewayList::renderPaymentGatewayForForm(false) !!} -->
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn-profile btn-outline-gray btn-hover-danger" data-bs-dismiss="modal">{{ __('Close') }}</button>
                    @if (Auth::guard('web')->check() && Auth::guard('web')->user()->user_type == 2)
                        <button type="submit" class="btn-profile btn-bg-1 buy_subscription" id="confirm_buy_subscription_load_spinner">{{ __('Buy Now') }} <span id="buy_subscription_load_spinner"></span></button>
                    @endif
                </div>
            </div>
        </form>
    </div>
</div>
