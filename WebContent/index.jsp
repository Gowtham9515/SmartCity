<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Smart City || Home</title>
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


	<!-- Carousel Start -->
	<div class="container-fluid p-0 mb-5">
		<div class="owl-carousel header-carousel position-relative">
			<div class="owl-carousel-item position-relative">
				<img class="img-fluid" src="img/banner-1.JPG" alt=""
					style="height: 550px;">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(24, 29, 56, .7);">
					<div class="container">
						<div class="row justify-content-start">
							<div class="col-sm-10 col-lg-8">
								<h5
									class="text-primary text-uppercase mb-3 animated slideInDown">Smart
									City</h5>
								<h1 class="display-3 text-white animated slideInDown">Connecting
									the City of Tomorrow</h1>
								<p class="fs-5 text-white mb-4 pb-2">It is a compelling
									slogan that conveys a futuristic vision where technology and
									innovation are seamlessly integrated to create a more connected
									and efficient urban environment.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="owl-carousel-item position-relative">
				<img class="img-fluid" src="img/banner-2.JPG" alt=""
					style="height: 550px;">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(24, 29, 56, .7);">
					<div class="container">
						<div class="row justify-content-start">
							<div class="col-sm-10 col-lg-8">
								<h5
									class="text-primary text-uppercase mb-3 animated slideInDown">Smart
									City</h5>
								<h1 class="display-3 text-white animated slideInDown">Future-Ready
									Cities, Today</h1>
								<p class="fs-5 text-white mb-4 pb-2">It is a powerful and
									proactive slogan that reflects a commitment to building urban
									environments that are prepared for future challenges and
									opportunities.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="owl-carousel-item position-relative">
				<img class="img-fluid" src="img/banner-3.jpg" alt=""
					style="height: 550px;">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(24, 29, 56, .7);">
					<div class="container">
						<div class="row justify-content-start">
							<div class="col-sm-10 col-lg-8">
								<h5
									class="text-primary text-uppercase mb-3 animated slideInDown">Smart
									City</h5>
								<h1 class="display-3 text-white animated slideInDown">Smarter
									Cities, Happier Lives.</h1>
								<p class="fs-5 text-white mb-4 pb-2">It is a powerful slogan
									that highlights the positive impact of smart city initiatives
									on the well-being of residents. It conveys the idea that
									through innovation, technology, and sustainable solutions,
									cities can improve the quality of life, making them more
									livable, efficient, and connected.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="owl-carousel-item position-relative">
				<img class="img-fluid" src="img/banner-4.jpg" alt=""
					style="height: 550px;">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(24, 29, 56, .7);">
					<div class="container">
						<div class="row justify-content-start">
							<div class="col-sm-10 col-lg-8">
								<h5
									class="text-primary text-uppercase mb-3 animated slideInDown">Smart
									City</h5>
								<h1 class="display-3 text-white animated slideInDown">Smart
									Living, Sustainable Future.</h1>
								<p class="fs-5 text-white mb-4 pb-2">It is a slogan that
									perfectly encapsulates the essence of modern urban development
									and sustainable living. It conveys the message that by adopting
									smart technologies and innovative solutions, we can create a
									way of life that is not only more efficient and connected but
									also environmentally conscious and future-proof./p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Carousel End -->
	<!-- About Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-5">
				<div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s"
					style="min-height: 400px;">
					<div class="position-relative h-100">
						<img class="img-fluid position-absolute w-100 h-100"
							src="img/mission.png" alt="" style="object-fit: cover;">
					</div>
				</div>
				<div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
					<h6 class="section-title bg-white text-start text-primary pe-3">About
						Us</h6>
					<h1 class="mb-4">Vision Of Smart Cities Mission</h1>
					<p class="mb-4">The objective of SCM is to promote cities that
						provide core infrastructure and give a decent quality of life to
						its citizens, a clean and sustainable environment through the
						application of 'Smart' solutions.</p>
					<p class="mb-4">The first question is what is meant by a smart
						city. The answer is, there is no universally accepted definition
						of a Smart City. It means different things to different people.</p>
					<div class="row gy-2 gx-4 mb-4">
						<div class="col-sm-6">
							<p class="mb-0">
								<i class="fa fa-arrow-right text-primary me-2"></i>Environmental
								Sustainability
							</p>
						</div>
						<div class="col-sm-6">
							<p class="mb-0">
								<i class="fa fa-arrow-right text-primary me-2"></i>Improved Governance
							</p>
						</div>
						<div class="col-sm-6">
							<p class="mb-0">
								<i class="fa fa-arrow-right text-primary me-2"></i>Better
								Quality of Life
							</p>
						</div>
						<div class="col-sm-6">
							<p class="mb-0">
								<i class="fa fa-arrow-right text-primary me-2"></i>Smart Housing and Buildings
							</p>
						</div>
						<div class="col-sm-6">
							<p class="mb-0">
								<i class="fa fa-arrow-right text-primary me-2"></i>Enhanced
								Public Safety
							</p>
						</div>
						<div class="col-sm-6">
							<p class="mb-0">
								<i class="fa fa-arrow-right text-primary me-2"></i>Citizen Participation
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- About End -->


	<!-- Categories Start -->
	<div class="container-xxl py-5 category">
		<div class="container">
			<div class="row g-3">
				<div class="col-lg-6 col-md-6">
					<div class="row g-3">
						<div class="col-lg-12 col-md-12 wow zoomIn" data-wow-delay="0.1s">
							<a class="position-relative d-block overflow-hidden" href="">
								<img class="img-fluid" src="img/cart-1.JPG" alt="" style="width:550px;height:300px;">
								<div
									class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3"
									style="margin: 1px;">
									<h5 class="m-0">CITIES</h5>
									<small class="text-primary">100</small>
								</div>
							</a>
						</div>
						<div class="col-lg-12 col-md-12 wow zoomIn" data-wow-delay="0.1s">
							<a class="position-relative d-block overflow-hidden" href="">
								<img class="img-fluid" src="img/cart-2.jpg" alt="" style="width:550px;height:300px;">
								<div
									class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3"
									style="margin: 1px;">
									<h5 class="m-0">COMPLETED</h5>
									<small class="text-primary">Projects - 7,261 (90%) || 1,45,889 Cr.</small>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="row g-3">
						<div class="col-lg-12 col-md-12 wow zoomIn" data-wow-delay="0.1s">
							<a class="position-relative d-block overflow-hidden" href="">
								<img class="img-fluid" src="img/cart-3.jpg" alt="" style="width:550px;height:300px;">
								<div
									class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3"
									style="margin: 1px;">
									<h5 class="m-0">TOTAL</h5>
									<small class="text-primary">Projects - 8,042 || 1,64,547 Cr.</small>
								</div>
							</a>
						</div>
						<div class="col-lg-12 col-md-12 wow zoomIn" data-wow-delay="0.1s">
							<a class="position-relative d-block overflow-hidden" href="">
								<img class="img-fluid" src="img/cart-4.png" alt="" style="width:550px;height:300px;">
								<div
									class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3"
									style="margin: 1px;">
									<h5 class="m-0">ONGOING</h5>
									<small class="text-primary">Projects - 781 (10%) || 18,658 Cr.</small>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Categories Start -->
	
	<!-- Team Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
				<h6 class="section-title bg-white text-center text-primary px-3">Supporting Organisation</h6>
				<h1 class="mb-5">Organisations</h1>
			</div>
			<div class="row g-4">
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
					<div class="team-item bg-light">
						<div class="overflow-hidden">
							<img class="img-fluid" src="img/team-1.png" alt="" style="height:200px;">
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
					<div class="team-item bg-light">
						<div class="overflow-hidden">
							<img class="img-fluid" src="img/team-2.png" alt="" style="height:200px;">
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s" >
					<div class="team-item bg-light">
						<div class="overflow-hidden">
							<img class="img-fluid" src="img/team-3.png" alt="" style="height:200px;">
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s" >
					<div class="team-item bg-light">
						<div class="overflow-hidden">
							<img class="img-fluid" src="img/team-4.png" alt="" style="height:200px;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Team End -->

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