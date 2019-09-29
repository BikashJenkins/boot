<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96"
	href="<c:url value='/resources/images/favicon.png' />">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>HULKATS</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


<link href="<c:url value='/resources/css/styles.css' />"
	rel="stylesheet">
<link
	href="<c:url value='/resources/css/simple-line-icons.css' />	"
rel="stylesheet">
	<style>
	.hulklogic {
   
    font-size: 18px;
    font-weight: bold;
}
	
	</style>
</head>
<body>
	<div class="page-wrapper flex-row align-items-center">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-5">
					<div class="card p-4">
						<div
							style="display: table-cell; vertical-align: middle; text-align: center">
							<img src="<c:url value='/resources/images/HulkATS_logo.png'/>"
								style="width: 200px;" />
						</div>
						<div
							class="card-header text-center text-uppercase h4 font-weight-light">
							<b>LOG IN</b></div>
						<form name="registration" id='registration'
							action="../j_spring_security_check" method='POST'>
							<span
								style="color: red; vertical-align: middle; text-align: center">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
							</span> <span id="reauth-email" class="reauth-email"></span>
							<div class="card-body py-5">
								<div class="form-group">
									<label class="form-control-label">Email</label> <input
										type="email" class="form-control" name="j_username"
										id="username">
								</div>

								<div class="form-group">
									<label class="form-control-label">Password</label> <input
										type="password" class="form-control" name="j_password"
										id="password">
								</div>
								 <label class="checkbox">
                    <input type="checkbox" value="remember-me" id="remember_me"> Remember me
                </label>
							</div>
							

							<div class="card-footer">
								<div class="row">
									<div class="col-sm-4">
									<button type="submit" class="btn btn-primary px-5">Login</button>
										
									</div>

									<div class="col-sm-4">
										<a
											href="${pageContext.servletContext.contextPath}/login/forgetpwd"
											class="btn btn-link">Forgot password?</a>
									</div>
									<div class="col-sm-4">
										<a
											href="${pageContext.servletContext.contextPath}/login/registration"
											class="btn btn-link">Register</a>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="hulklogic text-center text-uppercase">
							<a href="https://www.hulklogic.com/" target="_blank">HULKLOGIC TECHNOLOGIES</a></div>
							<div class="externalLinks text-center" >
			<a href="" target="_blank" style="margin-right: 10px; text-decoration: none;">
				<span class="text-12 color-lightgrey">Help</span>
			</a>
			<a href="" target="_blank" style="margin-right: 10px; text-decoration: none;">
				<span class="text-12 color-lightgrey">Privacy</span>
			</a>
			<a href="" target="_blank" style="text-decoration: none;">
				<span class="text-12 color-lightgrey">Terms</span>
			</a>
		</div>
					
				</div>
			</div>
		</div>
		
	</div> 
	
	
	<script src="<c:url value='/resources/js/jquery.js' />"
		type="text/javascript"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"
		type="text/javascript"></script>
	<script src="<c:url value='/resources/js/demo.js' />"
		type="text/javascript"></script>
	
 <script>
            $(function() {
 
                if (localStorage.chkbx && localStorage.chkbx != '') {
                    $('#remember_me').attr('checked', 'checked');
                    $('#username').val(localStorage.usrname);
                    $('#password').val(localStorage.pass);
                } else {
                    $('#remember_me').removeAttr('checked');
                    $('#username').val('');
                    $('#password').val('');
                }
 
                $('#remember_me').click(function() {
 
                    if ($('#remember_me').is(':checked')) {
                        // save username and password
                        localStorage.usrname = $('#username').val();
                        localStorage.pass = $('#password').val();
                        localStorage.chkbx = $('#remember_me').val();
                    } else {
                        localStorage.usrname = '';
                        localStorage.pass = '';
                        localStorage.chkbx = '';
                    }
                });
            });
 
        </script>

</body>
</html>
