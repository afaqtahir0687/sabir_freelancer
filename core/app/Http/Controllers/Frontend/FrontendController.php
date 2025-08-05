<?php

namespace App\Http\Controllers\Frontend;

use App\Blog;
use App\Http\Controllers\Controller;
use App\Models\Ad;
use App\Models\StaticOption;
use App\Models\User;
use App\Models\Order;
use App\Service;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Intervention\Image\Facades\Image;
use Modules\Pages\Entities\Page;

class FrontendController extends Controller
{
    public function home_page()
    {
        $home_page_id = get_static_option('home_page');
        $page_details = Page::find($home_page_id);
        if (empty($page_details)) {
            // show any notice or
        }

        $topFreelancers = Order::where('payment_status', 'complete')->selectRaw('freelancer_id, COUNT(*) as total_orders')
        ->groupBy('freelancer_id')->orderByDesc('total_orders')->take(6)->with('freelancer')->get()->pluck('freelancer');

        return view('frontend.pages.frontend-home-3', compact('page_details', 'topFreelancers'));
    }

    public function dynamic_single_page($slug)
    {
        $page_post = Page::where('slug', $slug)->first();

        $user_details    = User::where(['user_type' => 0, 'username' => $slug])->first();
        $preserved_pages = [
            'home_page',
            'service_list_page',
            'blog_page',
        ];

        $static_option = StaticOption::whereIn('option_name', $preserved_pages)->get()->mapWithKeys(function ($item) {
            return [$item->option_name => $item->option_value];
        })->toArray();

        $pages_id_slugs = Page::whereIn('id', array_values($static_option))->get()->mapWithKeys(function ($item) {
            return [$item->id => $item->slug];
        })->toArray();

        if (in_array($slug, $pages_id_slugs) && $slug === $pages_id_slugs[$static_option['home_page']]) {
            return redirect()->route('homepage');
        } elseif (in_array($slug, $pages_id_slugs) && $slug === $pages_id_slugs[$static_option['blog_page']]) {
            $all_blogs = Blog::where('status', 'publish')->orderBy('id', 'desc')->paginate(6);
            return view('frontend.pages.blog.blog-static', [
                'all_blogs' => $all_blogs,
                'page_post' => $page_post,
            ]);
        } elseif (in_array($slug, $pages_id_slugs) && $slug === $pages_id_slugs[$static_option['service_list_page']]) {
            $all_services = Service::with('reviews')->where(['status' => 1, 'is_service_on' => 1])->orderBy('id', 'desc')->paginate(6);
            return view('frontend.pages.services.service-static', [
                'all_services' => $all_services,
                'page_post'    => $page_post,
            ]);
        } elseif (!is_null($user_details)) {
            // dd('sdfsad');
            return $this->_user_profile($user_details);
        }

        $page_type = 'page';
        if (!is_null($page_post)) {
            return view('frontend.pages.dynamic.dynamic-single', compact(['page_post', 'page_type']));
        }

        abort(404);
    }

    public function adNew(Request $request)
    {
        $mergeData = [
            'user_id' => auth()->id(),
            'ppq' => 0.05,
        ];

        if($request->optimize_for == 'impression'){
            $mergeData['ppq'] = 0.03;
        }

        $request->merge($mergeData);
        $request->validate([
            'user_id'      => ['required'],
            'company'      => ['required', 'string', 'max:255'],
            'title'        => ['required', 'string', 'max:255'],
            'url'          => ['required', 'string', 'max:255'],
            'description'  => ['required', 'string', 'max:255'],
            'cover_image'  => ['required', 'image', 'mimes:jpeg,png,jpg', 'dimensions:min_width=400,min_height=300'],
            'optimize_for' => ['required', Rule::in(['click', 'impression'])],
            'quantity'     => ['required', 'integer', Rule::in([1000, 2000, 3000, 4000, 5000])],
            'ppq'          => ['required', 'decimal:2', Rule::in([0.05, 0.03])],
        ]);

        $attachment      = $request->file('cover_image');
        $attachment_name = time() . '-' . uniqid() . '.' . $attachment->getClientOriginalExtension();
        $attachment->move('assets/uploads/ads/', $attachment_name);
        $form                = $request->all();
        $form['cover_image'] = $attachment_name;
        Ad::create($form);
        return redirect('/')->with('success', 'Advertisement added successfully!');
    }

}
