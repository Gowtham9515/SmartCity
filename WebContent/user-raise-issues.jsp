<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Smart City || Raise Issue</title>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

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

	<!-- 404 Start -->
	<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
		<div class="container">
			<div class="row">
				<%
					String issueMessage = (String) session.getAttribute("issue");
					if (issueMessage != null) {
						session.removeAttribute("issue");
				%>
				<div class="alert alert-info" id="info">Issue submitted successfully.</div>
				<%
					}
				%>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<image src="img/raise-issue.png" style="width:300px;height:290px;">
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<div class="panel panel-warning shadow p-3 mb-5">
						<div class="panel-heading text-center">Raise Issue</div>
						<div class="panel-body">
							<form role="form" action="RaiseIssues" method="post" name=''>
								<div class="row g-3">
									<div class="col-md-12">
										<label for="uname">User Name</label> <input type="text"
											class="form-control" id="uname" name="uname"
											value="<%=session.getAttribute("fullName") %>" readonly>
									</div>
									<div class="col-md-12">
										<label for="issueSubject">Subject</label> <input type="text"
											class="form-control" id="issueSubject" name="issueSubject"
											placeholder="Issue Subject" required>
									</div>
									<div class="col-md-12">
										<label for="feedback">Description</label>
										<textarea class="form-control" id="description" name="description"
											placeholder="Description" required></textarea>
									</div>
									<div class="col-md-12">
										<button type="submit" class="btn btn-info" id="btnValidate">Submit
											Issue</button>
										<button type="reset" class="btn btn-danger" id="btnValidate">Cancel</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 404 End -->


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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>


	<!-- Template Javascript -->
	<script src="js/main.js"></script>
	<script src="js/retina.js"></script>
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