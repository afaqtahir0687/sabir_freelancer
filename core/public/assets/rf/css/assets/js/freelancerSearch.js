    $(document).on('change','#profession',function(){
      var id = $(this).val();
      $('#jobs').html('');
      $.ajax({
        type: 'post',
        url:  base_url+'/get_jobs_by_category',
        data: {id:id},
        success: function(data){
          if (data != 0){
            $.each(data, function(index,item){
              $('#jobs').append('<option value="'+item.id+'" id="job-'+item.id+'">'+item.job_name+'</option>');
            });
            $('#jobs').show();
          }else {
            $('#jobs').hide();
          }
        }
      });
    });

    $(document).on('click', '.rating-star', function(){
      var thisrating = $(this).attr('data-rating');
      var parent     = $(this).parent().attr('id');
      var i = 1;
      $('#'+parent).html('');
      for(i = 5; i>0; i--){
        if(i <= thisrating){
          $('#'+parent).append('<span class="rating-star" style="color:gold" data-rating="'+i+'">&#x2605</span>');
        }else{
          $('#'+parent).append('<span class="rating-star" style="color:gold" data-rating="'+i+'">☆</span>');
        }
      }
      $('#'+parent+'rate').val(thisrating);

      if(thisrating > 1){
      var label_search = "stars";
      }else{
      label_search = "star";
      }
      if(thisrating > 0){
        $(".forhire-rating").show();
        }else{
        $(".forhire-rating").hide();
        }
      if(thisrating > 0){
      $("#selected_star_rate_div").html('<a href="javascript:void(0)" class="skill-remove"  id="selected_star" onclick="_removeStar('+thisrating+',0)"><i class="fa fa-remove"></i> '+thisrating+' '+label_search+'</a>')
      }else{
        $("#selected_star_rate_div").html("");
      }
      search_freelancer();
    });

    function _removeStar(id,value){
      $("#selected_star").remove();
      $("#star_rating").val("");
      search_freelancer();
    }

    $(document).on('change','#skills',function(){
      var id = $(this).val();
      var skill_name = $(this).find("option:selected").text();
      var skill_content = '<a href="javascript:void(0)" class="skill-remove"  onclick="_remove_skill('+id+')" id="selected_skill_'+id+'"><i class="fa fa-remove"></i> '+skill_name+'</a>';
      var skill_input = '<input type="hidden" name="skill_id[]" id="skill_id_'+id+'" value="'+id+'"/>';
      $("#selected_skill_jobs").append(skill_content);
      $("#selected_skill").append(skill_input);
      search_freelancer();
    });

    function _remove_skill(id){
      $("#skill_id_"+id).remove();
      $("#selected_skill_"+id).remove();
      $("#category_skill_"+id).removeClass("select_node");
      search_freelancer();
    }//_remove_skill

    function jobskills(job_id){
      category_id = $("#profession").val();
      $.ajax({
        type: 'POST',
        url: base_url+"/similar/jobSkills",
        dataType:"json",
        data:({
          'job_id':job_id,
          'cat_id':category_id,
        }),
        success: function(data){
          if(job_id!=""){
            $("#selected_skill_jobs").html("");
            $("#selected_skill").html("");
            $.each(data, function(i,item){
              var skill_name = item.skill_name;
              var id = item.id;
              var skill_content = '<a href="javascript:void(0)" class="skill-remove"  onclick="_remove_skill('+id+')" id="selected_skill_'+id+'"><i class="fa fa-remove"></i> '+skill_name+'</a>';
              var skill_input = '<input type="hidden" name="skill_id[]" id="skill_id_'+id+'" value="'+id+'"/>';
              $("#selected_skill_jobs").append(skill_content);
              $("#selected_skill").append(skill_input);
            });
            search_freelancer();
          }
        }
      });
    }//jobskills

    $(document).on('change','#country',function(){
      var id = $(this).val();
      var name = $(this).find("option:selected").text();
      var country_content = '<a href="javascript:void(0)" class="skill-remove"  id="selected_country_'+id+'" onclick="_remove_country('+id+')"><i class="fa fa-remove"></i> '+name+'</a> ';
      var country_input = '<input type="hidden" name="country[]" id="country_'+id+'" value="'+name+'"/>';
      $("#selected_country_div").append(country_content);
      $("#selected_country_input").append(country_input);
      search_freelancer();
    });

    function _remove_country(id){
      $("#country_"+id).remove();
      $("#selected_country_"+id).remove();
      search_freelancer();
    }//_remove_skill

    function add_search_rate(clickedElement){
      var id         =  clickedElement.id;
      var value      =  clickedElement.value;
      var text_rate  = $('#rate').find("option:selected").text();
      if(value!=0){
        $("#selected_rate_div").html("");
        var rate_content = '<a href="javascript:void(0)" class="skill-remove"  id="selected_rate" onclick="_remove_rate()"><i class="fa fa-remove"></i> '+text_rate+'</a> ';

      $("#selected_rate_div").html(rate_content);
      }else{
        $("#selected_rate_div").html("");
      }
      search_freelancer();
    }//add_search_rate

  function _remove_rate(id){
    $("#selected_rate").remove();
    $("#hourly_rate").val(0);
    search_freelancer();
  }//_remove_skill

  function check_user_status(){
    if($('#user_online').prop('checked')) {
      $("#online_user_selected").html('<a href="javascript:void(0)" class="skill-remove"  id="selected-online" onclick="_remove_online_user()"><i class="fa fa-remove"></i> Online Users</a>');
      $("#onlin_user").val("1");
      search_freelancer();
    } else {
      $("#selected-online").remove();
      $("#onlin_user").val("0");
      search_freelancer();
    }
  }

  function _remove_online_user(){
    $("#user_online").prop("checked", false);
    $("#selected-online").remove();
    $("#onlin_user").val("0");
    search_freelancer();
  }

  function search_freelancer(){
    $("#freelace_list").html('');
    $.ajax({
      type: 'POST',
      url: base_url+"/similar/browsesmilar",
      dataType:"html",
      data: $("#searchfree").serialize(),
        beforeSend: function () {
                 $(".freelancer_list_loader").show();
          },
          complete: function () {
                  $(".freelancer_list_loader").hide();
          },
      success: function(data){
        $("#freelace_list").html(data);
        $('html, body').animate({
          scrollTop: $("#freelace_list").offset().top
        }, 2000);
      }
    });
  }//ajax_similar

  function search_user_free(){
    var search_free     = $("#search_free").val();
    if(search_free!=""){
      $("#free_user").html('<a href="javascript:void(0)" class="skill-remove"  id="selected_freeSearch" onclick="_remove_free_user()"><i class="fa fa-remove"></i> Search: '+search_free+'</a>');
      $("#selected_freeSearch").show();
    }else{
      $("#free_user").html('');
    }
    search_freelancer();
  }//search_user_free
