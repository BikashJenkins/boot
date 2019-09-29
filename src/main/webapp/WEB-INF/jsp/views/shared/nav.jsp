<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" href="#" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="96x96"
	href="<c:url value='/resources/images/favicon.png' />">
<title>HULKATS</title>

<!-- Bootstrap core CSS-->
<link
	href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link
	href="<c:url value='/resources/vendor/font-awesome/css/font-awesome.min.css' />"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link
	href="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.css' />"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/css/rowrecorder.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/css/responsive.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/css/jquery-ui.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/css/jquery-ui.min.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/css/select2.css' />"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/select2.min.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/css/sample.css' />"
	rel="stylesheet">

<link
	href="<c:url value='/resources/css/dataTables.bootstrap.min.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/css/dataTables.checkboxes.css' />"
	rel="stylesheet">
	<link href="<c:url value='/resources/css/intlTelInput.css' />"
	rel="stylesheet">
	<link href="<c:url value='/resources/css/mCustomScrollbar.css' />"
	rel="stylesheet">
	<link href="<c:url value='/resources/css/gre.css' />"
	rel="stylesheet">

<style>



/* 
*  Owl Carousel - Animate Plugin
*/
.owl-carousel .owl-wrapper:after {content: ".";display: block;clear: both;visibility: hidden;line-height: 0;height: 0;}
.owl-carousel{display: none;position: relative;width: 100%;-ms-touch-action: pan-y;}
.owl-carousel .owl-wrapper{display: none;position: relative;-webkit-transform: translate3d(0px, 0px, 0px);}
.owl-carousel .owl-wrapper-outer{overflow: hidden;position: relative;width: 100%;z-index:2;}
.owl-carousel .owl-wrapper-outer.autoHeight{-webkit-transition: height 500ms ease-in-out;-moz-transition: height 500ms ease-in-out;-ms-transition: height 500ms ease-in-out;-o-transition: height 500ms ease-in-out;transition: height 500ms ease-in-out;}
.owl-carousel .owl-item{float: left;}
.owl-controls .owl-page,
.owl-controls .owl-buttons div{cursor: pointer;}
.owl-controls {-webkit-user-select: none;-khtml-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);}
.grabbing { cursor:url(grabbing.png) 8 8, move;}
.owl-carousel  .owl-wrapper,
.owl-carousel  .owl-item{-webkit-backface-visibility: hidden;-moz-backface-visibility:    hidden;-ms-backface-visibility:     hidden;-webkit-transform: translate3d(0,0,0);-moz-transform: translate3d(0,0,0);-ms-transform: translate3d(0,0,0);}


.ui-autocomplete {
	z-index: 5000;
}


form .error {
	color: #ff0000;
}

#save, #save img {
	height: 5vh;
}

#save {
	opacity: 0.25;
}

#save[download] {
	opacity: 1;
}

#controls {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	height: 20%;
	width: 100%;
}

#arrow, #arrow img {
	height: 5vh;
}

#arrow[download] {
	opacity: 1;
}

<
style>.flot-chart {
	display: block;
	height: 400px;
}

label.disabled {
	color: #FFFFFF;
}

.flot-chart-content {
	width: 100%;
	height: 100%;
}

/* Custom Colored Panels */
.huge {
	font-size: 40px;
}

.panel-green {
	border-color: #5cb85c;
}

.panel-green>.panel-heading {
	border-color: #5cb85c;
	color: #fff;
	background-color: #5cb85c;
}

.panel-green>a {
	color: #5cb85c;
}

.panel-green>a:hover {
	color: #3d8b3d;
}

.panel-red {
	border-color: #d9534f;
}

.panel-red>.panel-heading {
	border-color: #d9534f;
	color: #fff;
	background-color: #d9534f;
}

.panel-red>a {
	color: #d9534f;
}

.panel-red>a:hover {
	color: #b52b27;
}

.panel-yellow {
	border-color: #f0ad4e;
}

.panel-yellow>.panel-heading {
	border-color: #f0ad4e;
	color: #fff;
	background-color: #f0ad4e;
}

.panel-yellow>a {
	color: #f0ad4e;
}

.panel-yellow>a:hover {
	color: #df8a13;
}
@-webkit-keyframes spinnerRotate
{
    from{-webkit-transform:rotate(0deg);}
    to{-webkit-transform:rotate(360deg);}
}
@-moz-keyframes spinnerRotate
{
    from{-moz-transform:rotate(0deg);}
    to{-moz-transform:rotate(360deg);}
}
@-ms-keyframes spinnerRotate
{
    from{-ms-transform:rotate(0deg);}
    to{-ms-transform:rotate(360deg);}
}
#spin{
 display:inline;
 margin-top:-8px;
 margin-left:-14px;
    -webkit-animation-name: spinnerRotate;
    -webkit-animation-duration: 5s;
    -webkit-animation-iteration-count: infinite;
    -webkit-animation-timing-function: linear;
    -moz-animation-name: spinnerRotate;
    -moz-animation-duration: 5s;
    -moz-animation-iteration-count: infinite;
    -moz-animation-timing-function: linear;
    -ms-animation-name: spinnerRotate;
    -ms-animation-duration: 5s;
    -ms-animation-iteration-count: infinite;
    -ms-animation-timing-function: linear;
}
@media screen and (max-width: 600px) {
  #issues {
    visibility: hidden;
    clear: both;
    float: left;
    margin: 10px auto 5px 20px;
    width: 28%;
    display: none;
  }
  #copyright {
    visibility: hidden;
    clear: both;
    float: left;
    margin: 10px auto 5px 20px;
    width: 28%;
    display: none;
  }
  
}
@media (min-width: 768px) {
.navbar-top-links {
  margin-right: 0;
}
.navbar-top-links li {
  display: inline-block;
}
.navbar-top-links li:last-child {
  margin-right: 15px;
}
.navbar-top-links li a {
  padding: 15px;
  min-height: 50px;
}
.navbar-top-links .dropdown-menu li {
  display: block;
}
.navbar-top-links .dropdown-menu li:last-child {
  margin-right: 0;
}
.navbar-top-links .dropdown-menu li a {
  padding: 3px 20px;
  min-height: 0;
}
.navbar-top-links .dropdown-menu li a div {
  white-space: normal;
}
}

@media (min-width: 768px) {
  .navbar-nav .dropdown,
  .navbar-nav .dropdown,
  .navbar-nav .dropdown {
    margin-left: auto;
  }
}
 /*#alertcount1, #msgcount1 {
   font-size: 15px;
    font-weight: bold;
    color: #FFF;
    background: #007bff;
    line-height: 12px;
    width: 22px;
    height: 22px;
     border-radius: 50%;
    -webkit-border-radius: 2em;
    -moz-border-radius: 2em;
    -o-border-radius: 2em;
    text-align: center;
    display: inline-block;
    position: absolute;
    top: -5px;
    right: -23px;
    padding: 4px 0 0;
     text-align: center;  
}*/

#alertcount1, #msgcount1{
   	font-style: normal;
    font-size: 11px;
    margin-right: -7px;
    margin-top: -10px;
    padding: 5px 0px;
    border-radius: 50%;
    height: 20px;
    width: 20px;
    }

#msgcount1  {
 background:#007bff;
 }
 
 #alertcount1{
 background:#ffc107;
 }
 

@media screen and (max-width: 768px){
#alertcount1,#msgcount1 {
 visibility: hidden;
}

}
@media screen and (max-width: 768px){
.dropdown-toggle::after {
    display: inline-block;
    width: 0;
    height: 0;
    margin-left: 46.255em;
    vertical-align: .255em;
    content: "";
    border-top: .3em solid;
    border-right: .3em solid transparent;
    border-left: .3em solid transparent;
}
}

 #down {
      float: left;
      position: relative;
      left: 80%;
    }
   #up {
      float: left;
      position: relative;
      left: 80%;
    }
</style>

</head>

<body class="fixed-nav sticky-footer bg-light " id="page-top" oncontextmenu="return false;">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light" id="mainNav">
	<sec:authorize access="hasRole('ROLE_MANAGER')">
		<a class="navbar-brand"
			href="${pageContext.servletContext.contextPath}/manager/managerdashboard">
			<img src="<c:url value='/resources/images/HulkATS_logo.png'/>"
								style="width: 170px;" /></a>
			 </sec:authorize>
			  <sec:authorize access="hasRole('ROLE_RECRUITER')">
			<a class="navbar-brand"
			href="${pageContext.servletContext.contextPath}/recruiter/recruiterdashboard"><img src="<c:url value='/resources/images/HulkATS_logo.png'/>"
								style="width: 170px;" /></a>
			 </sec:authorize>
			  <sec:authorize access="hasRole('ROLE_ADMIN')">
			<a class="navbar-brand"
			href="${pageContext.servletContext.contextPath}/admin/dashboard"><img src="<c:url value='/resources/images/HulkATS_logo.png'/>"
								style="width: 170px;" /></a>
			 </sec:authorize>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion" 
			>
			<sec:authorize access="hasRole('ROLE_MANAGER')">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard">
					<a class="nav-link" href="${pageContext.servletContext.contextPath}/manager/managerdashboard">
                          <i class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text"><b>Dashboard</b></span>
				     </a></li>
				 </sec:authorize>	
				 <sec:authorize access="hasRole('ROLE_RECRUITER')">
				 <li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard">
					<a class="nav-link" href="${pageContext.servletContext.contextPath}/recruiter/recruiterdashboard">
                          <i class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text"><b>Dashboard</b></span>
				     </a></li>    
				 </sec:authorize>	
				  <sec:authorize access="hasRole('ROLE_ADMIN')">
				 <li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard">
					<a class="nav-link" href="${pageContext.servletContext.contextPath}/admin/dashboard">
                          <i class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text"><b>Dashboard</b></span>
				     </a></li>    
				 </sec:authorize>	

                <sec:authorize access="hasRole('ROLE_MANAGER')">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Registartion"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseComponents" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa fa-user"></i> <span class="nav-link-text"><b>Registration</b></span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseComponents">
						<li><a
							href="${pageContext.servletContext.contextPath}/manager/register"><b>New
								Account</b></a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/manager/users"><b>View
								Accounts</b></a></li>
					</ul></li>
					 </sec:authorize>	
					
					
					<sec:authorize access="hasRole('ROLE_RECRUITER')">
					<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Teams"><a
					class="nav-link" 
					href="${pageContext.servletContext.contextPath}/recruiter/teams"> <i
						class="fa fa-fw fa fa-user"></i> <span class="nav-link-text"><b>Team</b></span>
				     </a>
					
					</li>
					 </sec:authorize>
					 <sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Teams"><a
					class="nav-link" 
					href="${pageContext.servletContext.contextPath}/admin/registration"> <i
						class="fa fa-fw fa fa-user"></i> <span class="nav-link-text"><b>Registration</b></span>
				     </a>
					
					</li>
					 </sec:authorize>
					 <sec:authorize access="hasRole('ROLE_MANAGER')">
					 <li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Job"><a class="nav-link nav-link-collapse collapsed"
					data-toggle="collapse" href="#collapseComponents2"
					data-parent="#exampleAccordion"> <i class="fa fa-fw fa-link"></i>
						<span class="nav-link-text"><b>Job</b></span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseComponents2">
						<li><a class='ref99'
							href="${pageContext.servletContext.contextPath}/user/jobcreation"><b>Add
								New</b></a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/manager/joblist"><strong>View
								Jobs</strong></a></li>
					</ul></li>
					 </sec:authorize>	
					<sec:authorize access="hasRole('ROLE_RECRUITER')">
					 <li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Job"><a class="nav-link nav-link-collapse collapsed"
					data-toggle="collapse" href="#collapseComponents2"
					data-parent="#exampleAccordion"> <i class="fa fa-fw fa-link"></i>
						<span class="nav-link-text"><b>Job</b></span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseComponents2">
						<li><a
							href="${pageContext.servletContext.contextPath}/user/jobcreation"><b>Add
								New</b></a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/recruiter/jobview"><b>View</b>
								Jobs</a></li>
					</ul></li>
					 </sec:authorize>		
				  

				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Applicant"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseComponents3" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa fa-user"></i> <span class="nav-link-text"><b>Applicant</b></span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseComponents3">
						<li><a
							href="${pageContext.servletContext.contextPath}/user/applicants"><b>Add
								New</b></a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/user/applicantslist"><b>View
								Applicants</b></a></li>
					</ul></li>
					<sec:authorize access="hasRole('ROLE_MANAGER')">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Application"><a class="nav-link"
					href="${pageContext.servletContext.contextPath}/manager/applications">
						<i class="fa fa-fw fa fa-file-text-o"></i> <span
						class="nav-link-text"><b>Application Overview</b></span>
				</a></li>
				 </sec:authorize>	
				 <sec:authorize access="hasRole('ROLE_RECRUITER')">
				 <li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Application"><a class="nav-link"
					href="${pageContext.servletContext.contextPath}/recruiter/application">
						<i class="fa fa-fw fa fa-file-text-o"></i> <span
						class="nav-link-text"><b>Application Overview</b></span>
				</a></li>   
				 </sec:authorize>	
				


				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Template"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseComponents5" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa fa-list-alt"></i> <span class="nav-link-text"><b>Email
							Templates</b></span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseComponents5">
						<li><a
							href="${pageContext.servletContext.contextPath}/user/template"><b>Add
								New</b></a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/user/templateview"><b>View
								Templates</b></a></li>

					</ul></li>
			</ul>
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>
			
			  <ul class="navbar-nav ml-auto">
			 <li class="nav-item dropdown">
          	<a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" data-placement="right" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-envelope"></i>
            <span class="d-lg-none">Messages
              <span class="badge badge-pill badge-primary" id="msgcount"></span>
            </span>
            <span class="indicator text-primary d-none d-lg-block">
              <i ><span class='badge badge-info float-left' id="msgcount1"></span></i>
            </span>
          </a>
          <div class="dropdown-menu dropdown-menu-right"  aria-labelledby="messagesDropdown">
            <h6 class="dropdown-header">New Messages:</h6>
            
		<div id="topmsg"></div>
            <div>
	<hr>	
         <a class="dropdown-item small" href="${pageContext.servletContext.contextPath}/user/allmessages" target='_blank'>View all messages</a>
		</div>		
          </div>
         
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-sm-1" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-bell"></i>
            <span class="d-lg-none">Alerts
              <span class="badge badge-info badge-warning" id="alertcount"></span>
            </span>
           
            <span class="indicator text-warning d-none d-sm-block">
              <i ><span class="badge badge-info float-left" id="alertcount1"></span></i>
            </span>
          </a>
          <div class="dropdown-menu dropdown-menu-right"  aria-labelledby="alertsDropdown">
          <h6 class="dropdown-header">New Alerts:</h6>
	
          <div id="alertmsg">
          
          
          </div>
	<div><hr>
	 <a class="dropdown-item small" href="${pageContext.servletContext.contextPath}/user/alerts" target='_blank'>View all alerts</a>
          </div></div>
        </li>
        
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown"
					href="#" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-fw fa-user"></i> <span
						class="d-lg-none">Account Details </span>
				</a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
						
						<a class="dropdown-item"
							href="${pageContext.servletContext.contextPath}/user/editdetails">
							<i class="fa fa-user fa-fw"></i>Profile </a> <a class="dropdown-item"
							href="${pageContext.servletContext.contextPath}/user/changePassword">
							<i class="fa fa-unlock fa-fw"></i>Change Password </a> 
							
							<sec:authorize access="hasRole('ROLE_MANAGER')">
							<a class="dropdown-item" href="${pageContext.servletContext.contextPath}/manager/settings">
							<i class="fa fa-gear fa-fw"></i>Settings </a> 
							</sec:authorize>	
							
							<sec:authorize access="hasRole('ROLE_RECRUITER')">
							<a class="dropdown-item" href="${pageContext.servletContext.contextPath}/recruiter/rssettings">
							<i class="fa fa-gear fa-fw"></i>Settings </a> 
						   </sec:authorize>	
							
					</div></li>
					<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#exampleModal"> <i class="fa fa-fw fa-sign-out"></i><b>Logout</b>
				</a></li>
			</ul> 
			</div>	
	</nav>
	
