<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Smart City || View Issues</title>
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
	<%@ include file="admin-side-header.jsp"%>
	<!-- Navbar End -->

	<!-- Contact Start -->
	<div class="container-xxl py-5">
		<div class="container-fluids">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">
						<strong>View Users Issues</strong>
					</h4>
				</div>
			</div>
			<%
				String message=(String)session.getAttribute("issueReplied");
				if(message!=null){
					session.removeAttribute("issueReplied");
			%>
			<div class='alert alert-success' id="success">Issue replied successfully.</div>
			<%
				}
			%>
			<div class="panel panel-warning shadow p-3 mb-5">
				<div class="panel-body">
					<table class="table table-bordered">
						<tr>
							<th>#</th>
							<th>Full Name</th>
							<th>Subject</th>
							<th>Description</th>
							<th>Status</th>
							<th>Reported At</th>
							<th>Action</th>
						</tr>
						<%
							ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblissues");
							while (resultset.next()) {
						%>
						<tr>
							<td><%=resultset.getInt("issue_id")%></td>
							<td><%=resultset.getString("user_name")%></td>
							<td><%=resultset.getString("issue_subject")%></td>
							<td><%=resultset.getString("description")%></td>
							<td><%=resultset.getString("status")%></td>
							<td><%=resultset.getString("reported_date")%></td>
							<%
								if (resultset.getString("status").equals("Replied")) {
							%>
							<td>Replied</td>
							<%
								} else {
							%>
							<td><a href="admin-give-reply-to-user-issues.jsp?issueId=<%=resultset.getInt("issue_id")%>" class="btn btn-info">Reply</a></td>
							<%
								}
							%>
						</tr>
						<%
							}
						%>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact End -->

	<!-- Footer Start -->
	<%@ include file="admin-side-footer.jsp"%>
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
	response.sendRedirect("admin-login.jsp");
	}
	%>
</body>
</html>