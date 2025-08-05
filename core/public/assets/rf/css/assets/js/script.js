// //Registration Process
(jQuery, window, document);//


function edit_profile(status){
		if(status == "edit"){
			$(".edit-profile").hide();
			$(".add-experience").show();
			$(".add-education").show();
			$(".add-certification").show();
			$(".done-edit").show();
			$(".add-pulication").show();
			$(".edit").show();
			$(".del").show();
			$("#edit_portfolio_btn").show();
		}else{
			$(".edit-profile").show();
			$(".add-experience").hide();
			$(".done-edit").hide();
			$(".add-education").hide();
			$(".add-certification").hide();
			$(".add-pulication").hide();
			$(".edit").hide();
			$(".del").hide();
			$(".experience").hide();
			$(".education").hide();
			$(".certification").hide();
			$(".publication").hide();
			$(".price_rate").hide();
			$("#edit_portfolio_btn").hide();
		}
 }//edit_profile



function add_experience(status){
	if(status == "show"){
		$(".experience").show();
		$(".experience-btn").hide();
		$("#company").val('');
		$("#title").val('');
		$("#id").val('');
		$("#summary").val('');
		$("#strat_year").val('');
	}else{
		$(".experience").hide();
		$(".experience-btn").show();
		$("#company").val('');
		$("#title").val('');
		$("#id").val('');
		$("#summary").val('');
		$("#strat_year").val('');
	}
}//add_experience

function add_education(status){
	if(status == "show"){
		$(".education").show();
		$(".education-btn").hide();
		$("#degree").val('');
		$("#university_college").val('');
		$("#edu_id").val('');

	}else{
		$(".education").hide();
		$(".education-btn").show();
		$("#degree").val('');
		$("#university_college").val('');
		$("#edu_id").val('');
	}
}//add_education

function add_certifications(status){
	if(status == "show"){
		$(".certification").show();
		$(".certification-btn").hide();
		$("#certificate_name").val('');
		$("#organization").val('');
		$("#describe_certification").val('');
		$("#certi_id").val('');


	}else{
		$(".certification").hide();
		$(".certification-btn").show();
		$("#certificate_name").val('');
		$("#organization").val('');
		$("#describe_certification").val('');
		$("#certi_id").val('');


	}
}//add_certifications


function add_publications(status){
	if(status == "show"){
		$(".publication").show();
		$(".publication-btn").hide();
		$("#publication_title").val('');
		$("#publishir").val('');
		$("#publishir_id").val('');
		$("#publis_summary").val('');

	}else{
		$(".publication").hide();
		$(".publication-btn").show();
		$("#publication_title").val('');
		$("#publishir").val('');
		$("#publishir_id").val('');
		$("#publis_summary").val('');

	}
}//add_certifications

function disable_checkbox(){

	if(document.getElementById('currently_working_in').checked) {
		 $('#end_year').prop('disabled', 'disabled');
		 $('#end_month').prop('disabled', 'disabled');
     	 $('#end_year').val('');
		 $('#end_month').val('');
		 $('#currently_working_in').val(1);

		} else {
		  $('#end_year').prop('disabled', false);
		  $('#end_month').prop('disabled', false);
		  $('#currently_working_in').val(0);
		}
 }//disable_checkbox


function del_experience(expe_id){

	$.ajax({
	type: 'POST',
	url: $('#base_url2').val()+"profile/delete_experience",
	data: ({
			 'id'   : expe_id
		   }),
	success: function(data){
		if(data=="yes"){
			$("#expe_descr_"+expe_id).remove();
			}else{
			$("#expe_descr_"+expe_id).remove();
			$(".experience-record").html('<p class="review-padding-3"><span id="no_exper">No Experience Added</span></p>');
			}

/*		$(".experience-record").html(data);
		$(".experience").hide();
		$(".experience-btn").show();
		$(".edit").show();
		$(".del").show();
*/		}
	});

}//del_experience

function save_experience(){


	var end_month = $("#end_month").val();
	var end_year  = $("#end_year").val()
	if(end_month !=null && end_month!=""){
		end_month = end_month;
	}else{
		end_month = "";
	}

	if(end_year !=null && end_year!=""){
		end_year = end_year;
	}else{
		end_year = "";
	}


(function($,W,D){

	var JQUERY4U           = {};
	var base_url2          = $("#base_url2").val();
	var currently_working  = $("#currently_working_in").val();
	var e = document.getElementById("start_yearval");
	var start_year = e.options[e.selectedIndex].value;
	if(currently_working !=1){
		var end        = document.getElementById("end_year");
		var end_year   = end.options[end.selectedIndex].value;
	}

    JQUERY4U.UTIL  =
    {
        setupFormValidation: function(){
            //form validation rules

            $("#experience-form").validate({
               rules: {
                   title:{
						required: true,
					   },
					company:{
                        required: true,
                    },
                },
                messages:{
                    title:{
					required : "Please Enter Title",
					},
                    company:{
						required: "Please Enter Company Name",
						},


                },
                submitHandler: function(form) {
					$("#experience_loader").show();
                    $.ajax({
        type: 'POST',
        url: $('#base_url2').val()+"profile/save_experience",
		beforeSend:function(){
						  $("#experience_loader").html('<img style="display:block; margin:auto;" src="'+base_url+'/assets/images/bx_loader.gif" />');
			 },
        data: ({
            'title'   : $("#title").val(),
            'company' : $("#company").val(),
			'start_month' : $("#start_month").val(),
			'start_year' : $("#start_year").val(),
			'end_month' : end_month,
			'end_year' : end_year,
			'summary' : $("#summary").val(),
			'currently_working_in' : $("#currently_working_in").val(),
			'id' : $("#id").val(),
//			'gender' : selected.val(),
        }),
        success: function(data){
			$("#experience_loader").hide();
			$(".experience-record").html(data);
			$(".experience").hide();
			$(".experience-btn").show();
			$(".edit").show();
			$(".del").show();

				}
    		});
           }
         });
        }
    }
    //when the dom has loaded setup form validation rules
    	$(D).ready(function($) {
        JQUERY4U.UTIL.setupFormValidation();
   		});

 	  })//Registration Process

	(jQuery, window, document);//
}//save_experience

function edit_experience(expe_id){

	$.ajax({
	type: 'POST',
	url: $('#base_url2').val()+"profile/edit_experience",
	data: ({
			 'id'   : expe_id
		   }),
	success: function(data){
		$(".experience-replace-from").html(data);
		}
	});

}//del_experience

function edit_experience_status(status){

	if(status == "show"){
		$(".experience").show();
		$(".experience-btn").hide();
	}

}//add_experience


function save_education(){

(function($,W,D){
    var JQUERY4U           = {};
	var base_url2          = $("#base_url2").val();
    JQUERY4U.UTIL  =
    {
        setupFormValidation: function(){
            //form validation rules

            $("#education-form").validate({
               rules: {
                   country_id:{
						required: true,
					   },
					university_college:{
                        required: true,
                    },
					degree:{
                        required: true,
                    },
					from_year:{
                        required: true,
                    },
					to_year:{
                        required: true,
                    },

                },
                messages:{
                    country_id:{
					required : "Please Choose Country",
					},
                    university_college:{
					required : "Please enter university/College",
					},
                    degree:{
					required : "Please enter Degree",
					},
                    from_year:{
					required : "Please enter start Year",
					},

                    to_year:{
						required: "Please enter email address!",
						},


                },
                submitHandler: function(form) {
					$("#education_loader").show();
                    $.ajax({
						type: 'POST',
						url: $('#base_url2').val()+"profile/save_education",
						beforeSend:function(){
						 $("#education_loader").html('<img style="display:block; margin:auto;" src="'+base_url+'/assets/images/bx_loader.gif" />');
							 },

						data: ({
							'country_id'         : $("#country_id").val(),
							'university_college' : $("#university_college").val(),
							'degree'             : $("#degree").val(),
							'from_year'          : $("#from_year").val(),
							'to_year'            : $("#to_year").val(),
							'edu_id'             : $("#edu_id").val(),
				//			'gender' : selected.val(),
						}),
        success: function(data){
			$("#education_loader").hide();
			$(".education-record").html(data);
			$(".education").hide();
			$(".education-btn").show();
			$(".edit").show();
			$(".del").show();

				}
    		});
           }
         });
        }
    }
    //when the dom has loaded setup form validation rules
    	$(D).ready(function($) {
        JQUERY4U.UTIL.setupFormValidation();
   		});

 	  })//Registration Process

	(jQuery, window, document);//
}//save_education

function del_education(edu_id){
	$.ajax({
	type: 'POST',
	url: $('#base_url2').val()+"profile/delete_education",
	data: ({
			 'id'   : edu_id
		   }),
	success: function(data){

			if(data =="yes"){
				$("#edu_descr_"+edu_id).remove();
				}else{
				$("#edu_descr_"+edu_id).remove();
				$(".education-record").html('<p class="review-padding-3">No Education Added</p>');
				}
/*
			$(".education-record").html(data);
			$(".education").hide();
			$(".education-btn").show();
			$(".edit").show();
			$(".del").show();
*/		}
	});
}


function edit_education(edu_id){

	$.ajax({
	type: 'POST',
	url: $('#base_url2').val()+"profile/edit_education",
	data: ({
			 'id'   : edu_id
		   }),
	success: function(data){
		$(".education-replace-from").html(data);
		}
	});

}//del_experience

function edit_education_status(status){

	if(status == "show"){
		$(".education").show();
		$(".education-btn").hide();
	}

}//add_experience


function save_certification(){

(function($,W,D){
    var JQUERY4U           = {};
	var base_url2          = $("#base_url2").val();
    JQUERY4U.UTIL  =
    {
        setupFormValidation: function(){
            //form validation rules
            $("#certification-form").validate({
               rules: {
                   certificate_name:{
						required: true,
					   },
					organization:{
                        required: true,
                    },
					describe_certification:{
                        required: true,
                    },
					awarded_year:{
                        required: true,
                    },

                },
                messages:{
                    certificate_name:{
					required : "Please Enter Certification",
					},
                    organization:{
					required : "Please enter organization Name",
					},
                    describe_certification:{
					required : "Please enter Description",
					},
                    awarded_year:{
					required : "Please enter awarded year",
					},

                },
                submitHandler: function(form) {
					$("#certification_loader").show();
                    $.ajax({
						type: 'POST',
						url: $('#base_url2').val()+"profile/save_certification",
						beforeSend:function(){
						 $("#certification_loader").html('<img style="display:block; margin:auto;" src="'+base_url+'/assets/images/bx_loader.gif" />');
							 },
			data: ({
				'certificate_name'       : $("#certificate_name").val(),
				'organization'           : $("#organization").val(),
				'describe_certification' : $("#describe_certification").val(),
				'awarded_year'           : $("#awarded_year").val(),
				'certi_id'               : $("#certi_id").val(),
	//			'gender' : selected.val(),
			}),
			success: function(data){
				$("#certification_loader").hide();
				$(".certification-record").html(data);
				$(".certification").hide();
				$(".certification-btn").show();
				$(".edit").show();
				$(".del").show();

				}
    		});
           }
         });
        }
    }
    //when the dom has loaded setup form validation rules
    	$(D).ready(function($) {
        JQUERY4U.UTIL.setupFormValidation();
   		});

 	  })//Registration Process

	(jQuery, window, document);//
}//save_education

function del_certification(certi_id){

	$.ajax({
	type: 'POST',
	url: $('#base_url2').val()+"profile/delete_certification",
	data: ({
			 'id'   : certi_id
		   }),
	success: function(data){

			if(data =="yes"){
				$("#certifi_descr_"+certi_id).remove();
				}else{
				 $("#certifi_descr_"+certi_id).remove();
				 $(".certification-record").html('<p class="review-padding-3">No Certfication Added</p>');
				}

/*			$(".certification-record").html(data);
			$(".certification").hide();
			$(".certification-btn").show();
			$(".edit").show();
			$(".del").show();
*/

		}
	});

}//del_experience


function edit_certification(edu_id){

	$.ajax({
	type: 'POST',
	url: $('#base_url2').val()+"profile/edit_certification",
	data: ({
			 'id'   : edu_id
		   }),
	success: function(data){
		$(".certification-replace-from").html(data);
		}
	});

}//del_experience

function edit_certification_status(status){

	if(status == "show"){
		$(".certification").show();
		$(".certification-btn").hide();
	}

}//add_experience


function save_publication(){

(function($,W,D){
    var JQUERY4U           = {};
	var base_url2          = $("#base_url2").val();
    JQUERY4U.UTIL  =
    {
        setupFormValidation: function(){
            //form validation rules
            $("#publication-form").validate({
               rules: {
                   publication_title:{
						required: true,
					   },
					publishir:{
                        required: true,
                    },
					publis_summary:{
                        required: true,
                    },
                },
                messages:{
                    publication_title:{
					required : "Please Enter Title",
					},
                    publishir:{
					required : "Please Enter Publishir",
					},
                    publis_summary:{
					required : "Please Enter Summary",
					},
                },
                submitHandler: function(form) {
					$("#publication_loader").show();
                    $.ajax({
						type: 'POST',
						url: $('#base_url2').val()+"profile/save_publication",
						beforeSend:function(){
						 $("#publication_loader").html('<img style="display:block; margin:auto;" src="'+base_url+'/assets/images/bx_loader.gif" />');
							 },

						data: ({
							'publication_title'       : $("#publication_title").val(),
							'publishir'               : $("#publishir").val(),
							'publis_summary'          : $("#publis_summary").val(),
							'publishir_id'            : $("#publishir_id").val(),
				//			'gender' : selected.val(),
						}),
        success: function(data){
			$("#publication_loader").hide();
			$(".publication-record").html(data);
			$(".publication").hide();
			$(".publication-btn").show();
			$(".edit").show();
			$(".del").show();
			}
    		});
           }
         });
        }
    }
    //when the dom has loaded setup form validation rules
    	$(D).ready(function($) {
        JQUERY4U.UTIL.setupFormValidation();
   		});

 	  })//Registration Process

	(jQuery, window, document);//
}//save_education

function del_publication(public_id){

	$.ajax({
	type: 'POST',
	url: $('#base_url2').val()+"profile/delete_publication",
	data: ({
			 'id'   : public_id
		   }),
	success: function(data){
			if(data=="yes"){
				$("#public_descr_"+public_id).remove();
			}else{
				$("#public_descr_"+public_id).remove();
				$(".publication-record").html('<p class="review-padding-3">No Publication Added</p>');
			}
/*			$(".publication-record").html(data);
			$(".publication").hide();
			$(".publication-btn").show();
			$(".edit").show();
			$(".del").show();
*/		}
	});
}//del_experience
function edit_publication(public_id){

	$.ajax({
	type: 'POST',
	url: $('#base_url2').val()+"profile/edit_publication",
	data: ({
			 'id'   : public_id
		   }),
	success: function(data){
		$(".publication-replace-from").html(data);
		}
	});

}//del_experience
function edit_publication_status(status){

	if(status == "show"){
		$(".publication").show();
		$(".publication-btn").hide();
	}
}//add_experience

function edit_user_name(status){
		$("#edit_user_name").hide();
		$(".user_name").show();
		$(".edit").hide();

}//add_experience

function save_user_name(status){
		(function($,W,D){
    var JQUERY4U           = {};
	var base_url2          = $("#base_url2").val();
    JQUERY4U.UTIL  =
    {
        setupFormValidation: function(){
            //form validation rules
            $("#userform").validate({
               rules: {
					user_name:{
                        required: true,
                    },
                },
                messages:{
                    user_name:{
					required : "Please Enter User Name",
					},
                },
                submitHandler: function(form) {
                    $.ajax({
						type: 'POST',
						url: $('#base_url2').val()+"profile/update_username",
						data: ({
							'user_name'       : $("#user_name").val(),
				//			'gender' : selected.val(),
						}),
        success: function(data){

			var content = '<p id="edit_user_name">'+$("#user_name").val()+' <span class="edit" style="float:right;"><a href="javascript:void(0);" onclick="edit_user_name();"><i class="fa fa-edit head-font-size14"></a></span></p>'
			$("#edit_user_name").html(content);
			$('#edit_user_name').css('display','inline');
			$(".user_name").hide();
			$(".edit").show();
			}
    		});
           }
         });
        }
    }
    //when the dom has loaded setup form validation rules
    	$(D).ready(function($) {
        JQUERY4U.UTIL.setupFormValidation();
   		});

 	  })//Registration Process

	(jQuery, window, document);//

}//add_experience

function cancel_user_name(status){
		$("#edit_user_name").show();
		$(".user_name").hide();
		$(".edit").show();

}//add_experience

function edit_short_detail(status){
		$("#edit_short_detail").hide();
		$(".short_detail").show();
		$(".edit").hide();

}//add_experience

function save_short_details(status){
		(function($,W,D){
    var JQUERY4U           = {};
	var base_url2          = $("#base_url2").val();
    JQUERY4U.UTIL  =
    {
        setupFormValidation: function(){
            //form validation rules
            $("#shortform").validate({
               rules: {
					short_details:{
                        required: true,
                    },
                },
                messages:{
                    short_details:{
					required : "Please Enter Short Detail",
					},
                },
                submitHandler: function(form) {
                    $.ajax({
						type: 'POST',
						url: $('#base_url2').val()+"profile/update_short_detail",
						data: ({
							'short_details'       : $("#short_details").val(),
				//			'gender' : selected.val(),
						}),
        success: function(data){

			var content = '<p id="edit_short_detail">'+$("#short_details").val()+' <span class="edit" style="float:right;"><a href="javascript:void(0);" onclick="edit_short_detail()"><i class="fa fa-edit head-font-size14"></a></span></p>';
			$("#edit_short_detail").html(content);
			$('#edit_short_detail').css('display','inline');
			$(".short_detail").hide();
			$(".edit").show();
			}
    		});
           }
         });
        }
    }
    //when the dom has loaded setup form validation rules
    	$(D).ready(function($) {
        JQUERY4U.UTIL.setupFormValidation();
   		});

 	  })//Registration Process

	(jQuery, window, document);//

}//add_experience

function cancel_short_details(status){
		$("#edit_short_detail").show();
		$(".short_detail").hide();
		$(".edit").show();

}//add_experience

function cancel_short_summary(status){
		$("#edit_summary").show();
		$(".profile_summary").hide();
		$(".edit").show();

}//add_experience

function edit_summary(status){
		$("#edit_summary").hide();
		$(".profile_summary").show();
		$(".edit").hide();

}//add_experience


function save_short_summary(status){

(function($,W,D){
    var JQUERY4U           = {};
	var base_url2          = $("#base_url2").val();
    JQUERY4U.UTIL  =
    {
        setupFormValidation: function(){
            //form validation rules
            $("#shortsummary").validate({
               rules: {
					profile_summary:{
                        required: true,
                    },
                },
                messages:{
                    profile_summary:{
					required : "Please Enter Description",
					},
                },
                submitHandler: function(form) {
                    $.ajax({
						type: 'POST',
						url: $('#base_url2').val()+"profile/update_summary",
						data: ({
							'profile_summary'       : $("#profile_summary").val(),
				//			'gender' : selected.val(),
						}),
        success: function(data){

			var content = '<p id="edit_summary">'+nl2br($("#profile_summary").val())+'<span class="edit" style="float:right;" ><a href="javascript:void(0);" onclick="edit_summary()"><i class="fa fa-edit head-font-size14"></i></a></span></p>';
			$("#edit_summary").html(content);
			$('#edit_summary').css('display','inline');
			$(".profile_summary").hide();
			$(".edit").show();
			}
    		});
           }
         });
        }
    }
    //when the dom has loaded setup form validation rules
    	$(D).ready(function($) {
        JQUERY4U.UTIL.setupFormValidation();
   		});

 	  })//Registration Process

	(jQuery, window, document);//

}//add_experience

function edit_price(status){
		$("#edit_price").hide();
		$(".price_rate").show();
		$(".edit").hide();

}//add_experience


function cancel_price_rate(status){
		$("#edit_price").show();
		$(".price_rate").hide();
		$(".edit").show();

}//add_experience


function save_price_rate(status){


(function($,W,D){
    var JQUERY4U           = {};
    JQUERY4U.UTIL  =
    {
        setupFormValidation: function(){
            //form validation rules
            $("#update_currency_rate").validate({
               rules: {
					per_hour_rate:{
                        required: true,
						min:2,
						max:1000,
                    },
                },
                messages:{
                    per_hour_rate:{
					required : "Please Enter Price",
					},
                },
                submitHandler: function(form) {
                    $.ajax({
						type: 'POST',
						url: base_url+"profile/update_price_rate",
						data: ({
							'per_hour_rate'       : $("#per_hour_rate").val(),
				//			'gender' : selected.val(),
						}),
        success: function(data){

			          content ='<div class="currency" id="edit_price">$ '+$("#per_hour_rate").val()+' USD/hr <span class="edit" style="float:right;" ><a href="javascript:void(0);" onclick="edit_price()"><i class="fa fa-edit head-font-size14"></i></a></span></div>';

			$("#edit_price").show();
			$("#edit_price").html(content);
			$(".price_rate").hide();
			$(".edit").show();
			}
    		});
           }
         });
        }
    }
    //when the dom has loaded setup form validation rules
    	$(D).ready(function($) {
        JQUERY4U.UTIL.setupFormValidation();
   		});

 	  })//Registration Process

	(jQuery, window, document);//

}//add_experience

/************************Usre skil page get skills by category**********************************/
//$("#select_skill_category li").click(function() {
    function insert_second_level_skill(cat_id){

		var option_all = $(".catClass").map(function () {
                            if ($(this).val() == 0) {
                            } else {
                                return $(this).val();
                            }
                        }).get().join(',');
                        $('#sub_parent').val(option_all);
	//var id = this.id;
	//var id = parseInt(id.substr(id.length - 1));
	$(".skill_category li").removeClass('selected');
	$("#skill_category_"+cat_id).addClass('selected');
	var img_src =  base_url+"assets/images/loading.gif";
		$('#content').html('<img id="loader-img" alt="" src="'+img_src+'" align="center" />');
			$.ajax({
			type: 'POST',
			dataType: 'json',
			beforeSend:function(){
				 $("#select_skill").html('<img style="display:block; margin:auto;" src="'+base_url+'/assets/images/loading_bird.gif" />');
			},
			url: base_url+"profile/get_skills_by_category",
			data: ({
				'id'   : cat_id,
			}),
        success: function(data){
				$(".profile_skills").show();
				$("#select_skill").html("");
				$.each(data, function(i, item){
					var skill_name = item.skill_name;
					var id = item.id;
					var skill_category_id = item.skill_category_id;
				if($("#choosed_skills li").length > 0){
				var abc = $('#sub_parent').val();
				if(abc.indexOf(id) != -1){
				}else{
				$("#select_skill").append('<li id=select_skill_'+id+'_'+skill_category_id+'><a href="javascript:void(0);"  onclick="add_skill('+id+',\''+skill_name+'\','+cat_id+')">'+skill_name+'<i class="fa fa-plus-circle" style="float:right;"></i></a></li>');
				}
				}else{
				$("#select_skill").append('<li id=select_skill_'+id+'_'+skill_category_id+'><a href="javascript:void(0);"  onclick="add_skill('+id+',\''+skill_name+'\','+cat_id+')">'+skill_name+'<i class="fa fa-plus-circle" style="float:right;"></i></a></li>');
				}

				});
			  }
    		});
	 }//insert_second_level_skill
	//})
/******************************Append selected skills************************************/

function add_skill(id,skill_name,cat_id){


	var calculateSkills = $('.catClass').length;

	if(calculateSkills <20){
	$(".choosed_skills").show();
	$("#select_skill_"+id+"_"+cat_id).remove();
	var append_content  = '<li  id=choose_skill_'+id+'_'+cat_id+'  class=skill_'+cat_id+'><a href="javascript:void(0);" onclick="move_skill_into_parent('+id+',\''+skill_name+'\','+cat_id+')">'+skill_name+'<i class="fa fa-minus-circle" style="float:right;"></i></a></li><input type="hidden" name="skill_id[]" id="skill_'+id+'" class="catClass" value="'+id+'">';




	$("#choosed_skills").append(append_content);
			$.ajax({
			type: 'POST',
			dataType: 'json',
			url: base_url+"profile/count_matching_jobs_skills",
			data: ({
				'id'   : id,
			}),
        success: function(data){
			 var count_matching_skills = $( "#projectCounter" ).text();
			 var count_matching_skills = Number($.trim(count_matching_skills)) + Number($.trim(data.count_skills));
			 $("#projectCounter").html(count_matching_skills);
				}
    		});
		}else{
			var skill_error = "You can only select up to 20 skills.";
				$("#release_error").slideDown();
				$("#release_error").html(skill_error);
			setInterval(function(){
				$("#release_error").slideUp();
			 }, 2000);

			}
	}//add_skill

function save_user_skills(){


			var calculateSkills = $('.catClass').length;
			if(calculateSkills >0){
			$.ajax({
			type: 'POST',
			dataType: 'json',
			url: base_url+"profile/save_user_skills",
			data: $("#add_user_skill").serialize(),
            success: function(data){
						$("#user_profile_list").html("");
						$("#choosed_skills li").each(function(j, li){
						 var cat_text = $(li).text();
							$("#user_profile_list").append('<li><a href="#">'+cat_text+'</a></li>');
    						});
						$("#getSkills").modal("hide");
				}
    		});
			}else{
			var skill_error = "Please select at least one skill.";
				$("#release_error").slideDown();
				$("#release_error").html(skill_error);
			setInterval(function(){
				$("#release_error").slideUp();
			 }, 7000);

			}
 }//save_user_skills

function move_skill_into_parent(id,skill_name,cat_id){

	$("#choose_skill_"+id+"_"+cat_id).remove();
	var class_name = $("#skill_category_"+cat_id).attr("class").split(' ')[1];
	$("#skill_"+id).remove();
	if(class_name == "selected"){
	$("#select_skill").append('<li id=select_skill_'+id+'_'+cat_id+'><a href="javascript:void(0);" onclick="add_skill('+id+',\''+skill_name+'\','+cat_id+')">'+skill_name+'<i class="fa fa-plus-circle" style="float:right;"></i></a></li>');
	}
			$.ajax({
			type: 'POST',
			dataType: 'json',
			url: base_url+"profile/count_matching_jobs_skills",
			data: ({
				'id'   : id,
			}),
        success: function(data){
			 var count_matching_skills = $( "#projectCounter" ).text();
			 var count_matching_skills = Number($.trim(count_matching_skills)) - Number($.trim(data.count_skills));
			 if(count_matching_skills > 0){
			 	$("#projectCounter").html(count_matching_skills);
			 }else{
				 $("#projectCounter").html(0);
			  }
			}
    	});
 }//move_skill_into_parent


function search_skill(){

			$("#user_skills_form").html("");
			$("#choosed_skills input").each(function(j, i){
					var skill_id = $(i).val();
					$("#user_skills_form").append('<input type="hidden" name="skills[]" id="skills" value="'+skill_id+'">');
			});
			$(".serach_skill_dropdown").show();
			var search_keyword = $('input:text[name=search_skill]').val();
			$.ajax({
			type: 'POST',
			dataType: 'json',
			url: base_url+"profile/search_skill",
			beforeSend:function(){
				 $("#serach_skill_dropdown").html('<img style="display:block; margin:auto;" src="'+base_url+'/assets/images/loading_bird.gif" />');
				 },
			data : $('#user_skills_form').serialize() + "&search_keyword="+search_keyword+"",
        success: function(data){

					if(data!=null && data!=""){
					$("#serach_skill_dropdown").html('');
					$.each(data, function(i, item){
					var skill_name = item.skill_name;
					var id = item.id;
					var skill_category_id = item.skill_category_id;
					$("#serach_skill_dropdown").append('<li id=search_skill_'+id+'_'+skill_category_id+'><a href="javascript:void(0);"  onclick="add_skill('+id+',\''+skill_name+'\','+skill_category_id+'),hide_search();">'+skill_name+'<i class="fa fa-chevron-right" style="float:right;"></i></a></li>');

					});
				}else{
					hide_search();
				}
			}
    	});

 }//search_skill

function hide_search(){


	$(".serach_skill_dropdown").hide();
}


/******************Skills pop up**************************/
/*var myContent = document.getElementById('content');

var myModal = new Modal({
    content: myContent
});

var triggerButton = document.getElementById('trigger');

triggerButton.addEventListener('click', function() {
    myModal.open();
});
*/

function get_skills_modal_new(){


	$.ajax({
		type    : 'POST',
		dataType:'html',
		url: base_url+"profile/get_skill",

		success : function(data){
		   if(data){
				$("#getskillcontent").html(data);
				$("#getSkills").modal('show');
		   }
		}
	});
}//get_skills_modal

function view_employeer_profile(status){

		if(status == "employeer"){
			$(".employeer_profile").show();
			$(".freelancer_profile").hide();
			$(".freelancer_btn").show();
			$(".employeer_btn").hide();
			$("#portpolio").hide();
		}else{
			$(".employeer_profile").hide();
			$(".freelancer_profile").show();
			$(".employeer_btn").show();
			$(".freelancer_btn").hide();
			$("#portpolio").show();

		}
	}//get_skills_modal

function get_portfolio_modal(portfolio_id,user_name){
	$.ajax({
		type    : 'POST',
		url: base_url+"portfolio/portfolioDetail",
		data: ({
				'id'          : portfolio_id,
				'user_name'   : user_name,
			}),
		success : function(data){
		   if(data){
				$("#portfoliocontent").html(data);
				$("#portfoliodetail").modal('show');
		   }
		}
	});
}//get_portfolio_modal

function get_reviews_modal(user_name){

	$.ajax({
		type    : 'POST',
		url: base_url+"reviews/getUserReviews",
		data: ({
		'user_name'   : user_name,
		}),
		success : function(data){
		   if(data){
				$("#reviewscontent").html(data);
				$("#morereviews").modal('show');
		   }
		}
	});
}//get_reviews_modal

function ajax_reviews_pagination(url,page_num,replace_div){

			$.ajax({
			type: 'POST',
			url: url,
			dataType:"html",
			data: $("#recent-review-form").serialize()+ "&page="+page_num+"",
	 beforeSend:function()
        {
     $("#"+replace_div).html('<img style="display:block; margin:auto;" src="'+base_url+'/assets/images/loading_bird.gif" />');
     },
	success: function(data){
					$("#"+replace_div).html(data);
				}
			});
	}//ajax_similar

function serach_reviews(){

		$.ajax({
		type: 'POST',
		url: base_url+"reviews/getUserReviews",
		dataType:"html",
		data: $("#recent-review-form").serialize(),
	 beforeSend:function()
        {
     $("#review_listing_div").html('<img style="display:block; margin:auto;" src="'+base_url+'/assets/images/loading_bird.gif" />');
     },
	success: function(data){
		$("#review_listing_div").html(data);
		$(".user_skills_dropdown").hide();
		$(".review-serach-btn").hide();
				}
			});
	}//ajax_similar


function SearchReviewDate(month_value){

		$("#month").val(month_value);
		$(".history-link").removeClass("selected");
		$("#month_"+month_value).addClass("selected");
		 serach_reviews();
	}


function show_dropdown(status){
	if(status == "show"){
			$(".user_skills_dropdown").slideDown();
			$(".review-serach-btn").show();
		}else{
			$(".review-serach-btn").hide();
			$(".user_skills_dropdown").hide();

		}
	}//show_dropdown
function _resetCheckbox(){

		$(".user_skill").attr("checked", false);
	}
