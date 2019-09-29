
 $(document).ready(function () {
 
  $("#registration").validate({

    rules: {
      
      firstname: "required",
      lastname: "required",
      username:"required",
      email: {
        required: true,
        email: true
          },
          dob: {
              required: true,
              date: true
            },
      password: {
        required: true,
        minlength: 5
        },
       
        qual:"required",
       
        state:"required",
        district:"required",
    },
  
    messages: {
      firstname: "Please enter firstname",
      lastname: "Please enter  lastname",
      username:"Your username  must be 10 characters only",
      password: {
        required: "Please provide a password",
        minlength: "Your password must be at least 5 characters long"
      },
        mobile: {
        required: "Please provide mobile number",
        maxlength:  "Mobile number must be 10 numbers"
      },
      email: "Please enter a valid email address",
      dob:"Please enter Date of birth",
        qual:"Please select Qualification",
        location:"Please Enter Location",
        addr1:"Please provide Address",
        addr2:"Please provide city",
        zipcode:"Please provide zip code"
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
 

 $.validator.addMethod('filesize', function (value, element, param) {
	    return this.optional(element) || (element.files[0].size <= param)
	}, 'File size must be less than {0}');
    