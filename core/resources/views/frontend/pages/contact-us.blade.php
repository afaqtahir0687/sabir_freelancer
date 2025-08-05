@php
    use Modules\Pages\Entities\Page;
    $page_post = Page::where('slug', 'contact-us')->first();
    $page_type = 'page';
@endphp
@include('frontend.pages.dynamic.dynamic-single', [
    'page_post' => $page_post,
    'page_type' => $page_post,
])