
 $(document).ready(function () {
 
  $("#jobregistration").validate({

    rules: {
      
    	jobtitle: "required",
    	companyname: "required",
    	username:"required",
        jobrole:"required",
        salary:"required",
        location:"reuired",
        salarycriteria:"required",
        jobdescription:"required",
        cvupload:{
            required: true,
               extension: "pdf"||"docx",
       },
    },
  
    messages: {
    	jobtitle: "Please enter Job Title",
    	companyname: "Please enter Company Name",
    	location:"Please enter Location",
    	jobrole: "Please enter Job Role",
    	salary:"Please enter Salary",
        location:"Please enter Location",
        salarycriteria:"Please select salarycriteria",
        jobdescription:"Please write Job Description",
        cvupload:"Please upload pdf or docx files"
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
 
 $.validator.methods.email = function( value, element ) {
	  return this.optional( element ) || /[a-z]+@[a-z]+\.[a-z]+/.test( value );
	}

    