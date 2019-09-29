$(document).ready(function () {
 
  $("#taskregistration").validate({

    rules: {
      
      taskname: "required",
	  agentemail: {
        required: true,
        email: true
      },
	  shopname:"required",
	  sellername:"required",
	   sellermobile: {
        required: true,
        minlength: 10
      },
	  sellerdeal:"required",
      isassignedfrom:"required",
      isassignedto:"required",
      
	  autocomplete:"required"
      
    },
  
    messages: {
      taskname: "Please enter issuename",
	  agentemail: "Please enter a valid email address",
	  shopname:"Please enter shop name",
	  sellername:"Please enter seller name",
	  sellermobile:"Please enter seller monbile number",
	  sellerdeal:"Please enter seller deal",
      isassignedfrom: "Please enter  IsAssignedFrom",
      isassignedto:"Please enter IsAssignedTo",
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