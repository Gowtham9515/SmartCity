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
			<a href="jobseeker-dashboard.jsp" class="nav-item nav-link">Home</a>
			<a href="jobseeker-view-city-info.jsp" class="nav-item nav-link">View
				Cities Info</a> <a href="jobseeker-search-job.jsp"
				class="nav-item nav-link">Search Job</a> <a
				href="jobseeker-give-feedback.jsp" class="nav-item nav-link">Give
				Feedback</a>
			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle active"
					data-bs-toggle="dropdown">Raise Issue</a>
				<div class="dropdown-menu fade-down m-0">
					<a href="jobseeker-raise-issues.jsp" class="dropdown-item">Raise
						Issue</a> <a href="jobseekers-view-issues-reply.jsp"
						class="dropdown-item">View Issue Reply</a>
				</div>
			</div>
			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle active"
					data-bs-toggle="dropdown"><%=session.getAttribute("uname")%></a>
				<div class="dropdown-menu fade-down m-0">
					<a href="jobseeker-view-profile.jsp" class="dropdown-item">View
						Profile</a> <a href="jobseeker-change-password.jsp"
						class="dropdown-item">Settings</a>
				</div>
			</div>
		</div>
		<a href="logout.jsp"
			class="btn btn-danger py-4 px-lg-5 d-none d-lg-block">Logout<i
			class="fa fa-arrow-right ms-3"></i></a>
	</div>
</nav>