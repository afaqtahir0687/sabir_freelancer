<?php

use Illuminate\Support\Facades\Route;
use Modules\HourlyJob\App\Http\Controllers\Backend\HourlyJobController;
use Modules\HourlyJob\App\Http\Controllers\Client\ClientHourlyOrderController;
use Modules\HourlyJob\App\Http\Controllers\Freelancer\FreelancerHourlyOrderController;


//admin route
Route::group(['as'=>'admin.hourly.','prefix'=>'admin/hourly-jobs','middleware' => ['auth:admin','setlang']],function() {
        Route::controller(HourlyJobController::class)->group(function () {
            Route::get('all', 'hourly_jobs')->name('jobs.all');
            Route::get('search-job', 'search_job')->name('job.search');
            Route::get('paginate/data', 'pagination')->name('job.paginate.data');
            Route::match(['get','post'],'hour/settings', 'hour_settings')->name('job.hour.settings');
            Route::get('details/{id}', 'job_details')->name('job.details')->permission('job-details');
            Route::post('change-status/{id}', 'change_status')->name('job.status.change')->permission('job-status-change');
            Route::post('delete/{id}','delete_job')->name('job.delete')->permission('job-delete');
        });
});

//freelancer route
Route::group(['prefix'=>'freelancer/order','as'=>'freelancer.','middleware'=>['auth','userEmailVerify','Google2FA','globalVariable', 'maintains_mode','setlang']],function() {
    // orders
    Route::controller(FreelancerHourlyOrderController::class)->group(function () {
        Route::match(['get','post'],'time-tracker/{id}','time_tracker')->name('order.time.tracker');
        Route::get('work-history/{id}','work_history')->name('order.work.history');
        Route::post('upload-screenshot','upload_screenshot')->name('order.screenshot.upload');
    });
});

//client route
Route::group(['prefix'=>'client/order','as'=>'client.','middleware'=>['auth','userEmailVerify','Google2FA','globalVariable', 'maintains_mode','setlang']],function() {
    // orders
    Route::controller(ClientHourlyOrderController::class)->group(function () {
        Route::get('work-history/{id}','work_history')->name('order.work.history');
        Route::post('update-history/{id}','update_history')->name('order.work.history.update');
    });
});
