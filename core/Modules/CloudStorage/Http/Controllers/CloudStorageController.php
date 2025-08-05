<?php

namespace Modules\CloudStorage\Http\Controllers;

use App\Jobs\SyncLocalFileWithCloud;
use App\Models\IdentityVerification;
use App\Models\JobPost;
use App\Models\JobProposal;
use App\Models\MediaUpload;
use App\Models\Portfolio;
use App\Models\Project;
use App\Models\User;
use Illuminate\Http\File;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use Modules\SupportTicket\Entities\ChatMessage;
use Stancl\Tenancy\Facades\Tenancy;

class CloudStorageController extends Controller
{
    public function storage_settings()
    {
        return view('cloudstorage::admin.storage-settings');
    }

    public function update_storage(Request $request)
    {
        $rules = [
            'storage_driver' => 'required|string|max:191|'.Rule::in(['CustomUploader', 'wasabi', 'cloudFlareR2', 's3']),

            'wasabi_access_key_id' => 'required_if:storage_driver,==,wasabi',
            'wasabi_secret_access_key' => 'required_if:storage_driver,==,wasabi',
            'wasabi_default_region' => 'required_if:storage_driver,==,wasabi',
            'wasabi_bucket' => 'required_if:storage_driver,==,wasabi',
            'wasabi_endpoint' => 'required_if:storage_driver,==,wasabi',

            'cloudflare_r2_access_key_id' => 'required_if:storage_driver,==,cloudFlareR2',
            'cloudflare_r2_secret_access_key' => 'required_if:storage_driver,==,cloudFlareR2',
            'cloudflare_r2_bucket' => 'required_if:storage_driver,==,cloudFlareR2',
            'cloudflare_r2_url' => 'required_if:storage_driver,==,cloudFlareR2',
            'cloudflare_r2_endpoint' => 'required_if:storage_driver,==,cloudFlareR2',
            'cloudflare_r2_use_path_style_endpoint' => 'required_if:storage_driver,==,cloudFlareR2',

            'aws_access_key_id' => 'required_if:storage_driver,==,s3',
            'aws_secret_access_key' => 'required_if:storage_driver,==,s3',
            'aws_default_region' => 'required_if:storage_driver,==,s3',
            'aws_bucket' => 'required_if:storage_driver,==,s3',
            'aws_url' => 'required_if:storage_driver,==,s3',
            'aws_endpoint' => 'required_if:storage_driver,==,s3',
            'aws_use_path_style_endpoint' => 'required_if:storage_driver,==,s3',
        ];


        $request->validate($rules);

        foreach ($rules as $index => $value)
        {
            update_static_option($index, $request->$index);
        }

        return back()->with(toastr_success(__('Storage Settings Updated')));
    }

    //front cdn settings
    public function front_settings(Request $request)
    {
        if($request->isMethod('post')){
            $request->validate(['front_cdn_enable_disable' => 'required']);
            $all_fields = ['front_cdn_enable_disable'];

            foreach ($all_fields as $field) {
                update_static_option($field, $request->$field);
            }
            toastr_success(__('Front CDN Enable Disable Settings Updated Successfully.'));
            return back();
        }
        return view('cloudstorage::admin.front-settings');
    }

    public function upload_local_file_to_cloud(Request $request)
    {
        if ( $request->_action === 'sync_file')
        {
            MediaUpload::where(["is_synced"=> 0])->chunk(50,function ($items){
                foreach ($items as $item)
                {
                    SyncLocalFileWithCloud::dispatch($item,'media-uploader/');
                }
            });

            Project::where(["is_synced"=> 0])->chunk(50,function ($items){
                foreach ($items as $item)
                {
                    SyncLocalFileWithCloud::dispatch($item,'project/');
                }
            });

            jobPost::where(["is_synced"=> 0])->chunk(50,function ($items){
                foreach ($items as $item)
                {
                    SyncLocalFileWithCloud::dispatch($item,'jobs/');
                }
            });

            JobProposal::where(["is_synced"=> 0])->chunk(50,function ($items){
                foreach ($items as $item)
                {
                    SyncLocalFileWithCloud::dispatch($item,'jobs/proposal/');
                }
            });

            Portfolio::where(["is_synced"=> 0])->chunk(50,function ($items){
                foreach ($items as $item)
                {
                    SyncLocalFileWithCloud::dispatch($item,'portfolio/');
                }
            });

            User::where(["is_synced"=> 0])->chunk(50,function ($items){
                foreach ($items as $item)
                {
                    SyncLocalFileWithCloud::dispatch($item,'profile/');
                }
            });

            ChatMessage::where(["is_synced"=> 0])->chunk(50,function ($items){
                foreach ($items as $item)
                {
                    SyncLocalFileWithCloud::dispatch($item,'ticket/chat-messages/');
                }
            });

            IdentityVerification::where(["is_synced"=> 0])->chunk(50,function ($items){
                foreach ($items as $item)
                {
                    SyncLocalFileWithCloud::dispatch($item,'verification/');
                }
            });

            return back()->with(toastr_success(__('File Sync Started In The Background')));
        }
    }
}