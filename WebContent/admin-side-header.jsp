<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<nav
	class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
	<a href="index.jsp"
		class="navbar-brand d-flex align-items-center px-4 px-lg-5">
		<h2 class="m-0 text-primary">
			<i class="fa fa-city me-3"></i>Smart City
		</h2>
	</a>
	<button type="button" class="navbar-toggler me-4"
		data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarCollapse">
		<div class="navbar-nav ms-auto p-4 p-lg-0">
			<a href="admin-dashboard.jsp" class="nav-item nav-link">Home</a>
			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle active"
					data-bs-toggle="dropdown">Places</a>
				<div class="dropdown-menu fade-down m-0">
					<a href="admin-add-places.jsp" class="dropdown-item">Add Places</a>
					<a href="admin-view-place-details.jsp" class="dropdown-item">Place
						Details</a>
				</div>
			</div>
			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle active"
					data-bs-toggle="dropdown">Students</a>
				<div class="dropdown-menu fade-down m-0">
					<a href="admin-add-student-portal.jsp" class="dropdown-item">Add
						Student Details</a> <a href="admin-view-student-portal-details.jsp"
						class="dropdown-item">View Student Portal</a>
				</div>
			</div>
			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle active"
					data-bs-toggle="dropdown">Jobs</a>
				<div class="dropdown-menu fade-down m-0">
					<a href="admin-add-job.jsp" class="dropdown-item">Add Jobs
						Details</a> <a href="admin-view-job-details.jsp" class="dropdown-item">View
						Job Details</a>
				</div>
			</div>
			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle active"
					data-bs-toggle="dropdown">City Info</a>
				<div class="dropdown-menu fade-down m-0">
					<a href="admin-add-city-details.jsp" class="dropdown-item">Add City Details
						</a> <a href="admin-view-city-details.jsp" class="dropdown-item">View
						City Details</a>
				</div>
			</div>
			<a href="admin-view-users.jsp" class="nav-item nav-link">View
				Users</a>
			<a href="admin-view-users-issue.jsp" class="nav-item nav-link">View
				Issues</a>
			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle active"
					data-bs-toggle="dropdown"><%=session.getAttribute("uname")%></a>
				<div class="dropdown-menu fade-down m-0">
					<a href="admin-view-profile.jsp" class="dropdown-item">View
						Profile</a> 
					<a href="admin-change-password.jsp" class="dropdown-item">Settings</a>
					<a href="admin-view-inquiry.jsp" class="dropdown-item">View
						Inquiry</a> 
					<a href="admin-view-users-feedbacks.jsp"
						class="dropdown-item">View Feedbacks</a>
				</div>
			</div>
		</div>
		<a href="logout.jsp"
			class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">Logout<i
			class="fa fa-arrow-right ms-3"></i></a>
	</div>
</nav>