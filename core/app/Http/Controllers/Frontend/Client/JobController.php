<?php

namespace App\Http\Controllers\Frontend\Client;

use App\Helper\LogActivity;
use App\Http\Controllers\Controller;
use App\Mail\BasicMail;
use App\Models\AdminNotification;
use App\Models\JobHistory;
use App\Models\JobPost;
use App\Models\JobProposal;
use App\Models\Project;
use App\Traits\ProfileCompleteCheckableTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;
use Modules\Service\Entities\SubCategory;
use Modules\Wallet\Entities\Wallet;
use App\Models\Skill;
class JobController extends Controller
{
    use ProfileCompleteCheckableTrait;

    //all jobs
    public function all_job()
    {
        $user_id = Auth::guard('web')->user()->id;
        $all_jobs = JobPost::select(['id','title','description','type','level','status','on_off','current_status','created_at'])
            ->withCount('job_proposals')
            ->latest()->where('user_id',$user_id)
            ->paginate(10);

        $active_jobs = JobPost::where('current_status',1)->where('user_id',$user_id)->count();
        $complete_jobs = JobPost::where('current_status',2)->where('user_id',$user_id)->count();
        $closed_jobs = JobPost::where('on_off',0)->where('user_id',$user_id)->count();

        $top_projects = Project::select('id', 'title','slug','user_id','basic_regular_charge','basic_discount_charge','basic_delivery','description','image')
            ->where('project_on_off','1')
            ->whereHas('project_creator')
            ->where('status','1')
            ->latest()
            ->take(3)
            ->get();

        return view('frontend.user.client.job.my-job.all-jobs',compact(['all_jobs','active_jobs','complete_jobs','closed_jobs','top_projects']));
    }

    //job filter
    public function job_filter(Request $request)
    {
        $user_id = Auth::guard('web')->user()->id;
        $query = $all_jobs = JobPost::select(['id','title','description','type','level','status','on_off','current_status','created_at'])
            ->latest()
            ->where('user_id',$user_id);

        if($request->value == 'all'){
            $all_jobs = $query->paginate(10);
        }
        if($request->value == 'active'){
            $all_jobs = $query->where('current_status',1)->paginate(10);
        }
        if($request->value == 'complete'){
            $all_jobs = $query->where('current_status',2)->paginate(10);
        }
        if($request->value == 'close'){
            $all_jobs = $query->where('on_off',0)->paginate(10);
        }

        return view('frontend.user.client.job.my-job.search-result',compact('all_jobs'))->render();
    }

    //job create
    public function job_create(Request $request)
    {
        if($request->isMethod('post'))
        {
            if(!$this->checkProfileIsComplete(auth('web')->user())){
                toastr_warning(__('Complete your profile'));
                return back();
            }

            $request->merge([
                'meta_title' => Str::slug($request->title),
                'meta_description' => Str::limit($request->description),
            ]);

             $request->validate([
                'title'=>'required|min:5|max:100',
                'slug'=>'required|max:191|unique:job_posts,slug',
                'category'=>'required',
                'duration'=>'required|max:191',
                'level'=>'required|max:191',
                'description'=>'required|min:10',
                'type'=>'required|max:191',
                 'skill'=>'required|array',
                 'meta_title'=>'nullable|max:100',
                 'meta_description'=>'nullable|max:500',
            ]);

             if($request->type == 'fixed'){
                 $request->validate([
                     'budget'=>'required|numeric|gt:0',
                 ]);
             }else{
                 $request->validate([
                     'hourly_rate'=>'required|numeric|gt:0',
                     'estimated_hours'=>'required|numeric|gt:0',
                 ]);
             }

            $attachmentName = '';
            $upload_folder = 'jobs';
            $storage_driver = Storage::getDefaultDriver();

            if ($attachment = $request->file('attachment')) {
                $attachmentName = time().'-'.uniqid().'.'.$attachment->getClientOriginalExtension();
                $upload_folder = 'jobs';

                if (cloudStorageExist() && in_array(Storage::getDefaultDriver(), ['s3', 'cloudFlareR2', 'wasabi'])) {
                    $stream = fopen($attachment->getPathname(), 'r+');
                    Storage::disk(Storage::getDefaultDriver())->put($upload_folder.'/'.$attachmentName, $stream);
                    fclose($stream);
                } else {
                    $attachment->move('assets/uploads/jobs', $attachmentName);
                }
            }


            $user_id  = Auth::guard('web')->user()->id;
            $slug = !empty($request->slug) ? $request->slug : $request->title;

            $job = JobPost::create([
                'user_id'=>$user_id,
                'title'=>$request->title,
                'slug' => Str::slug(purify_html($slug),'-',null),
                'category'=>$request->category,
                'duration'=>$request->duration,
                'level'=>$request->level,
                'description'=>$request->description,
                'type'=>$request->type,
                'hourly_rate'=>$request->hourly_rate,
                'estimated_hours'=>$request->estimated_hours,
                'budget'=>$request->budget ?? 0,
                'attachment'=>$attachmentName,
                'status'=> get_static_option('job_auto_approval')  == 'no' ? 0 : 1,
                'job_approve_request'=>  1,
                'meta_title'=>$request->meta_title,
                'meta_description'=>$request->meta_description,
                'load_from' => in_array($storage_driver,['CustomUploader']) ? 0 : 1, //added for cloud storage 0=local 1=cloud
            ]);

            $job->job_sub_categories()->attach($request->subcategory);
            $job->job_skills()->attach($request->skill);

            //security manage
            if(moduleExists('SecurityManage')){
                LogActivity::addToLog('Job create','Client');
            }

            // try {
            //     $message = get_static_option('job_create_email_message') ?? __('New job has been published.');
            //     $message = str_replace(["@job_id"],[$job->id], $message);
            //     Mail::to(get_static_option('site_global_email'))->send(new BasicMail([
            //         'subject' => get_static_option('job_create_email_subject') ?? __('New Job'),
            //         'message' => $message
            //     ]));
            // }catch (\Exception $e) {}
           
         
           try {
                $job_link = url('/client/job/details/' . $job->id);
                $user = $job->user;

                $posterName = e($user->first_name . ' ' . $user->last_name);
                $jobTitle = e($job->title);

                $message = '
                    <div style="max-width: 600px; margin: auto; background-color: #ffffff; border: 1px solid #e0e0e0; border-radius: 10px; padding: 0; font-family: Arial, sans-serif; color: #333;">
                        <div style="padding: 30px;">
                            <div style="border-bottom: 1px solid #ddd; padding-bottom: 20px; margin-bottom: 20px;">
                                <h2 style="color: #309400; margin: 0;">🚀 New Job Alert from RightFreelancer</h2>
                            </div>
                            <p style="font-size: 16px; line-height: 1.6;">
                                Hi <strong>' . $posterName . '</strong>,
                            </p>
                            <p style="font-size: 16px; line-height: 1.6;">
                                You posted the job 
                                <a href="' . $job_link . '" style="color: #309400; text-decoration: underline; font-weight: bold;">' . $jobTitle . '</a> 
                                on <strong>RightFreelancer</strong>.
                            </p>
                            <p style="font-size: 15px; line-height: 1.6; margin-top: 16px;">
                                Thank you for choosing <strong>RightFreelancer</strong>. We’re excited to help you find the perfect match for your project!
                            </p>
                            <p style="margin-top: 12px; font-size: 15px; line-height: 1.6;">
                                Best regards,<br>
                                <strong>The RightFreelancer Team</strong>
                            </p>
                        </div>
                    </div>
                ';

                // Send email to admin
                Mail::to(get_static_option('site_global_email'))->send(new BasicMail([
                    'subject' => get_static_option('job_create_email_subject') ?? __('New Job Posted'),
                    'message' => $message,
                ]));

                // ✅ Fetch skills names
            $skills = $job->job_skills->pluck('skill')->toArray();
            $skillListHtml = '';
            if (!empty($skills)) {
                $skillListHtml = '<ul style="margin: 10px 0; padding-left: 20px;">';
                foreach ($skills as $skill) {
                    $skillListHtml .= '<li style="font-size: 14px; line-height: 1.5;">' . e($skill) . '</li>';
                }
                $skillListHtml .= '</ul>';
            }

            $userMessage = '
                <div style="max-width: 600px; margin: auto; background-color: #ffffff; border: 1px solid #e0e0e0; border-radius: 10px; padding: 0; font-family: Arial, sans-serif; color: #333;">
                    <div style="padding: 30px;">
                        <div style="border-bottom: 1px solid #ddd; padding-bottom: 20px; margin-bottom: 20px;">
                            <h2 style="color: #309400; margin: 0;">🚀 New Job Alert from RightFreelancer</h2>
                        </div>
                        <p style="font-size: 16px; line-height: 1.6;">
                            Hi <strong>' . $posterName . '</strong>,
                        </p>
                        <p style="font-size: 16px; line-height: 1.6;">
                            You posted the job 
                            <a href="' . $job_link . '" style="color: #309400; text-decoration: underline; font-weight: bold;">' . $jobTitle . '</a> 
                            on <strong>RightFreelancer</strong>.
                        </p>
                        <p style="font-size: 16px; line-height: 1.6;">
                            <strong>Skills required for this job:</strong>
                            ' . $skillListHtml . '
                        </p>
                        <p style="margin-top: 12px; font-size: 15px; line-height: 1.6;">
                            Thank you for choosing <strong>RightFreelancer</strong>. We’ll help you connect with the right freelancers.
                        </p>
                        <p style="margin-top: 12px; font-size: 15px; line-height: 1.6;">
                            Best regards,<br>
                            <strong>The RightFreelancer Team</strong>
                        </p>
                    </div>
                </div>
            ';

            Mail::to($user->email)->send(new BasicMail([
                'subject' => __('Your Job Post Confirmation'),
                'message' => $userMessage,
            ]));


            } catch (\Exception $e) {
                // Log or handle error if needed
            }
                        
            //create project notification to admin
            AdminNotification::create([
                'identity'=>$job->id,
                'user_id'=>$user_id,
                'type'=>'Job',
                'message'=>__('New job has been published.'),
            ]);

            toastr_success(__('Job successfully created'));
            return redirect()->route('client.job.all');
        }
        return view('frontend.user.client.job.create.create-job');
    }

    //job edit 
    public function job_edit(Request $request,$id)
    {
        $user_id  = Auth::guard('web')->user()->id;
        $job_details = JobPost::where('id',$id)->where('user_id',$user_id)->first();
        $get_sub_categories_from_job_category = SubCategory::where('category_id',$job_details->category)->get() ?? '';
        $slug = !empty($request->slug) ? $request->slug : $request->title;
        $delete_old_attachment =  'assets/uploads/jobs/'.$job_details->attachment;

        if($request->isMethod('post'))
        {
            $request->validate([
                'title'=>'required|min:5|max:100',
                'slug'=>'required|max:191|unique:job_posts,slug,'.$id,
                'category'=>'required',
                'duration'=>'required|max:191',
                'level'=>'required|max:191',
                'description'=>'required|min:10',
                'type'=>'required|max:191',
                'skill'=>'required|array',
                'meta_title'=>'nullable|max:255',
                'meta_description'=>'nullable|max:500',
            ]);

            if($request->type == 'fixed'){
                $request->validate([
                    'budget'=>'required|numeric|gt:0',
                ]);
            }else{
                $request->validate([
                    'hourly_rate'=>'required|numeric|gt:0',
                    'estimated_hours'=>'required|numeric|gt:0',
                ]);
            }

            $attachmentName = '';
            $upload_folder = 'jobs';
            $extensions = array('png','jpg','jpeg','bmp','gif','tiff','svg');

            if (cloudStorageExist() && in_array(Storage::getDefaultDriver(), ['s3', 'cloudFlareR2', 'wasabi'])) {
                if ($attachment = $request->file('attachment')) {
                    $request->validate([
                        'attachment'=>'required|mimes:png,jpg,jpeg,bmp,gif,tiff,svg,csv,txt,xlx,xls,pdf,docx|max:5120',
                    ]);

                    $currentImagePath = $job_details->attachment;
                    if ($currentImagePath) {
                        delete_frontend_cloud_image_if_module_exists('jobs/'.$currentImagePath);
                    }

                    $attachmentName = time().'-'.uniqid().'.'.$attachment->getClientOriginalExtension();
                    if(in_array($attachment->getClientOriginalExtension(), $extensions)){
                        add_frontend_cloud_image_if_module_exists($upload_folder, $attachment, $attachmentName,'public');
                    }else{
                        add_frontend_cloud_image_if_module_exists($upload_folder, $attachment, $attachmentName,'public');
                    }
                }else{
                    $attachmentName = $job_details->attachment;
                }
            }else{
                if ($attachment = $request->file('attachment')) {
                    $request->validate([
                        'attachment'=>'required|mimes:png,jpg,jpeg,bmp,gif,tiff,svg,csv,txt,xlx,xls,pdf,docx|max:5120',
                    ]);
                    if(file_exists($delete_old_attachment)){
                        File::delete($delete_old_attachment);
                    }
                    $attachmentName = time().'-'.uniqid().'.'.$attachment->getClientOriginalExtension();
                    if(in_array($attachment->getClientOriginalExtension(), $extensions)){
                        $resize_full_image = Image::make($request->attachment)
                            ->resize(800, 500);
                        $resize_full_image->save('assets/uploads/jobs' .'/'. $attachmentName);
                    }else{
                        $attachment->move('assets/uploads/jobs', $attachmentName);
                    }
                }else{
                    $attachmentName = $job_details->attachment;
                }
            }

            JobPost::where('id',$id)->update([
                'user_id'=>$user_id,
                'title'=>$request->title,
                'slug' => Str::slug(purify_html($slug),'-',null),
                'category'=>$request->category,
                'duration'=>$request->duration,
                'level'=>$request->level,
                'description'=>$request->description,
                'type'=>$request->type,
                'hourly_rate'=>$request->hourly_rate,
                'estimated_hours'=>$request->estimated_hours,
                'budget'=>$request->budget,
                'attachment'=>$attachmentName,
                'meta_title'=>$request->meta_title,
                'meta_description'=>$request->meta_description,
            ]);

            $job = JobPost::find($id);
            $job->job_sub_categories()->sync($request->subcategory);
            $job->job_skills()->sync($request->skill);
            $job_id_from_job_history_table = JobHistory::where('job_id', $id)->first();

            if(empty($job_id_from_job_history_table)){
                JobHistory::Create([
                    'job_id'=>$job->id,
                    'user_id'=>$job->user_id,
                    'reject_count'=>0,
                    'edit_count'=>1,
                ]);
            }else{
                JobHistory::where('job_id',$id)->update([
                    'reject_count'=>$job_id_from_job_history_table->edit_count + 1
                ]);
            }

            //security manage
            if(moduleExists('SecurityManage')){
                LogActivity::addToLog('Job edit','Client');
            }

          try {
                $job_link = url('/client/job/details/' . $job->id);
                $user = $job->user;

                $posterName = e($user->first_name . ' ' . $user->last_name);
                $jobTitle = e($job->title);

                // Send email to admin
                $adminMessage = '
                    <div style="max-width: 600px; margin: auto; background-color: #ffffff; border: 1px solid #e0e0e0; border-radius: 10px; padding: 0; font-family: Arial, sans-serif; color: #333;">
                        <div style="padding: 30px;">
                            <div style="border-bottom: 1px solid #ddd; padding-bottom: 20px; margin-bottom: 20px;">
                                <h2 style="color: #309400; margin: 0;">✏️ Job Updated on RightFreelancer</h2>
                            </div>
                            <p style="font-size: 16px; line-height: 1.6;">
                                The job <a href="' . $job_link . '" style="color: #309400; text-decoration: underline; font-weight: bold;">' . $jobTitle . '</a> was recently updated by <strong>' . $posterName . '</strong>.
                            </p>
                            <p style="margin-top: 12px; font-size: 15px; line-height: 1.6;">
                                Best regards,<br>
                                <strong>RightFreelancer System</strong>
                            </p>
                        </div>
                    </div>
                ';

                Mail::to(get_static_option('site_global_email'))->send(new BasicMail([
                    'subject' => __('Job Update Notification'),
                    'message' => $adminMessage,
                ]));

                // Send email to user
                $skills = $job->job_skills->pluck('skill')->toArray();
                $skillListHtml = '';
                if (!empty($skills)) {
                    $skillListHtml = '<ul style="margin: 10px 0; padding-left: 20px;">';
                    foreach ($skills as $skill) {
                        $skillListHtml .= '<li style="font-size: 14px; line-height: 1.5;">' . e($skill) . '</li>';
                    }
                    $skillListHtml .= '</ul>';
                }

                $userMessage = '
                    <div style="max-width: 600px; margin: auto; background-color: #ffffff; border: 1px solid #e0e0e0; border-radius: 10px; padding: 0; font-family: Arial, sans-serif; color: #333;">
                        <div style="padding: 30px;">
                            <div style="border-bottom: 1px solid #ddd; padding-bottom: 20px; margin-bottom: 20px;">
                                <h2 style="color: #309400; margin: 0;">✏️ Your Job Has Been Updated</h2>
                            </div>
                            <p style="font-size: 16px; line-height: 1.6;">
                                Hi <strong>' . $posterName . '</strong>,
                            </p>
                            <p style="font-size: 16px; line-height: 1.6;">
                                You have successfully updated the job 
                                <a href="' . $job_link . '" style="color: #309400; text-decoration: underline; font-weight: bold;">' . $jobTitle . '</a> 
                                on <strong>RightFreelancer</strong>.
                            </p>
                            <p style="font-size: 16px; line-height: 1.6;">
                                <strong>Updated skills required:</strong>
                                ' . $skillListHtml . '
                            </p>
                            <p style="margin-top: 12px; font-size: 15px; line-height: 1.6;">
                                Thank you for using <strong>RightFreelancer</strong>. We’re here to help you find the perfect match!
                            </p>
                            <p style="margin-top: 12px; font-size: 15px; line-height: 1.6;">
                                Best regards,<br>
                                <strong>The RightFreelancer Team</strong>
                            </p>
                        </div>
                    </div>
                ';

                Mail::to($user->email)->send(new BasicMail([
                    'subject' => __('Job Updated Successfully'),
                    'message' => $userMessage,
                ]));

            } catch (\Exception $e) {
                // Optional: log error
                \Log::error('Job update email failed: ' . $e->getMessage());
            }


            //edit job notification to admin
            AdminNotification::create([
                'identity'=>$job->id,
                'user_id'=>$user_id,
                'type'=>'Edit Job',
                'message'=>__('A Job has been edited'),
            ]);

            toastr_success(__('Job successfully Updated'));
            return redirect()->route('client.job.all');
        }
        return view('frontend.user.client.job.edit.edit-job',compact('job_details','get_sub_categories_from_job_category'));
    }

    // pagination
    function pagination(Request $request)
    {
        if($request->ajax()){
            $user_id = Auth::guard('web')->user()->id;
            $query = $all_jobs = JobPost::select(['id','title','description','type','level','status','on_off','current_status','created_at'])
                ->latest()
                ->where('user_id',$user_id);

            if($request->value == 'all'){
                $all_jobs = $query->paginate(10);
            }
            if($request->value == 'active'){
                $all_jobs = $query->where('current_status',1)->paginate(10);
            }
            if($request->value == 'complete'){
                $all_jobs = $query->where('current_status',2)->paginate(10);
            }
            if($request->value == 'close'){
                $all_jobs = $query->where('on_off',0)->paginate(10);
            }
            return view('frontend.user.client.job.my-job.search-result',compact('all_jobs'))->render();
        }
    }

    //job details
    public function job_details($id)
    {
        $job_details = JobPost::with(['job_creator','job_skills','job_proposals'])
            ->where('id',$id)
            ->where('user_id',Auth::guard('web')->user()->id)
            ->first();

        $hired_freelancer_count = JobProposal::where('job_id',$id)->where('is_hired',1)->count();
        $short_listed_freelancer_count = JobProposal::where('job_id',$id)->where('is_hired',0)->where('is_rejected',0)->where('is_short_listed',1)->count();
        $interviewed_freelancer_count = JobProposal::where('job_id',$id)->where('is_rejected',0)->where('is_interview_take',1)->count();

        JobPost::where('id',$id)->update(['last_seen'=>date('Y-m-d H:i:s')]);
        return !empty($job_details) ? view('frontend.user.client.job.job-details.job-details',compact(['job_details','hired_freelancer_count','short_listed_freelancer_count','interviewed_freelancer_count'])) : back();
    }

    //proposal details
    public function proposal_details($id)
    {
        $proposal_details = JobProposal::where('id',$id)
            ->where('client_id',Auth::guard('web')->user()->id)
            ->first();
        JobProposal::where('id',$id)->update(['is_view'=>1]);
        return !empty($proposal_details) ? view('frontend.user.client.job.job-details.proposal-details',compact('proposal_details')) : back();
    }

    //add to shortlist
    public function add_remove_shortlist(Request $request)
    {
        $proposal = JobProposal::where('id',$request->proposal_id)->first();
        $is_short_listed = $proposal->is_short_listed == 0 ? 1 : 0;
        JobProposal::where('id',$request->proposal_id)->update(['is_short_listed'=>$is_short_listed]);
        return response()->json(['status'=>$is_short_listed]);
    }

    //filter job proposal
    public function job_proposal_filter(Request $request)
    {
        $job_proposals = JobProposal::with('job:id,type,hourly_rate,estimated_hours')->where('job_id',$request->job_id)->latest();

        if($request->filter_val == 'all'){
            $job_proposals = $job_proposals->get();
        }
        if($request->filter_val == 'hired'){
            $job_proposals = $job_proposals->where('is_hired',1)->get();
        }
        if($request->filter_val == 'shortlisted'){
            $job_proposals = $job_proposals->where('is_hired',0)->where('is_rejected',0)->where('is_short_listed',1)->get();
        }
        if($request->filter_val == 'interviewing'){
            $job_proposals = $job_proposals->where('is_hired',0)->where('is_short_listed',0)->where('is_rejected',0)->where('is_interview_take',1)->get();
        }
        return view('frontend.user.client.job.job-details.filter-proposals',compact('job_proposals'))->render();
    }

    //reject proposal
    public function reject_proposal(Request $request)
    {
        JobProposal::where('id',$request->proposal_id)->update(['is_rejected' => 1]);
        return response()->json(['status' => 1]);
    }

    //job open close
    public function open_close(Request $request)
    {
        $job = JobPost::where('id',$request->job_id)->first();
        $open_or_close = $job->on_off == 0 ? 1 : 0;
        JobPost::where('id',$request->job_id)->update(['on_off'=>$open_or_close]);
        return response()->json(['status'=>$open_or_close]);
    }

    public function rate_and_hours(Request $request)
    {
        $user_id = Auth::guard('web')->user()->id;
        $job = JobPost::where('id',$request->job_id)->where('user_id',$user_id)->first();
        if(!empty($job)){
          JobPost::where('id',$request->job_id)->update([
              'hourly_rate'=>$request->hourly_rate,
              'estimated_hours'=>$request->estimated_hour,
              ]);
            return back()->with(toastr_success(__('Hourly rate and hours updated successfully.')));
        }else{
            return back()->with(toastr_warning(__('Job not found!')));
        }
    }

}
