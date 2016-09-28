$(document).on('ready turbolinks:load', function() {
  user.init();
});

user = {
	
	init: function(){
		var form_element = $('#new_user,#user_form').first();
		form_element.unbind('submit').submit(function(){
			$.ajax({
	      type: "POST",
	      url: form_element.attr("action"),
	      data: form_element.serialize(),
	      dataType: "text",
	      success: function(resultData){
	        form_element.find("#error_explanation").remove();
	        Turbolinks.visit("/");
	        stylesheets.update_css();
	      },
	      error: function(result){
	      	form_element.find("#error_explanation").remove();
	      	var error = null;
	      	try {
		      error = { error: JSON.parse(result.responseText)};
   	      	  var error_template = JST['ejs/user_signup_error'](error);
		    } catch (e) {
		    }
	      	if( error == null){
	      		var error_msg = {error_msg: result.responseText };
	      		var error_template = JST['ejs/user_signup_error'](error_msg);

	      	}
	      	form_element.prepend(error_template);
	      }
	    });
      return false;
    });
    var logout_link = $("#logout");
    logout_link.click(function(event){ 
	    $.ajax({
	        type: "DELETE",
	        url: logout_link.attr('href'),
	        dataType: "json",
	        data: {"_method":"delete"},
	        complete: function(){
	          Turbolinks.visit("/");
	          stylesheets.update_css();
	        }
	    });
	    event.preventDefault();
	    return false;
	  });
	}
}