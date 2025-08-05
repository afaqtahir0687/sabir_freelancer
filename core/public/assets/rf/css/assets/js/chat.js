//<----- Chat
function Chat() {	
	
	var param    = /^[0-9]+$/i;
	var _lastId  = $('li.chatlist:last').attr('data');
	var _userId  = $('.content').attr('data');
	var _list    = $('.content').html();
	
	if( !param.test( _lastId ) ) {
		return false;
	}
			
		//****** COUNT DATA
		$.get(URL_BASE+"/ajax/chat", { last_id:_lastId, user_id: _userId }, function( res ) {	
		if ( res ) {
			
			if( res.total != 0 ) {
				
			var total_data = res.messages.length; 
			
			for( var i = 0; i < total_data; ++i ) { 
				$( res.messages[i] ).hide().appendTo( '.content' ).fadeIn( 500 ); 
				}
				
			$('.paragraph').readmore({
				maxHeight: 120,
				moreLink: '<a href="javascript:void(0);">'+ReadMore+'</a>',
				lessLink: '<a href="javascript:void(0);">'+ReadLess+'</a>',
				sectionCSS: 'display: block; width: 100%;',
			});
			
				jQuery(".timeAgo").timeago(); 
				//<**** - tooltip
				$(".showTooltip").tooltip();
				
				$(".galery").colorbox({
			   		height: '100%',
			   		imgError : 'Error'
			   	});
			   	
			   	var myDiv = $("#contentDIV").get(0);
			   	myDiv.scrollTop = myDiv.scrollHeight;
				
			}
		   }//<-- DATA
	     	
		},'json');
}//End Function TimeLine
		
timer = setInterval("Chat()", 5000);