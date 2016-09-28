
$(document).on('ready turbolinks:load', function() {
  stylesheet.init();
});

stylesheet= {
	
	init: function(){
		var form_element = $('#css_form');
		form_element.unbind('submit').submit(function(){
			$.ajax({
	      type: "POST",
	      url: form_element.attr("action"),
	      data: form_element.serialize(),
	      dataType: "text",
	      success: function(resultData){
	        form_element.find("#error_explanation").remove();
	        stylesheet.update_css();
	      },
	      error: function(result){
	      	form_element.find("#error_explanation").remove();
	      	var error = { error: JSON.parse(result.responseText)};
	      	var error_template = JST['ejs/error'](error);
	      	form_element.prepend(error_template);
	      }
	    });
      return false;
    });
	  $('.colorpicker').colorpicker();
	},

	update_css: function(){
	  var css_link = $('#css').attr('href');
		$('#css').replaceWith('<link id="css" rel="stylesheet" href="' + css_link + '?t=' + Date.now() + '"></link>');
	}

}