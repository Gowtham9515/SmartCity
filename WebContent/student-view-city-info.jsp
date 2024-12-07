<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Smart City || View Cities</title>
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
	<%@ include file="student-side-header.jsp"%>
	<!-- Navbar End -->

	<!-- Contact Start -->
	<div class="container-xxl py-5">
		<div class="container-fluids">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">
						<strong>View All Cities</strong>
					</h4>
				</div>
			</div>
			<div class="panel panel-warning shadow p-3 mb-5">
				<div class="panel-body">
					<form action="student-view-city-info.jsp" method="post">
						<div class="row g-3">
							<div class="col-md-10">
								<input type='text' class="form-control" id="city" name="city"
									placeholder="City Name">
							</div>
							<div class="col-md-2">
								<input type="submit" class="btn btn-primary" value="Search City">
							</div>
						</div>
					</form>
					<br>
					<table class="table table-bordered">
						<tr>
							<th>#</th>
							<th>City Name</th>
							<th>Area (Square Kilometers)</th>
							<th>Population</th>
							<th>Description</th>
							<th>Added At</th>
						</tr>
						<%
							String city = request.getParameter("city");
							if (city != null) {
								ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from tblcityinfo where city_name like '%" + city + "%'");
								if (rs.next()) {
						%>
						<tr>
							<td><%=rs.getInt("city_id")%></td>
							<td><font color="blue"><%=rs.getString("city_name")%></font></td>
							<td><%=rs.getDouble("area")%></td>
							<td><font color="green"><%=rs.getInt("population")%></font></td>
							<td><%=rs.getString("description")%></td>
							<td><%=rs.getString("created_at")%></td>
						</tr>
						<%
							}
						} else {
							ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcityinfo");
							while (resultset.next()) {
						%>
						<tr>
							<td><%=resultset.getInt("city_id")%></td>
							<td><font color="blue"><%=resultset.getString("city_name")%></font></td>
							<td><%=resultset.getDouble("area")%></td>
							<td><font color="green"><%=resultset.getInt("population")%></font></td>
							<td><%=resultset.getString("description")%></td>
							<td><%=resultset.getString("created_at")%></td>
						</tr>
						<%
							}
						}
						%>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact End -->

	<!-- Footer Start -->
	<%@ include file="student-side-footer.jsp"%>
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