@extends('backend.layout.master')
@section('title', __('Storage Settings'))
@section('style')
    <x-media.css/>
    <style>
        .credentials{
            display: none;
        }
        .info{
            cursor: pointer;
        }
        .info:hover{
            color: #009eff;
        }
        .cloud-alert b{
            cursor: pointer;
        }
        .sync-btn {
            transition: 0.1s;
        }
    </style>
@endsection
@section('content')
    <div class="dashboard__body">
        <div class="row">
            <div class="col-lg-12">
                <div class="customMarkup__single">
                    <div class="customMarkup__single__item">
                        <div class="customMarkup__single__item__flex">
                            <h4 class="customMarkup__single__title">{{ __('Storage Settings') }}</h4>
                        </div>
                        <div class="text-end">
                            <form action="{{ route('admin.upload.local.file.cloud') }}" method="post">
                                @csrf
                                <input type="hidden" name="_action" value="sync_file">
                                <button class="sync-btn btn btn-primary btn-sm" type="submit">{{ __('Sync Local File To Cloud') }} <span id="synced_load_spinner"></span></button>
                            </form>
                        </div>

                        <x-validation.error />
                        <div class="customMarkup__single__inner mt-4">
                            <x-notice.general-notice :class="'mt-5'" :description="__('Notice: By default it is local, if you have disk driver you can set here, unless leave this as (Local)')" />

                            <form class="forms-sample" method="post" action="{{route('admin.cloud.storage.settings.update')}}">
                                @csrf
                                <div class="single-input my-5">
                                    <label class="label-title">{{ __('Disks Driver') }}</label>
                                    <select name="storage_driver" id="storage-driver" class="form-control">
                                        <option value="">{{ __('Select Driver') }}</option>
                                        <option value="CustomUploader" {{ get_static_option('storage_driver') == 'CustomUploader' ? 'selected' : '' }}>{{__('Local')}}</option>
                                        <option value="cloudFlareR2" {{ get_static_option('storage_driver') == 'cloudFlareR2' ? 'selected' : '' }}>{{__('cloud Flare R2')}}</option>
                                        <option value="wasabi" {{ get_static_option('storage_driver') == 'wasabi' ? 'selected' : '' }}>{{__('Wasabi s3')}}</option>
                                        <option value="s3" {{ get_static_option('storage_driver') == 's3' ? 'selected' : '' }}>{{__('Aws s3')}}</option>
                                    </select>
                                </div>

                                <div class="credentials_wrapper mt-5">

                                    <div class="credentials wasabi" @style(['display:block' => get_static_option('storage_driver') == 'wasabi'])>
                                        <div class="form-group">
                                            <label for="">{{__('Wasabi Access Key ID')}}</label>
                                            <input class="form-control" type="text" name="wasabi_access_key_id" value="{{get_static_option('wasabi_access_key_id')}}">
                                        </div>
                                        <div class="form-group">
                                            <label for="">{{__('Wasabi Secret Access Key')}}</label>
                                            <input class="form-control" type="text" name="wasabi_secret_access_key" value="{{get_static_option('wasabi_secret_access_key')}}">
                                        </div>
                                        <div class="form-group">
                                            <label for="">{{__('Wasabi Default Region')}}</label>
                                            <input class="form-control" type="text" name="wasabi_default_region" value="{{get_static_option('wasabi_default_region')}}">
                                        </div>
                                        <div class="form-group">
                                            <label for="">{{__('Wasabi Bucket')}}</label>
                                            <input class="form-control" type="text" name="wasabi_bucket" value="{{get_static_option('wasabi_bucket')}}">
                                        </div>
                                        <div class="form-group">
                                            <label for="">{{__('Wasabi ENDPOINT')}}</label>
                                            <input class="form-control" type="text" name="wasabi_endpoint" value="{{get_static_option('wasabi_endpoint')}}">
                                        </div>
                                    </div>
                                    <div class="credentials cloudFlareR2" @style(['display:block' => get_static_option('storage_driver') == 'cloudFlareR2'])>
                                        <div class="form-group">
                                            <label for="">{{__('Cloudflare R2 Access Key ID')}}</label>
                                            <input class="form-control" type="text" name="cloudflare_r2_access_key_id" value="{{get_static_option('cloudflare_r2_access_key_id')}}">
                                        </div>

                                        <div class="form-group">
                                            <label for="">{{__('Cloudflare R2 Secret Access Key')}}</label>
                                            <input class="form-control" type="text" name="cloudflare_r2_secret_access_key" value="{{get_static_option('cloudflare_r2_secret_access_key')}}">
                                        </div>

                                        <div class="form-group">
                                            <label for="">{{__('Cloudflare R2 Bucket')}}</label>
                                            <input class="form-control" type="text" name="cloudflare_r2_bucket" value="{{get_static_option('cloudflare_r2_bucket')}}">
                                        </div>

                                        <div class="form-group">
                                            <label for="">{{__('Cloudflare R2 URL')}}</label>
                                            <input class="form-control" type="text" name="cloudflare_r2_url" value="{{get_static_option('cloudflare_r2_url')}}">
                                        </div>

                                        <div class="form-group">
                                            <label for="">{{__('Cloudflare R2 Endpoint')}}</label>
                                            <input class="form-control" type="text" name="cloudflare_r2_endpoint" value="{{get_static_option('cloudflare_r2_endpoint')}}">
                                        </div>

                                        <div class="form-group">
                                            <label for="">{{__('Cloudflare R2 Use Path Style Endpoint')}}</label>
                                            <select class="form-control" name="cloudflare_r2_use_path_style_endpoint">
                                                <option value="1" {{get_static_option('cloudflare_r2_use_path_style_endpoint') == 1 ? 'selected' : ''}}>{{__('Yes')}}</option>
                                                <option value="0" {{get_static_option('cloudflare_r2_use_path_style_endpoint') == 0 ? 'selected' : ''}}>{{__('No')}}</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="credentials s3" @style(['display:block' => get_static_option('storage_driver') == 's3'])>
                                        <div class="form-group">
                                            <label for="">{{__('AWS Access Key ID')}}</label>
                                            <input class="form-control" type="text" name="aws_access_key_id" value="{{get_static_option('aws_access_key_id')}}">
                                        </div>
                                        <div class="form-group">
                                            <label for="">{{__('AWS Secret Access Key')}}</label>
                                            <input class="form-control" type="text" name="aws_secret_access_key" value="{{get_static_option('aws_secret_access_key')}}">
                                        </div>
                                        <div class="form-group">
                                            <label for="">{{__('AWS Default Region')}}</label>
                                            <input class="form-control" type="text" name="aws_default_region" value="{{get_static_option('aws_default_region')}}">
                                        </div>
                                        <div class="form-group">
                                            <label for="">{{__('AWS Bucket')}}</label>
                                            <input class="form-control" type="text" name="aws_bucket" value="{{get_static_option('aws_bucket')}}">
                                        </div>
                                        <div class="form-group">
                                            <label for="">{{__('AWS URL')}}</label>
                                            <input class="form-control" type="text" name="aws_url" value="{{get_static_option('aws_url')}}">
                                        </div>
                                        <div class="form-group">
                                            <label for="">{{__('AWS Endpoint')}}</label>
                                            <input class="form-control" type="text" name="aws_endpoint" value="{{get_static_option('aws_endpoint')}}">
                                        </div>
                                        <div class="form-group">
                                            <label for="">{{__('AWS Use Path Style Endpoint')}}</label>
                                            <select class="form-control" name="aws_use_path_style_endpoint">
                                                <option value="1" {{get_static_option('aws_use_path_style_endpoint') == 1 ? 'selected' : ''}}>{{__('Yes')}}</option>
                                                <option value="0" {{get_static_option('aws_use_path_style_endpoint') == 0 ? 'selected' : ''}}>{{__('No')}}</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>

                                <button type="submit" class="btn btn-primary mt-2">{{__('Update')}}</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <x-media.markup/>
@endsection

@section('script')
    <x-sweet-alert.sweet-alert2-js />
    <x-media.js />
    <script>
        $(document).ready(function () {
            $(document).on('change', '#storage-driver', function () {
                let driver = $(this).val();

                Swal.fire({
                    title: "{{ __('Do you want to change this cloud driver?') }}",
                    text: '{{__("If you change your storage driver, you will need to download all the media files before to re-sync on newly selected driver")}}',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '{{__('Change')}}',
                    confirmButtonColor: '#009eff',
                    cancelButtonText: "{{__('Discard')}}",
                    cancelButtonColor: '#ff2600'
                }).then((result) => {
                    if (result.isConfirmed) {
                        changeState(driver);
                    } else {
                        window.location.reload();
                    }
                });
            });

            function changeState(driver) {
                $('.credentials').hide();
                $(`.${driver}`).fadeIn();
            }

            $(document).on('click','.sync-btn',function(){
                $('#synced_load_spinner').html('<i class="fas fa-spinner fa-pulse"></i>')
                setTimeout(function () {
                    $('#synced_load_spinner').html('');
                },10000000);
            });
        });
    </script>
@endsection