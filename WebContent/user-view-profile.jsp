<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Smart City || View Profile</title>
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
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
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
	<%@ include file="user-side-header.jsp"%>
	<!-- Navbar End -->

	<!-- Contact Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">
						<strong>My Profile</strong>
					</h4>
				</div>
			</div>
			<div class="panel panel-info shadow p-3 mb-5">
				<div class="panel-heading text-center">View Profile</div><br>
				<div class="panel-body">
					<%
						String message = (String) session.getAttribute("profile-update");
						if (message != null) {
							session.removeAttribute("profile-update");
					%>
					<div class="alert alert-success" id="success">Profile updated
						successfully.</div>
					<%
						}
					%>
					<%
						ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbluser where uname='"+ session.getAttribute("uname") + "' and email='" + session.getAttribute("email") + "'");
						if (resultset.next()) {
					%>
					<form action="EditUserProfile" method="post">
						<div class="row g-3">
							<div class="col-md-6">
								<label for="userId">User Id:</label> <input type="text"
									class="form-control" id="userId" name="userId"
									value="<%=resultset.getInt("userId")%>" readonly>
							</div>
							<div class="col-md-6"">
								<label for="fullName">Full Name:</label> <input type="text"
									class="form-control" id="fullName" name="fullName"
									value="<%=resultset.getString("fullName")%>" required>
							</div>
							<div class="col-md-6">
								<label for="email">Email Id:</label> <input type="text"
									class="form-control" id="email" placeholder="Email Id"
									name="email" value="<%=resultset.getString("email")%>" readonly>
							</div>
							<div class="col-md-6">
								<label for="mobile">Mobile No:</label> <input type="text"
									class="form-control" id="mobile" placeholder="Mobile No"
									name="mobile" value="<%=resultset.getString("mobile")%>"
									required>
							</div>
							<div class="col-md-6">
								<label for="gender">Select Gender:</label> <select
									class="form-control" id="gender" name="gender">
									<option><%=resultset.getString("gender")%></option>
									<option>Male</option>
									<option>Female</option>
								</select>
							</div>
							<div class="col-md-6">
								<label for="address">Address:</label>
								<textarea class="form-control" id="address" name="address"
									value="" required><%=resultset.getString("address")%></textarea>
							</div>
							<div class="col-md-12">
								<input type="submit" value="Update Info" class="btn btn-primary">
								<input type="reset" class="btn btn-danger" value="Cancel">
							</div>
						</div>
					</form>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact End -->


	<!-- Footer Start -->
	<%@ include file="user-side-footer.jsp"%>
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
	<script type="text/javascript">
		$(function() {
			$('#success').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#danger').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#warning').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#info').delay(3000).show().fadeOut('slow');
		});
	</script>
	<%
		} else {
	response.sendRedirect("user-login.jsp");
	}
	%>
</body>
</html>