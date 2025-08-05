<?php

namespace Modules\HourlyJob\App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderWorkHistory;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

class ClientHourlyOrderController extends Controller
{
    //order work history
    public function work_history($id)
    {
        $order_details = Order::with('job','hourly_work_history')->where('id',$id)
            ->where('is_fixed_hourly','hourly')
            ->where('user_id',Auth::guard('web')->user()->id)
            ->first();
        if(!empty($order_details)){
            $all_histories = OrderWorkHistory::where('order_id',$order_details->id)->paginate(5);
            $order_total_seconds = OrderWorkHistory::where('order_id',$order_details->id)->where('client_id',Auth::guard('web')->user()->id)->sum('seconds');
            $total_work_time = $order_total_seconds / 3600;
            $order_total_amount_calculate = ($order_total_seconds / 3600) * $order_details?->job->hourly_rate;
            return view('hourlyjob::client.work-history',compact(['order_details','all_histories','total_work_time','order_total_amount_calculate']));
        }
        return back();
    }

    public function update_history($id,Request $request){
        OrderWorkHistory::with('order')->where('id',$id)->update(['hours_worked' =>$request->manual_time]);
        return back()->with(toastr_success('Work History Updated Successfully'));
    }
}
