@extends('frontend.layout.master')
@section('site_title',__('Advertisement'))
@section('meta_title'){{ __('Advertisement') }}@endsection
@section('content')
    <main>
        <x-breadcrumb.user-profile-breadcrumb :title=" __('Advertisement Create')" :innerTitle=" __('Advertisement Create') ?? '' "/>
        <div class="preview-area section-bg-2 pat-100 pab-100">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="categoryWrap-wrapper-item">
                                    <form method="post" action="{{route('ad.store')}}" enctype="multipart/form-data">
                                        @csrf
                                        <div class="form-group mb-3">
                                            <label for="companyName">Company Name</label>
                                            <input value="{{old('company') ? old('company') : ''}}" name="company" type="text" class="form-control" id="companyName" placeholder="Enter your email address">
                                            @error('company')
                                            <span class="form-text text-danger">{{$message}}</span>
                                            @enderror
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="title">Ad Title</label>
                                            <input value="{{old('title') ? old('title') : ''}}" name="title" type="text" class="form-control" id="title" placeholder="Enter your ad title">
                                            @error('title')
                                            <span class="form-text text-danger">{{$message}}</span>
                                            @enderror
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="adUrl">Ad Url</label>
                                            <input value="{{old('url') ? old('url') : ''}}" name="url" type="text" class="form-control" id="adUrl" placeholder="Enter ad url">
                                            @error('url')
                                            <span class="form-text text-danger">{{$message}}</span>
                                            @enderror
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="description">Ad Description</label>
                                            <input value="{{old('description') ? old('description') : ''}}" name="description" type="text" class="form-control" id="description" placeholder="Enter your ad description here">
                                            @error('description')
                                            <span class="form-text text-danger">{{$message}}</span>
                                            @enderror
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="optimizeFor">Optimize For</label>
                                            <select name="optimize_for" id="optimizeFor" class="form-control">
                                                <option value="click" data-price="0.05">Click</option>
                                                <option value="impression" data-price="0.03">Impression</option>
                                            </select>
                                            <span class="form-text">
                                                <b id="previewPricePerQuantity">$0.05</b>
                                            </span>
                                            @error('optimize_for')
                                            <span class="form-text text-danger">{{$message}}</span>
                                            @enderror
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="quantity">Quantity</label>
                                            <select name="quantity" id="quantity" class="form-control">
                                                <option value="1000">1000</option>
                                                <option value="2000">2000</option>
                                                <option value="3000">3000</option>
                                                <option value="4000">4000</option>
                                                <option value="5000">5000</option>
                                            </select>
                                            <div class="d-flex flex-row-reverse">
                                                <h4>
                                                    <b>
                                                        Total:
                                                        <span id="total">$50</span>
                                                    </b>
                                                </h4>
                                            </div>
                                            @error('quantity')
                                            <span class="form-text text-danger">{{$message}}</span>
                                            @enderror
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="formFile" class="form-label">Attachment</label>
                                            <input name="cover_image" class="form-control" type="file" id="formFile">
                                            @error('cover_image')
                                            <span class="form-text text-danger">{{$message}}</span>
                                            @enderror
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="categoryWrap-wrapper-item flex-column">
                                    <h4 id="previewTitle">Advertising</h4>
                                    <img id="previewUploadedImage" class="w-100" src="{{asset('assets/frontend/img/ad.png')}}" alt="">
                                    <div><b id="previewCompanyName">Company Name</b></div>
                                    <div id="previewDescription">Description</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection

@section('script')
    <script>
        $(document).ready(function(){
            $('#companyName').on('input', function (){
                $('#previewCompanyName').text($(this).val())
            })
            $('#title').on('input', function (){
                $('#previewTitle').text($(this).val())
            })
            $('#description').on('input', function (){
                $('#previewDescription').text($(this).val())
            })



            function updateTotal() {
                // Get the selected price from optimizeFor dropdown
                var pricePerUnit = parseFloat($('#optimizeFor option:selected').data('price'));
                var selectedAdType = $('#optimizeFor option:selected').val();
                // Get the selected quantity
                var quantity = parseInt($('#quantity').val());
                // Calculate the total price
                var totalPrice = pricePerUnit * quantity;
                // Update the total price in the span with id "total"
                $('#total').text('$' + totalPrice);
                $('#previewPricePerQuantity').text('$'+pricePerUnit+' per ' + selectedAdType)
            }

            // Bind the change event to both select boxes
            $('#optimizeFor').change(updateTotal);
            $('#quantity').change(updateTotal);

            // Initial calculation
            updateTotal();


            $('#formFile').change(function() {
                // Check if a file was selected
                if (this.files && this.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function(e) {
                        // Set the src attribute of the preview image
                        $('#previewUploadedImage').attr('src', e.target.result);
                    }

                    reader.readAsDataURL(this.files[0]);
                }
            });
        })
    </script>
@endsection