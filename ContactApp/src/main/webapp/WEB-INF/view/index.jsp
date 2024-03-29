<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>Contact App | Login</title>
<link href="/static/css/bootstrap.min.css" rel="stylesheet">
<link href="/static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<jsp:include page="include/menu.jsp" />

	<!-- Login User Form Start -->
	<div class="container text-center">
		<h3>User Login</h3>
		<hr>
		<form class="form-horizontal" method="POST" action="/login">
			<!-- ERROR LOGIN START -->
			<c:if test="${not empty error }">
				<div class="alert alert-danger">
					<c:out value="${error }"></c:out>
				</div>
			</c:if>
			<!-- ERROR LOGIN END -->
			
			<!-- Successful Logout Start -->
			<c:if test="${param.action eq 'logout' }">
				<div class="alert alert-success">
					<c:out value="Logout Successfully! Thanks for using Contact Application."></c:out>
				</div>
			</c:if>
			<!-- Successful Logout End -->
			
			<!-- Successful Registration Start -->
			<c:if test="${param.action eq 'reg' }">
				<div class="alert alert-success">
					<c:out value="User Registered Successfully! Please Log in."></c:out>
				</div>
			</c:if>
			<!-- Successful Registration End -->
			
			<div class="form-group">
				<label class="control-label col-md-3">Username</label>
				<div class="col-md-7">
					<input type="text" class="form-control" name="loginName"
						placeholder="Username" value="${user.loginName }" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-3">Password</label>
				<div class="col-md-7">
					<input type="password" class="form-control" name="password"
						placeholder="Password" value="${user.password }" />
				</div>
			</div>
			<div class="form-group ">
				<input type="submit" class="btn btn-primary" value="Login" />
			</div>
		</form>
	</div>
	<!-- Login User Form End -->


	<p align="center" class="mt-5 mb-3 text-muted">&copy; 2017-2019</p>

	<!-- END SECTION -->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/static/js/jquery-1.11.1.min.js"></script>
	<script src="/static/js/bootstrap.min.js"></script>
</body>

</html>