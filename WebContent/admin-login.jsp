<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Smart City || Admin Login</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border text-primary"
			style="width: 3rem; height: 3rem;" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<!-- Spinner End -->


	<!-- Navbar Start -->
	<%@ include file="header.jsp"%>
	<!-- Navbar End -->


	<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h1 class="display-3 text-white animated slideInDown">Admin
						Login</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->


	<!-- 404 Start -->

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<img src="img/admin-login.jpg" style="width: 550px; height: 400px;"></img>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="panel panel-primary shadow p-3 mb-5">
					<div class="panel-heading text-center">Admin Login</div>
					<div class="panel-body">
						<%
							String credential = (String) session.getAttribute("credential");
							if (credential != null) {
								session.removeAttribute("credential");
						%>
						<div class="alert alert-danger" id="danger">You have enter
							wrong credentials.</div>
						<%
							}
						%>
						<%
							String captchaCode = (String) session.getAttribute("verificationCode");
							if (captchaCode != null) {
								session.removeAttribute("verificationCode");
						%>
						<div class="alert alert-info" id="info">You have enter wrong
							verification code.</div>
						<%
							}
						%>
						<form action="AdminLogin" method="post">
							<div class="row g-3">
								<div class="col-md-12">
									<label for="uname">User Name:</label> <input type="text"
										class="form-control" id="uname" placeholder="Enter username"
										name="uname" required
										onkeypress="return lettersValidate(event)">
								</div>
								<div class="col-md-12">
									<label for="upass">Password:</label> <input type="password"
										class="form-control" id="upass" placeholder="Enter password"
										name="upass" required oninput="limitChar(this)" maxlength="12">
								</div>
								<%
									String captcha = null;
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select captcha from tblcaptcha");
									if (resultset.next()) {
										captcha = resultset.getString(1);
									}
								%>
								<div class="col-md-12">
									<label for="vercode">Verification Code:</label> <input
										type="text" class="form-control" id="vercode"
										placeholder="Enter captcha code here" name="vercode" required>
								</div>
								<br>
								<div class="col-md-12">
									<input type="text" class="form-control" id="" name="captcha"
										value="<%=captcha%>" readonly>
								</div>
								<div class="col-md-12">
									<input type="submit" value="Login" class="btn btn-warning">
									<input type="reset" class="btn btn-danger" value="Cancel">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 404 End -->


	<!-- Footer Start -->
	<%@ include file="footer.jsp"%>
	<!-- Footer End -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>

</html>