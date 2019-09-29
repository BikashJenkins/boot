$(document).ready(function () {
 
  $("updateissues").validate({

    rules: {
      
      issuename: "required",
      isassignedfrom:"required",
      isassignedto:"required",
      updatedemail: {
        required: true,
        email: true
      },
      issuemessage:"required",
	  autocomplete:"required"
      
    },
  
    messages: {
     
      updatedemail: "Please enter a valid email address"
	
    },
    onfocusout: function(element) {
            this.element(element);
        },
   
    submitHandler: function(form) {
      form.submit();
    }
  });
 return false;   
     
   
   
});