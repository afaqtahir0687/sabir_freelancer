<?php

namespace Modules\HourlyJob\App\Http\Controllers\Freelancer;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderScreenshot;
use App\Models\OrderWorkHistory;
use DateInterval;
use DateTime;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

class FreelancerHourlyOrderController extends Controller
{
    //time tracker
    public function time_tracker(Request $request,$id)
    {
        $order = Order::with('job')->where('id',$id)
            ->where('is_fixed_hourly','hourly')
            ->where('freelancer_id',Auth::guard('web')->user()->id)
            ->first();

        if($request->isMethod('post')){
            $request->validate([
                'work_hour'=>['required', 'regex:/^(?:[01]\d|2[0-3]):[0-5]\d:[0-5]\d$/']
            ]);
            $start_time = $request->start_time;
            $dt = new DateTime($start_time);
            $formatted_start_time = $dt->format('Y-m-d H:i:s');

            $work_hour = $request->work_hour;
            $end_time = $this->addTimeToTimestamp($start_time, $work_hour);

            OrderWorkHistory::create([
                'order_id'=>$id,
                'client_id'=>$order->user_id,
                'freelancer_id'=>$order->freelancer_id,
                'job_id'=>$order->identity,
                'start_date'=>$formatted_start_time,
                'end_date'=>$end_time,
                'hours_worked'=>$work_hour,
                'seconds'=>strtotime("1970-01-01 $work_hour UTC"),
                'notes'=>$request->notes,

            ]);
            return back()->with(toastr_success(__('Working Time Successfully Submitted')));
        }
        return !empty($order) ? view('frontend.user.freelancer.order.time-tracker.time-tracker',compact('order')) : back();
    }

    //order work history
    public function work_history($id)
    {
        $order_details = Order::with('job','hourly_work_history')->where('id',$id)
            ->where('is_fixed_hourly','hourly')
            ->where('freelancer_id',Auth::guard('web')->user()->id)
            ->first();
        if(!empty($order_details)){
            $all_histories = OrderWorkHistory::where('order_id',$order_details->id)->paginate(5);
            $order_total_seconds = OrderWorkHistory::where('order_id',$order_details->id)->where('freelancer_id',Auth::guard('web')->user()->id)->sum('seconds');
            $total_work_time = $order_total_seconds / 3600;
            $order_total_amount_calculate = ($order_total_seconds / 3600) * $order_details?->job->hourly_rate;
            return view('hourlyjob::freelancer.work-history',compact(['order_details','all_histories','total_work_time','order_total_amount_calculate']));
        }
        return back();
    }

    public function upload_screenshot(Request $request)
    {

       $encoded_image = $request->image; // Get the base64 encoded image
       $order_id = $request->order_id_for_screenshot; // Get the order id


        // Remove the Base64 prefix (data URL scheme)
        $imageData = str_replace('data:image/png;base64,', '', $encoded_image);
        $imageData = str_replace(' ', '+', $imageData); // Ensure '+' in the Base64 string is correct

        // Decode the Base64 string to binary data
        $imageBinary = base64_decode($imageData);

        // Check if decoding was successful
        if ($imageBinary === false) {
            return response()->json(['error' => 'Invalid image data'], 400);
        }

        // Generate a unique filename for the image
        $imageName = 'screenshot_' . $order_id . '_' . time() . '.png';
        $filePath = public_path('../../assets/uploads/screenshot/' . $imageName);

        // Save the binary data to the file
        file_put_contents($filePath, $imageBinary);

        // Save the screenshot
        OrderScreenshot::create([
            'order_id' => 246,
            'image' => $imageName,
        ]);

        return response()->json([
            'status' => 'success',
            'image_url' => asset('assets/uploads/screenshot/' . $imageName),
        ]);

    }

    function addTimeToTimestamp($start_time, $work_hour) {
        $date = new DateTime($start_time);
        list($hours, $minutes, $seconds) = explode(':', $work_hour);
        $interval = new DateInterval("PT{$hours}H{$minutes}M{$seconds}S");
        $date->add($interval);
        return $date->format('Y-m-d H:i:s');
    }
}
