    
$(document).ready(function () {
 
  $("issueregistration").validate({

    rules: {
      
      issuename: "required",
      isassignedfrom:"required",
      isassignedto:"required",
      agentemail: {
        required: true,
        email: true
      },
      issuemessage:"required",
	  autocomplete:"required"
      
    },
  
    messages: {
      issuename: "Please enter issuename",
      isassignedfrom: "Please enter  IsAssignedFrom",
      isassignedto:"Please enter IsAssignedTo",
      agentemail: "Please enter a valid email address",
	  issuemessage:"Please enter the Issue Message",
	  autocomplete:"Please enter the Pincode"
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