 
 $('#fileShot').filer({
        showThumbs: true,
        
        limit: 1,
        maxSize: _maxSize,
        extensions: ['jpg','jpeg','gif', 'png', 'x-png'],

        theme: "dragdropbox",
        changeInput: '<div class="jFiler-input-dragDrop"><div class="jFiler-input-inner"><div class="jFiler-input-icon"><i class="icon-jfi-cloud-up-o"  style="font-size: 32px"></i></div><div class="jFiler-input-text"><h3>'+_select_image+'</h3></div></div></div>',
       templates: {
       	 removeConfirmation: false,
       },
        
       
        
        files: null,
        addMore: false,
        clipBoardPaste: true,
        excludeName: null,
        beforeRender: null,
        afterRender: null,
        beforeShow: null,
        beforeSelect: null,
        onSelect: null,
        afterShow: null,
        
         onEmpty: null,
        options: null,
        captions: {
            button: "Choose Files",
            feedback: "Choose files To Upload",
            feedback2: "files were chosen",
            drop: "Drop file here to Upload",
            removeConfirmation: "Are you sure you want to remove this file?",
            errors: {
                filesLimit: "Only {{fi-limit}} files are allowed to be uploaded.",
                filesType: "Only Images JPG, GIF and PNG are allowed to be uploaded.",
                filesSize: "{{fi-name}} is too large! Please upload file up to {{fi-maxSize}} MB.",
                filesSizeAll: "Files you've choosed are too large! Please upload files up to {{fi-maxSize}} MB."
            }
        }
        
    });
    
    
$('#fileImages1').filer({
        showThumbs: true,
        
        limit: 1,
        maxSize: _maxSize,
        extensions: ['jpg','jpeg','gif', 'png', 'x-png'],

        theme: "dragdropbox",
        changeInput: '<div class="jFiler-input-dragDrop extraImages"><div class="jFiler-input-inner"><div class="jFiler-input-icon"><i class="icon-jfi-cloud-up-o" style="font-size: 32px"></i></div><div class="jFiler-input-text"><h3>'+_select_image+' #1</h3></div></div></div>',
        templates: {
            removeConfirmation: false,

        },
        files: null,
        addMore: false,
        clipBoardPaste: true,
        excludeName: null,
        beforeRender: null,
        afterRender: null,
        beforeShow: null,
        beforeSelect: null,
        onSelect: null,
        afterShow: null,
        
         onEmpty: null,
        options: null,
        captions: {
            button: "Choose Files",
            feedback: "Choose files To Upload",
            feedback2: "files were chosen",
            drop: "Drop file here to Upload",
            removeConfirmation: "Are you sure you want to remove this file?",
            errors: {
                filesLimit: "Only {{fi-limit}} files are allowed to be uploaded.",
                filesType: "Only Images JPG, GIF and PNG are allowed to be uploaded.",
                filesSize: "{{fi-name}} is too large! Please upload file up to {{fi-maxSize}} MB.",
                filesSizeAll: "Files you've choosed are too large! Please upload files up to {{fi-maxSize}} MB."
            }
        }
    });

$('#fileImages2').filer({
        showThumbs: true,
        
        limit: 1,
        maxSize: _maxSize,
        extensions: ['jpg','jpeg','gif', 'png', 'x-png'],

        theme: "dragdropbox",
        changeInput: '<div class="jFiler-input-dragDrop extraImages2" style="display:none;"><div class="jFiler-input-inner"><div class="jFiler-input-icon"><i class="icon-jfi-cloud-up-o"  style="font-size: 32px"></i></div><div class="jFiler-input-text"><h3>'+_select_image+' #2</h3></div></div></div>',
        templates: {
            removeConfirmation: false,

        },
        files: null,
        addMore: false,
        clipBoardPaste: true,
        excludeName: null,
        beforeRender: null,
        afterRender: null,
        beforeShow: null,
        beforeSelect: null,
        onSelect: null,
        afterShow: null,
        
         onEmpty: null,
        options: null,
        captions: {
            button: "Choose Files",
            feedback: "Choose files To Upload",
            feedback2: "files were chosen",
            drop: "Drop file here to Upload",
            removeConfirmation: "Are you sure you want to remove this file?",
            errors: {
                filesLimit: "Only {{fi-limit}} files are allowed to be uploaded.",
                filesType: "Only Images JPG, GIF and PNG are allowed to be uploaded.",
                filesSize: "{{fi-name}} is too large! Please upload file up to {{fi-maxSize}} MB.",
                filesSizeAll: "Files you've choosed are too large! Please upload files up to {{fi-maxSize}} MB."
            }
        }
    });
    
$('#fileImages3').filer({
        showThumbs: true,
        
        limit: 1,
        maxSize: _maxSize,
        extensions: ['jpg','jpeg','gif', 'png', 'x-png'],

        theme: "dragdropbox",
        changeInput: '<div class="jFiler-input-dragDrop extraImages3" style="display:none;"><div class="jFiler-input-inner"><div class="jFiler-input-icon"><i class="icon-jfi-cloud-up-o"  style="font-size: 32px"></i></div><div class="jFiler-input-text"><h3>'+_select_image+' #3</h3></div></div></div>',
        templates: {
            removeConfirmation: false,

        },
        files: null,
        addMore: false,
        clipBoardPaste: true,
        excludeName: null,
        beforeRender: null,
        afterRender: null,
        beforeShow: null,
        beforeSelect: null,
        onSelect: null,
        afterShow: null,
        
         onEmpty: null,
        options: null,
        captions: {
            button: "Choose Files",
            feedback: "Choose files To Upload",
            feedback2: "files were chosen",
            drop: "Drop file here to Upload",
            removeConfirmation: "Are you sure you want to remove this file?",
            errors: {
                filesLimit: "Only {{fi-limit}} files are allowed to be uploaded.",
                filesType: "Only Images JPG, GIF and PNG are allowed to be uploaded.",
                filesSize: "{{fi-name}} is too large! Please upload file up to {{fi-maxSize}} MB.",
                filesSizeAll: "Files you've choosed are too large! Please upload files up to {{fi-maxSize}} MB."
            }
        }
    });
    
$('#fileImages4').filer({
        showThumbs: true,
        
        limit: 1,
        maxSize: _maxSize,
        extensions: ['jpg','jpeg','gif', 'png', 'x-png'],

        theme: "dragdropbox",
        changeInput: '<div class="jFiler-input-dragDrop extraImages4" style="display:none;"><div class="jFiler-input-inner"><div class="jFiler-input-icon"><i class="icon-jfi-cloud-up-o"  style="font-size: 32px"></i></div><div class="jFiler-input-text"><h3>'+_select_image+' #4</h3></div></div></div>',
        templates: {
            removeConfirmation: false,

        },
        files: null,
        addMore: false,
        clipBoardPaste: true,
        excludeName: null,
        beforeRender: null,
        afterRender: null,
        beforeShow: null,
        beforeSelect: null,
        onSelect: null,
        afterShow: null,
        
         onEmpty: null,
        options: null,
        captions: {
            button: "Choose Files",
            feedback: "Choose files To Upload",
            feedback2: "files were chosen",
            drop: "Drop file here to Upload",
            removeConfirmation: "Are you sure you want to remove this file?",
            errors: {
                filesLimit: "Only {{fi-limit}} files are allowed to be uploaded.",
                filesType: "Only Images JPG, GIF and PNG are allowed to be uploaded.",
                filesSize: "{{fi-name}} is too large! Please upload file up to {{fi-maxSize}} MB.",
                filesSizeAll: "Files you've choosed are too large! Please upload files up to {{fi-maxSize}} MB."
            }
        }
    });