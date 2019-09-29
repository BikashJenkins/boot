<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!doctype html>
<html lang="en">
<!-- /container -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta charset="utf-8" />

<link rel="icon" type="image/png" sizes="96x96"
	href="../images/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>HULKATS</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<link href="./resources/assets/css/styles.css" rel="stylesheet">
<link href="./resources/assets/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
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
							<img src="./resources/images/HulkATS_logo.png" width="180" />
						</div>
						<div
							class="card-header text-center text-uppercase h4 font-weight-light">
							<b>LOG IN</b>
						</div>
						<div class="form-group" style="text-align: center">
							<h5>
								<span id='success' style="color: green;"></span> <span
									id='error'
									style="color: red; margin-left: auto; margin-right: auto;"></span>
							</h5>
						</div>
						<form method="POST" action="${contextPath}/login"
							class="form-signin">
							<span
								style="color: red; vertical-align: middle; text-align: center">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
							</span>
							<div class="card-body py-5">

								<div class="form-group">
									<label class="form-control-label">Email</label> <input
										type="email" class="form-control" name="username"
										id="username">
								</div>

								<div class="form-group">
									<label class="form-control-label">Password</label> <input
										type="password" class="form-control" name="password"
										id="password">
								</div>

								<div class="form-group">
									<label class="checkbox"> <input type="checkbox"
										value="remember-me" id="remember_me"> Remember me
									</label>
								</div>
							</div>

							<div class="card-footer">
								<div class="row">
									<div class="col-6">
										<button type="submit" class="btn btn-primary px-5">Login</button>
										<!-- <input type="button" id="loginbutton" class="btn btn-primary px-5"  onclick="login()" value="Login">-->
									</div>

									<div class="col-6">
										<a
											href="${pageContext.servletContext.contextPath}/login/forgetpwd"
											class="btn btn-link">Forgot password?</a>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="hulklogic text-center text-uppercase">
						<a href="https://www.hulklogic.com/" target="_blank">HULKLOGIC
							TECHNOLOGIES</a>
					</div>
					<div class="externalLinks text-center">
						<a href="" target="_blank"
							style="margin-right: 10px; text-decoration: none;"> <span
							class="text-12 color-lightgrey">Help</span>
						</a> <a href="" target="_blank"
							style="margin-right: 10px; text-decoration: none;"> <span
							class="text-12 color-lightgrey">Privacy</span>
						</a> <a href="" target="_blank" style="text-decoration: none;"> <span
							class="text-12 color-lightgrey">Terms</span>
						</a>
					</div>

				</div>
			</div>
		</div>

	</div>
	<script src="./resources/assets/js/jquery.js" type="text/javascript"></script>
	<script src="./resources/assets/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="./resources/assets/js/demo.js" type="text/javascript"></script>
	<script src="./resources/tempjs/config.js" type="text/javascript"></script>
	<script>
		var url;
		$(document).ready(function() {
			if (gOptions.enabled) {
				url = gOptions.url;

			}
		})

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

		var input = document.getElementById('password');
		input.addEventListener("keyup", function(event) {
			event.preventDefault();
			if (event.keyCode === 13) {
				login();
			}
		});

		var input1 = document.getElementById('username');
		input1.addEventListener("keyup", function(event) {
			event.preventDefault();
			if (event.keyCode === 13) {
				login();
			}
		});
	</script>


</body>
</html>
