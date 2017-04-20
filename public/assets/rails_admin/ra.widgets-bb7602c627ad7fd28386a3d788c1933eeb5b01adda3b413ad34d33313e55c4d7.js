(function(){$(document).on("rails_admin.dom_ready",function(t,e){var n,i,a,r,o,s,d,l;if(e=e||$("form"),e.length&&(e.find("[data-color]").each(function(){var t;return t=this,$(this).ColorPicker({color:$(t).val(),onShow:function(t){return $(t).fadeIn(500),!1},onHide:function(t){return $(t).fadeOut(500),!1},onChange:function(e,n){return $(t).val(n),$(t).css("backgroundColor","#"+n)}})}),$.fn.datetimepicker.defaults.icons={time:"fa fa-clock-o",date:"fa fa-calendar",up:"fa fa-chevron-up",down:"fa fa-chevron-down",previous:"fa fa-angle-double-left",next:"fa fa-angle-double-right",today:"fa fa-dot-circle-o",clear:"fa fa-trash",close:"fa fa-times"},e.find("[data-datetimepicker]").each(function(){var t;return t=$(this).data("options"),$.extend(t,{locale:RailsAdmin.I18n.locale}),$(this).datetimepicker(t)}),e.find("[data-enumeration]").each(function(){return $(this).is("[multiple]")?$(this).filteringMultiselect($(this).data("options")):$(this).filteringSelect($(this).data("options"))}),e.find("[data-fileupload]").each(function(){var t;return t=this,$(this).on("click",".delete input[type='checkbox']",function(){return $(t).children(".toggle").toggle("slow")})}),e.find("[data-fileupload]").change(function(){var t,e,n,i;return n=this,e=$("#"+n.id).parent().children(".preview"),e.length||(e=$("#"+n.id).parent().prepend($("<img />").addClass("preview").addClass("img-thumbnail")).find("img.preview"),e.parent().find("img:not(.preview)").hide()),t=$("#"+n.id).val().split(".").pop().toLowerCase(),n.files&&n.files[0]&&-1!==$.inArray(t,["gif","png","jpg","jpeg","bmp"])?(i=new FileReader,i.onload=function(t){return e.attr("src",t.target.result)},i.readAsDataURL(n.files[0]),e.show()):e.hide()}),e.find("[data-filteringmultiselect]").each(function(){return $(this).filteringMultiselect($(this).data("options")),$(this).parents("#modal").length?$(this).siblings(".btn").remove():$(this).parents(".control-group").first().remoteForm()}),e.find("[data-filteringselect]").each(function(){return $(this).filteringSelect($(this).data("options")),$(this).parents("#modal").length?$(this).siblings(".btn").remove():$(this).parents(".control-group").first().remoteForm()}),e.find("[data-nestedmany]").each(function(){var t,e,n,i;return t=$(this).parents(".control-group").first(),e=t.find("> .controls > .nav"),n=t.find("> .tab-content"),i=t.find("> .controls > .btn-group > .toggler"),n.children(".fields:not(.tab-pane)").addClass("tab-pane").each(function(){return $(this).attr("id","unique-id-"+(new Date).getTime()+Math.floor(1e5*Math.random())),e.append('<li><a data-toggle="tab" href="#'+this.id+'">'+$(this).children(".object-infos").data("object-label")+"</a></li>")}),0===e.find("> li.active").length&&e.find("> li > a[data-toggle='tab']:first").tab("show"),0===e.children().length?(e.hide(),n.hide(),i.addClass("disabled").removeClass("active").children("i").addClass("icon-chevron-right")):i.hasClass("active")?(e.show(),n.show(),i.children("i").addClass("icon-chevron-down")):(e.hide(),n.hide(),i.children("i").addClass("icon-chevron-right"))}),e.find("[data-nestedone]").each(function(){var t,e,n,i,a;return t=$(this).parents(".control-group").first(),n=t.find("> .controls > .nav"),i=t.find("> .tab-content"),a=t.find("> .controls > .btn-group > .toggler"),i.children(".fields:not(.tab-pane)").addClass("tab-pane active").each(function(){return t.find("> .controls .add_nested_fields").removeClass("add_nested_fields").html($(this).children(".object-infos").data("object-label")),n.append('<li><a data-toggle="tab" href="#'+this.id+'">'+$(this).children(".object-infos").data("object-label")+"</a></li>")}),e=n.find("> li > a[data-toggle='tab']:first"),e.tab("show"),t.find("> .controls > [data-target]:first").html('<i class="icon-white"></i> '+e.html()),n.hide(),0===n.children().length?(n.hide(),i.hide(),a.addClass("disabled").removeClass("active").children("i").addClass("icon-chevron-right")):a.hasClass("active")?(a.children("i").addClass("icon-chevron-down"),i.show()):(a.children("i").addClass("icon-chevron-right"),i.hide())}),e.find("[data-polymorphic]").each(function(){var t,e,n,i;return n=$(this),t=n.parents(".control-group").first(),e=t.find("select").last(),i=n.data("urls"),n.on("change",function(){return""===$(this).val()?e.html('<option value=""></option>'):$.ajax({url:i[n.val()],data:{compact:!0,all:!0},beforeSend:function(t){return t.setRequestHeader("Accept","application/json")},success:function(t){var n;return n=$("<option></option>"),$(t).each(function(t,e){var i;return i=$("<option></option>"),i.attr("value",e.id),i.text(e.label),n=n.add(i)}),e.html(n)}})})}),o=function(){return e.find("[data-richtext=ckeditor]").not(".ckeditored").each(function(){var t;try{(t=window.CKEDITOR.instances[this.id])&&t.destroy(!0)}catch(t){}return window.CKEDITOR.replace(this,$(this).data("options")),$(this).addClass("ckeditored")})},n=e.find("[data-richtext=ckeditor]").not(".ckeditored"),n.length&&(window.CKEDITOR?o():(l=n.first().data("options"),window.CKEDITOR_BASEPATH=l.base_location,$.getScript(l.jspath,function(){return function(){return o()}}()))),s=function(){return function(t){return t.each(function(){var t;return l=$(this).data("options"),t=this,$.getScript(l.locations.mode,function(){return $("head").append('<link href="'+l.locations.theme+'" rel="stylesheet" media="all" type="text/css">'),CodeMirror.fromTextArea(t,l.options),$(t).addClass("codemirrored")})})}}(),i=e.find("[data-richtext=codemirror]").not(".codemirrored"),i.length&&(this.array=i,window.CodeMirror?s(this.array):(l=$(i[0]).data("options"),$("head").append('<link href="'+l.csspath+'" rel="stylesheet" media="all" type="text/css">'),$.getScript(l.jspath,function(t){return function(){return s(t.array)}}(this)))),r=function(){return function(t,e){return t.each(function(){return $(this).addClass("bootstrap-wysihtml5ed"),$(this).closest(".controls").addClass("well"),$(this).wysihtml5(e)})}}(),i=e.find("[data-richtext=bootstrap-wysihtml5]").not(".bootstrap-wysihtml5ed"),i.length&&(this.array=i,l=$(i[0]).data("options"),a=$.parseJSON(l.config_options),window.wysihtml5?r(this.array,a):($("head").append('<link href="'+l.csspath+'" rel="stylesheet" media="all" type="text/css">'),$.getScript(l.jspath,function(t){return function(){return r(t.array,a)}}(this)))),d=function(){return function(t){return t.each(function(){var t;if(l=$(this).data("options"),a=$.parseJSON(l.config_options),a?a.inlineMode||(a.inlineMode=!1):a={inlineMode:!1},t=a.imageUploadURL?a.imageUploadParams={authenticity_token:$("meta[name=csrf-token]").attr("content")}:void 0,$(this).addClass("froala-wysiwyged"),$(this).editable(a),t)return $(this).on("editable.imageError",function(t,e,n){alert("error uploading image: "+n.message),0===n.code||1===n.code||2===n.code||3===n.code||4===n.code||5===n.code||6===n.code||n.code}).on("editable.afterRemoveImage",function(t,e,n){e.options.imageDeleteParams={src:n.attr("src"),authenticity_token:$("meta[name=csrf-token]").attr("content")},e.deleteImage(n)}).on("editable.imageDeleteSuccess",function(){}).on("editable.imageDeleteError",function(t,e,n){return alert("error deleting image: "+n.message)})})}}(),i=e.find("[data-richtext=froala-wysiwyg]").not(".froala-wysiwyged"),i.length))return l=$(i[0]).data("options"),$.isFunction($.fn.editable)?d(i):($("head").append('<link href="'+l.csspath+'" rel="stylesheet" media="all" type="text/css">'),$.getScript(l.jspath,function(){return function(){return d(i)}}()))})}).call(this);