$(document).ready(function(){
   $("#recentimage").change(function(){
     var filesSelected = document.getElementById("recentimage").files;
     if(filesSelected.length > 0){
    var fileToLoad = filesSelected[0];
    var fileReader = new FileReader();
    fileReader.onload = function(fileLoadedEvent){
    var base64value = fileLoadedEvent.target.result;
	base64 = base64value.split(',')[1];
    console.log(base64);
	$("#response").val(base64);
    };
     fileReader.readAsDataURL(fileToLoad);
    }
    });
 
   $("#aadharimage").change(function(){
     var filesSelected = document.getElementById("recentimage").files;
     if(filesSelected.length > 0){
    var fileToLoad = filesSelected[0];
    var fileReader = new FileReader();
    fileReader.onload = function(fileLoadedEvent){
    var base64value = fileLoadedEvent.target.result;
	base64 = base64value.split(',')[1];
    console.log(base64);
	$("#response1").val(base64);
    };
     fileReader.readAsDataURL(fileToLoad);
    }
    });
    $("#panimage").change(function(){
     var filesSelected = document.getElementById("recentimage").files;
     if(filesSelected.length > 0){
    var fileToLoad = filesSelected[0];
    var fileReader = new FileReader();
    fileReader.onload = function(fileLoadedEvent){
    var base64value = fileLoadedEvent.target.result;
	base64 = base64value.split(',')[1];
    console.log(base64);
	$("#response2").val(base64);
    };
     fileReader.readAsDataURL(fileToLoad);
    }
    });
   $("#voterimage").change(function(){
     var filesSelected = document.getElementById("recentimage").files;
     if(filesSelected.length > 0){
    var fileToLoad = filesSelected[0];
    var fileReader = new FileReader();
    fileReader.onload = function(fileLoadedEvent){
    var base64value = fileLoadedEvent.target.result;
	base64 = base64value.split(',')[1];
    console.log(base64);
	$("#response3").val(base64);
    };
     fileReader.readAsDataURL(fileToLoad);
    }
    });
   $("#certificateimage").change(function(){
     var filesSelected = document.getElementById("recentimage").files;
     if(filesSelected.length > 0){
    var fileToLoad = filesSelected[0];
    var fileReader = new FileReader();
    fileReader.onload = function(fileLoadedEvent){
    var base64value = fileLoadedEvent.target.result;
	base64 = base64value.split(',')[1];
    console.log(base64);
	$("#response4").val(base64);
    };
     fileReader.readAsDataURL(fileToLoad);
    }
    });
    
    });

