function getCaretPosition (elem) {

  // Initialize
  var iCaretPos = 0;

  // IE Support
  if (document.selection) {

    // Set focus on the element
    elem.focus ();

    // To get cursor position, get empty selection range
    var oSel = document.selection.createRange ();

    // Move selection start to 0 position
    oSel.moveStart ('character', -elem.value.length);

    // The caret position is selection length
    iCaretPos = oSel.text.length;
  }
  // Firefox support
  else if (elem.selectionStart || elem.selectionStart == '0')
    iCaretPos = elem.selectionStart;

  // Return results
  return (iCaretPos);
}

function setCaretPosition(elem, caretPos) {
    if(elem != null) {
        if(elem.createTextRange) {
            var range = elem.createTextRange();
            range.move('character', caretPos);
            range.select();
        }
        else {
            if(elem.selectionStart) {
                elem.focus();
                elem.setSelectionRange(caretPos, caretPos);
            }
            else
                elem.focus();
        }
    }
}

function getTags(term, callback) {
    $.ajax({
        url: URL_BASE+"/ajax/mentions",
        data: {
            filter: term
        },
        type: "GET",
        success: callback,
        jsonp: "json",
        dataType: "json"
   });    
}

$(document).ready(function() {
	
	//<------ * ADD NEW POST * --------->
    $("textarea.mentions-textarea").not('#description').bind("keydown", function(event) {
        if (event.keyCode === $.ui.keyCode.TAB && $(this).data("ui.autocomplete").menu.active) {

            event.preventDefault();
        }
    }).autocomplete({
        source: function(request, response) {
            var term = request.term;
            var pos = getCaretPosition(this.element.get(0));
            var substr = term.substring(0, pos);
            var lastIndex = substr.lastIndexOf('@');
            if ( lastIndex >= 0){
                var username = substr.substr(lastIndex + 1);
                if (username.length && (/^\w+$/g).test(username)){
                    getTags(username, function(data) {
                        response($.map(data.tags, function(el) {
                            return {
                                value: el.username,
                                avatar: el.avatar,
                                name: el.name
                            }
                        }));
                    });
                    return;
                }
            }

            response({}); 
        },
        focus: function() {
            // prevent value inserted on focus
            return false;
        },
        select: function(event, ui) {
            var pos = getCaretPosition(this);
            var substr = this.value.substring(0, pos);
            var lastIndex = substr.lastIndexOf('@');
            if ( lastIndex >= 0 ){
                var prependStr = this.value.substring(0, lastIndex);
                this.value = prependStr + '@' + ui.item.value + ' ' + this.value.substr(pos);
              //  setCaretPosition(this, prependStr.length + ui.item.value.length + 1 );
            }    
            return false;
        }
    }).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
  return $( "<li>" )
    .data( "ui-autocomplete-item", item )
    .append( "<a>" + item.label + "<br>" + item.desc + "</a>" )
    .appendTo( ul );
};
});