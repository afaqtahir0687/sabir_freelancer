@extends('backend.layout.master')
@section('title', __('Project Create Email'))
@section('style')
    <x-summernote.summernote-css />
@endsection
@section('content')
    <div class="dashboard__body">
        <div class="row">
            <div class="col-lg-12">
                <div class="customMarkup__single">
                    <div class="customMarkup__single__item">
                        <div class="customMarkup__single__item__flex">
                            <h4 class="customMarkup__single__title">{{ __('Project Create Email') }}</h4>
                        </div>
                        <div class="search_delete_wrapper">
                            <h4><a class="btn-profile btn-bg-1" href="{{ route('admin.email.template.all') }}">{{ __('All Templates') }}</a></h4>
                            <x-search.search-in-table :id="'string_search'" />
                        </div>
                        <div class="customMarkup__single__inner mt-4">
                            <x-validation.error />
                            <form action="{{route('admin.user.project.create')}}" method="POST" enctype="multipart/form-data">
                                @csrf
                                <x-form.text
                                    :title="__('Email Subject')"
                                    :type="__('text')"
                                    :name="'project_create_email_subject'"
                                    :id="'project_create_email_subject'"
                                    :value="get_static_option('project_create_email_subject') ?? __('Project Create Email')"
                                />
                               @php
                                    $emailMessage = get_static_option('project_create_email_message');
                                    if (!$emailMessage) {
                                        $emailMessage = '
                                        <div style="font-family:Arial,sans-serif;max-width:600px;margin:0 auto;background:#ffffff;border:1px solid #e5e5e5;padding:30px;border-radius:8px;">
                                            <h6 style="color:#28a745;">Congratulations! Your project is approved.</h6>

                                            <div style="border:1px solid #ddd;padding:15px;margin-top:20px;border-radius:6px;background-color:#f9f9f9;">
                                                <p><a href="https://rightfreelancer.com/projects/@project_id">View Project</a></p>
                                            </div>

                                            <p style="margin-top:20px;">Your project is live and available to buy now. You can edit your project or change its availability any time on your Project Dashboard.</p>
                                            <p>Want to share it on your social media? Freelancers who share their projects get more visibility and orders!</p>

                                            <p style="margin-top:30px;font-size:14px;color:#888;">Thanks,<br>The RightFreelancer Team</p>
                                        </div>';
                                    }
                                @endphp

                                <x-form.summernote
                                    :title="__('Email Message')"
                                    :name="'project_create_email_message'"
                                    :id="'project_create_email_message'"
                                    :value="$emailMessage"
                                />
                                <small class="form-text text-muted text-danger margin-top-20"><code>@project_id</code> {{__('will be replaced by dynamically with project id.')}}</small><br>
                                <x-btn.submit :title="__('Save')" :class="'btn-profile btn-bg-1 mt-4 pr-4 pl-4 update_info'" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <x-summernote.summernote-js />
@endsection
