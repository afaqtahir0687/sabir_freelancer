<?php

use Illuminate\Support\Facades\Route;

Route::group(['as'=>'admin.','prefix'=>'admin/cloud-storage','middleware' => ['auth:admin','setlang']],function(){
        Route::controller(Modules\CloudStorage\Http\Controllers\CloudStorageController::class)->group(function () {
            Route::get('storage-settings','storage_settings')->name('cloud.storage.settings');
            Route::post('update_storage','update_storage')->name('cloud.storage.settings.update');
            Route::match(['get','post'],'front-settings','front_settings')->name('cloud.storage.front.settings');
            Route::post('upload-local-file-to-cloud','upload_local_file_to_cloud')->name('upload.local.file.cloud');
        });
    });