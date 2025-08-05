@extends('backend.layout.master')
@section('title', __('Minimum Hour Settings'))
@section('style')
    <x-media.css/>
@endsection
@section('content')
    <div class="dashboard__body">
        <div class="row">
            <div class="col-lg-6">
                <div class="customMarkup__single">
                    <div class="customMarkup__single__item">
                        <div class="customMarkup__single__item__flex">
                            <h4 class="customMarkup__single__title">{{ __('Minimum Hour Settings') }}</h4>
                        </div>
                        <x-validation.error />
                        <div class="customMarkup__single__inner mt-4">
                            <x-notice.general-notice :class="'mt-5'" :description="__('Notice: Set minimum hour to show realtime earnings.')" />
                            <form action="{{route('admin.hourly.job.hour.settings')}}" method="post">
                                @csrf
                                <div class="single-input my-5">
                                    <label class="label-title">{{ __('Enable/Disable Jobs') }}</label>
                                    <input type="number" name="minimum_hour_for_realtime_earning" value="{{ get_static_option('minimum_hour_for_realtime_earning') ?? 1 }}" class="form-control">
                                </div>
                                <x-btn.submit :title="__('Update')" :class="'btn btn-primary mt-4 pr-4 pl-4'" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <x-media.markup/>
@endsection
