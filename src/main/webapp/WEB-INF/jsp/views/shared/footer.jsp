<footer class="sticky-footer">
	<div class="container">
		<div class="text-right">
			<strong><span id='copyright'>Copyright </span>© HULKLOGIC
				2017 <span style="float: left; color: red;" id="issues">Any
					issues</span><span style="float: left; color: red;">?</span> <a
				href="${pageContext.servletContext.contextPath}/user/support"
				style="float: left; color: #ff8f00"><strong>&nbsp;HULKSupport</strong></a>
			</strong>
		</div>
	</div>
</footer>

  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="X">
					<span aria-hidden="true">&#10006</span>
				</button>
			</div>
			<div class="modal-body">Select "Logout" below if you are ready
				to end your current session.</div>
			<div class="modal-footer">

				<a class="btn btn-primary" onclick="logout();">Logout</a>
			</div>
		</div>
	</div>
</div> 
<!--<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Feedback?</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="X">
					<span aria-hidden="true">&#10006</span>
				</button>
			</div>
			<div class="modal-body">
        <p align="justify">
           We thank you for giving us the opportunity to serve you. Our Company is driven by your satisfaction. 
			We would greatly appreciate, if you would take a moment of your time and share the experience and feedback regarding the service from HulkLogic Team.
        </p>
        <form role="form" method="post" id="reused_form">
            <div class="row">
                <div class="col-sm-12 form-group">
                <label>How do you rate your overall experience?</label>
                <p>
                    <label class="radio-inline">
                    <input type="radio" name="experience" id="radio_experience" value="bad" >
                    Bad
                    </label>
                    <label class="radio-inline">
                    <input type="radio" name="experience" id="radio_experience" value="average" >
                    Average
                    </label>

                    <label class="radio-inline">
                    <input type="radio" name="experience" id="radio_experience" value="good" >
                    Good
                    </label>
                </p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 form-group">
                    <label for="comments">
                        Any Suggestions:</label>
                    <textarea class="form-control" type="textarea" name="comments" id="comments" placeholder="Your Suggestions" maxlength="6000" rows="7"></textarea>
                </div>
            </div>
        </form>
</div>
			<div class="modal-footer">

				<a class="btn btn-primary">Post</a>
			</div>
		</div>
	</div>
</div> -->
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fa fa-angle-up"></i>
</a>



<!-- Bootstrap core JavaScript-->
<script type="text/JavaScript"
	src="<c:url value='/resources/vendor/jquery/jquery.min.js' />"></script>
<script type="text/JavaScript"
	src="<c:url value='/resources/vendor/popper/popper.min.js' />"></script>
<script type="text/JavaScript"
	src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.min.js' />"></script>
<!-- Core plugin JavaScript-->
<script type="text/JavaScript"
	src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js' />"></script>
<!-- Page level plugin JavaScript-->

<script type="text/JavaScript"
	src="<c:url value='/resources/js/sb-admin.min.js' />"></script>
<script type="text/JavaScript"
	src="<c:url value='/resources/js/raphael.min.js'/>"></script>
<script type="text/JavaScript"
	src="<c:url value='/resources/js/jquery-ui.js' />"></script>
<script type="text/JavaScript"
	src="<c:url value='/resources/js/loader.js' />"></script>
<script type="text/JavaScript"
	src="<c:url value='/resources/js/jsapi.js' />"></script>
<script type="text/JavaScript"
	src="<c:url value='/resources/js/Chart.min.js' />"></script>
<script type="text/JavaScript"
	src="<c:url value='/resources/js/select2.min.js' />"></script>
<script
	src="<c:url value='/resources/vendor/datatables/jquery.dataTables.min.js' />"></script>
<script type="text/JavaScript"
	src="<c:url value='/resources/js/datatableresponsive.js' />"></script>
<script
	src="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.js' />"></script>
<script src="<c:url value='/resources/js/intlTelInput.min.js' />"></script>

<script
	src="<c:url value='/resources/js/dataTables.checkboxes.min.js' />"></script>

<script src="<c:url value='/resources/js/jquery.validate.min.js' />"></script>
<script src="<c:url value='/resources/js/wow.min.js' />"></script>
<script src="<c:url value='/resources/js/owl.carousel.js' />"></script>
<script src="<c:url value='/resources/js/jquery.mCustomScrollbar.min.js' />"></script>
<script src="<c:url value='/resources/js/slick.js' />"></script>
<script src="<c:url value='/resources/js/easyResponsiveTabs.js' />"></script>
<script src="<c:url value='/resources/js/gre.js' />"></script>
<script language="JavaScript">
  /**
    * Disable right-click of mouse, F12 key, and save key combinations on page
    * By Arthur Gareginyan (arthurgareginyan@gmail.com)
    * For full source code, visit https://mycyberuniverse.com
    */
  window.onload = function() {
    document.addEventListener("contextmenu", function(e){
      e.preventDefault();
    }, false);
    document.addEventListener("keydown", function(e) {
    //document.onkeydown = function(e) {
      // "I" key
      if (e.ctrlKey && e.shiftKey && e.keyCode == 73) {
        disabledEvent(e);
      }
      // "J" key
      if (e.ctrlKey && e.shiftKey && e.keyCode == 74) {
        disabledEvent(e);
      }
      // "S" key + macOS
      if (e.keyCode == 83 && (navigator.platform.match("Mac") ? e.metaKey : e.ctrlKey)) {
        disabledEvent(e);
      }
      // "U" key
      if (e.ctrlKey && e.keyCode == 85) {
        disabledEvent(e);
      }
      // "F12" key
      if (event.keyCode == 123) {
        disabledEvent(e);
      }
    }, false);
    function disabledEvent(e){
      if (e.stopPropagation){
        e.stopPropagation();
      } else if (window.event){
        window.event.cancelBubble = true;
      }
      e.preventDefault();
      return false;
    }
  };
</script>
<script>
    function logout() {
		$.ajax({
			type : "GET",
			url : "${pageContext.servletContext.contextPath}/login/sessionLogout",
			 dataType: "json",
			complete: function(data) {
			if(data.responseText == 'success'){
			
				window.location = "${pageContext.servletContext.contextPath}/";
			}
			}	
		});
	}
    
    function idealstate() {
		$.ajax({
			type : "GET",
			url : "${pageContext.servletContext.contextPath}/login/idleStatus",
			 dataType: "json",
			complete: function(data) {
			
			if(data.responseText == 'success'){
						}
			else{
				
				
			}
			}
			       
			
		});
	}
   
	 $('document').ready(function(){
		    message();
		    alertapplicant();
		    jobalert();
		    appalert();
		    alertcount();
		    messagecount();
		   
		    })
		   
		    function message(){
		    	$.ajax({
					type : "POST",
					url : "${pageContext.servletContext.contextPath}/user/getMessage",
				        dataType: "json",
				        complete: function(data) {
				           console.log(data);
				           var count =0;
				           for(var i=data.responseJSON.length -1; i >= 0; i--){ 
				        	  
				        	 if(data.responseJSON[i].status == 0){
				        		 count++;
				        	 }
				        	 
		      	  $("#topmsg").prepend('<hr><a class="dropdown-item" id="tmsg" href= "${pageContext.servletContext.contextPath}/user/showmessages/?id:'+data.responseJSON[i].userid+'" target="_blank" onclick="update('+data.responseJSON[i].message_id+')"><strong>'+data.responseJSON[i].Name+'</strong><span class="small float-right text-muted">'+data.responseJSON[i].created_at+'</span><br/><br/><div class="dropdown-message small"><p>'+data.responseJSON[i].message+'</p></div></a>');
				        	  
				           }
				          
				        }
		    	})
		    }
	 function update(data){
		 
		 $.ajax({
				type : "POST",
				url : "${pageContext.servletContext.contextPath}/user/msgstatus",
			        dataType: "json",
			        data:{message_id:data},
			        complete: function(data) {
			           console.log(data);
			          
			        }
				
	 })
	 }
 
	 function alertapplicant(){
		
		  $.ajax({
		   type : "POST",
		   url : "${pageContext.servletContext.contextPath}/user/getapplicantAlerts",
		          dataType: "json",
		          complete: function(data) {
		          
		            
		             for(var i=0; i < data.responseJSON.length; i++){
		            	
		              $("#alertmsg").prepend(
		              '<hr><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/user/alertapplicant?applicantid:'+data.responseJSON[i].ref_applicantid+'" target="_blank"  onclick="alertupdate('+data.responseJSON[i].alert_id+')"><span class="text-success"><strong>'+
		                    '<i class="fa fa-long-arrow-up fa-fw"></i>'+data.responseJSON[i].alert_type+'</strong>'+
		                '</span><span class="small float-right text-muted">'+data.responseJSON[i].created_at+'</span><br/><br/>'+
		                '<div class="dropdown-message small">'+data.responseJSON[i].Name+' created applicant</div>'+
		              '</a>');
		             }
		            
		             }
		  }) 
		 }
		 function jobalert(){
			
		  $.ajax({
		   type : "POST",
		   url : "${pageContext.servletContext.contextPath}/user/getjobAlerts",
		          dataType: "json",
		          complete: function(data) {
		             console.log(data);
		             for(var i=0; i< data.responseJSON.length; i++){
		            	
		            	
		              $("#alertmsg").prepend(
		              '<hr><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/user/alertjob?jobid:'+data.responseJSON[i].ref_jobid+'"target="_blank" onclick="alertupdate('+data.responseJSON[i].alert_id+')"><span class="text-success"><strong>'+
		                    '<i class="fa fa-long-arrow-up fa-fw"></i>'+data.responseJSON[i].alert_type+'</strong>'+
		                '</span><span class="small float-right text-muted">'+data.responseJSON[i].created_at+'</span><br/><br/>'+
		                '<div class="dropdown-message small">'+data.responseJSON[i].Name+' created job and assigned to you!</div>'+
		              '</a>');
		             }
		           
		             }
		  }) 
		 }
		 function appalert(){
			
		  $.ajax({
		   type : "POST",
		   url : "${pageContext.servletContext.contextPath}/user/getappAlerts",
		          dataType: "json",
		          complete: function(data) {
		             console.log(data);
		            
		             for(var i=0; i< data.responseJSON.length; i++){
		            	 
		              $("#alertmsg").prepend(
		              '<hr><a class="dropdown-item" href="${pageContext.servletContext.contextPath}/user/applicationsettings?app_id:'+data.responseJSON[i].ref_app_id+'" target="_blank" onclick="alertupdate('+data.responseJSON[i].alert_id+')"><span class="text-success"><strong>'+
		                    '<i class="fa fa-long-arrow-up fa-fw"></i>'+data.responseJSON[i].alert_type+'</strong>'+
		                '</span><span class="small float-right text-muted">'+data.responseJSON[i].created_at+'</span><br/><br/>'+
		                '<div class="dropdown-message small">'+data.responseJSON[i].Name+' created application!</div>'+
		              '</a>');
		             }
		              
		             }
		  }) 
		 }
 function alertupdate(data){
		 
		 $.ajax({
				type : "POST",
				url : "${pageContext.servletContext.contextPath}/user/alertStatus",
			        dataType: "json",
			        data:{alert_id:data},
			        complete: function(data) {
			           console.log(data);
			          
			        }
				
	 })
	 }
 function messagecount(){
	 $.ajax({
			type : "POST",
			url : "${pageContext.servletContext.contextPath}/user/totalMessages",
		    dataType: "json",
		    complete: function(data) {
		    console.log(data); 
		  		$('#msgcount1').text(data.responseJSON);
		  		$('#msgcount').text(data.responseJSON);
		        }		
 })
 }
 
 function alertcount(){
	 $.ajax({
			type : "POST",
			url : "${pageContext.servletContext.contextPath}/user/totalAlerts",
		    dataType: "json",
		    complete: function(data) {
		    console.log(data); 
		  			$('#alertcount').text(data.responseJSON);
		  			$('#alertcount1').text(data.responseJSON);
		        }		
 })
 }
 
 

 
 
setInterval(function(){
	 $("#alertmsg").empty();
	 $("#topmsg").empty();
	 $('#alertcount').text(" ");
     $('#alertcount1').text(" ");
    
	    message();
	    alertapplicant();
	    jobalert();
	    appalert();	
	    alertcount();
	    messagecount();
		 // this will run after every 5 seconds
	}, 5000);
 !function(n){"use strict";n.fn.idle=function(e){var t,i,o={idle:6e4,events:"mousemove keydown mousedown touchstart",onIdle:function(){},onActive:function(){},onHide:function(){},onShow:function(){},keepTracking:!0,startAtIdle:!1,recurIdleCall:!1},c=e.startAtIdle||!1,d=!e.startAtIdle||!0,l=n.extend({},o,e),u=null;return n(this).on("idle:stop",{},function(){n(this).off(l.events),l.keepTracking=!1,t(u,l)}),t=function(n,e){return c&&(e.onActive.call(),c=!1),clearTimeout(n),e.keepTracking?i(e):void 0},i=function(n){var e,t=n.recurIdleCall?setInterval:setTimeout;return e=t(function(){c=!0,n.onIdle.call()},n.idle)},this.each(function(){u=i(l),n(this).on(l.events,function(){u=t(u,l)}),(l.onShow||l.onHide)&&n(document).on("visibilitychange webkitvisibilitychange mozvisibilitychange msvisibilitychange",function(){document.hidden||document.webkitHidden||document.mozHidden||document.msHidden?d&&(d=!1,l.onHide.call()):d||(d=!0,l.onShow.call())})})}}(jQuery);

//<-- THIS IS THE JS SOURCE CODE OF Jquery.Idle --------

$(document).idle({
onIdle: function(){
	idealstate();
},
idle: 120000
})


 

</script>


<script >
    window.history.forward(); 
    

    $(".job-carousel").slick({
    // normal options... 
    infinite: true,
    centerMode: true,
    arrows:true,
    slidesToShow: 3,
    // the magic 
    responsive: [{
        breakpoint: 1024,
        settings: {
          slidesToShow: 2,
          infinite: true
        }
      },
      {
        breakpoint: 800,
        settings: {
          slidesToShow: 2,
          dots: true
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 1,
          dots: true
        }
      }, {
        breakpoint: 300,
        settings: "unslick" // destroys slick 
      }]
  });
    

  new WOW().init();
  $("#clients-carousel").owlCarousel({
      items : 6,
      lazyLoad : true,
      navigation : true,
      autoPlay: 3000, //Set AutoPlay to 3 seconds
      itemsDesktop : [1199,5],
      itemsDesktopSmall : [979,4],
      itemsTablet: [768,3],
      temsMobile : [479,2],
  });
	
	$("#industry-carousel").owlCarousel({
      items : 6,
      lazyLoad : true,
      navigation : true,
      autoPlay: 3000, //Set AutoPlay to 3 seconds
      itemsDesktop : [1199,5],
      itemsDesktopSmall : [979,4],
      itemsTablet: [768,3],
      temsMobile : [479,2],
  });
	
	$("#varticals-carousel").owlCarousel({
      items : 1,
      lazyLoad : true,
      navigation : true,
      autoPlay: 4000, //Set AutoPlay to 3 seconds
      itemsDesktop : [1199,1],
      itemsDesktopSmall : [979,1],
      itemsTablet: [768,1],
      temsMobile : [479,1],
  });
  
  $('#innertab').easyResponsiveTabs({
      type: 'default', //Types: default, vertical, accordion
      width: 'auto', //auto or any width like 600px
      fit: true, //100% fit in a container
      tabidentify: 'hor_1', //The tab groups identifier
      activate: function(event) { //Callback function if tab is switched
          var $tab = $(this);
          var $info = $('#nested-tabInfo');
          var $name = $('span', $info);
          $name.text($tab.text());
          $info.show();
      }
  });
  

  
  $(function () {
	var byRow = $('body');
	$('.heig-wrap').each(function() {
		$(this).children('.heig-box').matchHeight({
			byRow: byRow
		});
	});
  });
  
  
 /* $('.popup-with-zoom-anim').magnificPopup({
      type: 'inline',
      fixedContentPos: false,
      fixedBgPos: true,
      overflowY: 'auto',
      closeBtnInside: true,
      preloader: false,
      midClick: true,
      removalDelay: 300,
      mainClass: 'my-mfp-zoom-in'
  });*/
	
	$('.mobnav').click(function(){
		$('.hdr-nav').stop(true, true).slideToggle();
	});
	

	$('#nav-icon1').click(function(){
		$(this).stop(true, true).toggleClass('open');
	});
	
	var url = window.location.href;
	$('nav li a[href="'+url+'"]').addClass('nav-active');
	$('.tab-nav li a[href="'+url+'"]').addClass('activenav');

	
	


var quotator = (function() {
return {
  init: function(selector, state, speed) {
    var quotes = document.querySelectorAll(selector),
      state = replaceString(state),
      cycle_speed = speed;

    if (quotes.length !== 'undefined') {
      quotes[0].classList.add(state);

      setInterval(function() {
        cycle(quotes, state);
      }, cycle_speed);
    }

    function replaceString(txt) {
      return txt.toString().replace('.', '');
    }

    function cycle(selector, state) {
      var state = '.' + state,
        current = document.querySelectorAll(state),
        next = current[0].nextElementSibling;

      state = replaceString(state);

      if (!next) {
        current[0].classList.remove(state);
        selector[0].classList.add(state);
      } else {
        current[0].classList.remove(state);
        next.classList.add(state);
      }
    }
  }
};
})();

quotator.init('.quote', '.js-current', 9000);

</script>
 
