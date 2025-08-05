  $.ajaxSetup({
    headers: {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
  });
function site_search(){
	$("#search-record").show();
	var search_keyword = $('input:text[name=q]').val();
	$.ajax({
		type: 'POST',
		dataType:'json',
		url: base_url+'/search/searchProjects',
		beforeSend:function(){
	     $("#project_div").html('<img style="display:block; margin:auto;" src="'+PUB_URL+'/images/right_loader.gif" />');
	    },
		data : "search_keyword="+search_keyword+"",
		success: function(project_data){
			console.log(project_data);
			$("#project_div").html("");
			if(project_data.total_record > 5){
				var see_more = '<a href=""'+base_url+'categories/browse_skills_projects"">See More</a>';
				$("#project_div").append(see_more);
			}
			if(project_data!=0 && project_data!=""){
			$.each(project_data, function(i, item){
				if(i!="total_record"){
				var append_project ='<li><a href="'+base_url+'categories/browse_skills_projects">'+item.project_name+'</a></li>';
					$("#project_div").append(append_project);
						}
						});
					}else{
				var append_project ='<li>Sorry No Project Found!</li>';
					$("#project_div").append(append_project);
			}
		},
	});

	$.ajax({
		type: 'POST',
		dataType:'json',
		url: base_url+'/search/searchUsers',
		beforeSend:function(){
	     $("#user_div").html('<img style="display:block; margin:auto;" src="'+PUB_URL+'/images/right_loader.gif" />');
	     },
		data : "search_keyword="+search_keyword+"",
		success: function(user_data){
			console.log(user_data);
			$("#user_div").html("");
			if(user_data.total_record > 5){
				var see_more = '<a href="'+base_url+'similar/skill/">See More</a>';
				$("#user_div").append(see_more);
			}
			if(user_data!="" && user_data!=0){
				$.each(user_data, function(i, item){
					if(i!="total_record"){
						var append_users ='<li><a href="'+base_url+'profile/info/'+item.username+'">'+item.username+'</a></li>';
						$("#user_div").append(append_users);
					}
				});
			}else{
				var append_users ='<li>Sorry No User Found!</li>';
				$("#user_div").append(append_users);
			}
		},
	});

	$.ajax({
		type: 'POST',
		dataType:'json',
		url: base_url+'/search/searchSkills',
		beforeSend:function(){
				$("#skill_div").html('<img style="display:block; margin:auto;" src="'+PUB_URL+'/images/right_loader.gif" />');
			},
		data : "search_keyword="+search_keyword+"",
		success: function(skill_data){
			console.log(skill_data);
			$("#skill_div").html("");
			if(skill_data.total_record > 5){
				var see_more = '<a href="'+base_url+'similar/skill/">See More</a>';
				$("#skill_div").append(see_more);
			}
			if(skill_data!=0 && skill_data!=""){
				$.each(skill_data, function(i, item){
					if(i!="total_record"){
					var append_skill ='<li><a href="'+base_url+'similar/skill/'+item.id+'">'+item.skill_name+'</a></li>';
						$("#skill_div").append(append_skill);
					}
				});
			}else{
				var append_skill ='<li>Sorry No Skill Found!</li>';
				$("#skill_div").append(append_skill);
			}
		},
	});
}


$('body').click(function() {
   $('#search-record').hide();
});



