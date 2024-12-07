<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Smart City || User Account</title>
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
					<h1 class="display-3 text-white animated slideInDown">User
						Account</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->


	<!-- 404 Start -->

	<div class="container">
		<div class="panel panel-primary shadow p-3 mb-5">
			<div class="panel-body">
				<%
					String message = (String) session.getAttribute("success");
					if (message != null) {
						session.removeAttribute("success");
				%>
				<div class="alert alert-success" id="success">Account created
					successfully.</div>
				<%
					}
				%>
				<%
					String error = (String) session.getAttribute("error");
					if (error != null) {
						session.removeAttribute("error");
				%>
				<div class="alert alert-danger" id="danger">User already exist try another Name OR Email OR
					Mobile No OR User Name, Please try again.</div>
				<%
					}
				%>
				<form action="CreateUserAccount" method="post" name="userForm"
					id="form" role="form" onsubmit="return validateMobileNumber()">
					<div class="row g-3">
						<%
							int userId = DatabaseConnection.generateUserId();
						%>
						<div class="col-md-6">
							<label for="userId">User Id:</label> <input type="text"
								class="form-control" id="userId" placeholder="User Id"
								name="userId" value="<%=userId%>" readonly>
						</div>
						<div class="col-md-6"">
							<label for="fullName">Full Name:</label> <input type="text"
								class="form-control" id="fullName" placeholder="Full Name"
								name="fullName" required
								onkeypress="return lettersValidate(event)">
						</div>
						<div class="col-md-6">
							<label for="email">Email Id:</label> <input type="email"
								class="form-control" id="email" placeholder="Email Id"
								name="email" required
								title="Email can not be blank and should contain @ character.">
						</div>
						<div class="col-md-6">
							<label for="mobile">Mobile No:</label> <input type="text"
								class="form-control" id="mobile" placeholder="Mobile No"
								name="mobile" required onkeypress="return numberValidate(event)"
								maxlength="10">
						</div>
						<div class="col-md-6">
							<label for="gender">Select Gender:</label> <select
								class="form-control" id="gender" name="gender" required>
								<option>Male</option>
								<option>Female</option>
							</select>
						</div>
						<div class="col-md-6">
							<label for="gender">Role:</label> <select class="form-control"
								id="role" name="role" required>
								<option>Tourist</option>
								<option>Student</option>
								<option>Job Seeker</option>
							</select>
						</div>
						<div class="col-md-12">
							<label for="address">Address:</label>
							<textarea class="form-control" id="address" placeholder="Address"
								name="address" required></textarea>
						</div>
						<div class="col-md-6">
							<label for="uname">User Name:</label> <input type="text"
								class="form-control" id="uname" placeholder="Enter username"
								name="uname" required onkeypress="return lettersValidate(event)">
						</div>
						<div class="col-md-6">
							<label for="upass">Password:</label> <input type="password"
								class="form-control" id="upass" placeholder="Enter password"
								name="upass" required oninput="limitChar(this)" maxlength="12"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
								title="Password should contain at least 1 Uppercase ,1 Lowercase and digit and minimum of 6 character.">
						</div>
						<div class="col-md-6">
							<input type="submit" value="Create Account"
								class="btn btn-primary" id="buttonValidate"> <input
								type="reset" class="btn btn-danger" value="Cancel"> <a
								href="user-login.jsp">Already registered.!! Click here to
								user login.</a>
						</div>
					</div>
				</form>
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
	<script type="text/javascript">
		let limitChar = (element) => {
	        const maxChar = 12;
	        
	        let ele = document.getElementById(element.id);
	        let charLen = ele.value.length;
	        
	        let p = document.getElementById('charCounter');
	        p.innerHTML = maxChar - charLen + ' characters remaining';
	        
	        if (charLen > maxChar) 
	        {
	            ele.value = ele.value.substring(0, maxChar);
	            p.innerHTML = 0 + ' characters remaining'; 
	        }
	    }
		let limitNumber = (element) => {
	        const maxNumber = 6;
	        
	        let ele = document.getElementById(element.id);
	        let numberLen = ele.value.length;
	        
	        let p = document.getElementById('numberCounter');
	        p.innerHTML = maxNumber - numberLen + ' number remaining';
	        
	        if (numberLen > maxNumber) 
	        {
	            ele.value = ele.value.substring(0, maxNumber);
	            p.innerHTML = 0 + ' number remaining'; 
	        }
	    }
		function lettersValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 64 && keycode < 91) || (keycode > 96 && keycode < 123) || keycode == 32)  
	    	{     
	           return true;    
	    	}else{
	           return false;
	    	}    
	    }
		function numberValidate(key) {
			
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 47 && keycode < 58))  
	    	{     
	           return true;    
	    	}else{
	           return false;
	    	} 
	   		  		
	    }
	</script>
	<script type="text/javascript">
			function validateMobileNumber() {
			    const mobileNumber = document.getElementById('mobile').value;
			
			    // Check if the input is all zeros or is empty
			    if (/^0+$/.test(mobileNumber)) {
			        alert("Please enter a valid mobile number.");
			        return false;
			    }
			    
			    // You can add more validation if needed, like length check, etc.
			    return true;
			}
	</script>
	<script>
	 $(document).ready(function() {
         $("#buttonValidate").click(function() {
             var cname = $("#fullName").val();
             var email = $("#email").val();
             var mobile = $("#mobile").val();
             var gender = $("#gender").val();
             var role = $("#role").val();
             var address = $("#address").val();
             var uname = $("#uname").val();
             var upass = $("#upass").val();
             if (fullName === "" || email === "" || mobile === "" || gender === "" || role === "" || address === "" || uname === "" || upass === "")
             {
                 $("#fullName").css("border-color", "red");
                 $("#email").css("border-color", "red");
                 $("#mobile").css("border-color", "red");
                 $("#gender").css("border-color", "red");
                 $("#role").css("border-color", "red");
                 $("#address").css("border-color", "red");
                 $("#uname").css("border-color", "red");
                 $("#upass").css("border-color", "red");
                 alert("All fields are mendatory.");
                 return false;
             }
         });
     });                                              
	</script>
	<script>
		$(document).ready(function() { 
		    $('#buttonValidate').click(function() {  
		 
		        $(".error").hide();
		        var hasError = false;
		        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		 
		        var emailaddressVal = $("#email").val();
		        if(emailaddressVal == '') {
		            $("#email").after('<span class="error">Please enter your email address.</span>');
		            hasError = true;
		        }
		 
		        else if(!emailReg.test(emailaddressVal)) {
		            $("#email").after('<span class="error">Enter a valid email address.</span>');
		            hasError = true;
		        }
		 
		        if(hasError == true) { return false; }
		 
		    });
		});
	</script>
	<script>
	    $(document).ready(function() {
	        $("#form").submit(function(e) {
	            
	        	 var mobile = $('#mobile').val().length;
		         if (mobile !== 10) {
		             alert("Mobile number should be 10 digit only.");
		             e.preventDefault();
		             return false;
		         }
	             else
	                {}
	        });
	    });
	</script>
	<script type="text/javascript">
		$(function() {
			$('#success').delay(5000).show().fadeOut('slow');
		});

		$(function() {
			$('#danger').delay(5000).show().fadeOut('slow');
		});

		$(function() {
			$('#warning').delay(5000).show().fadeOut('slow');
		});

		$(function() {
			$('#info').delay(5000).show().fadeOut('slow');
		});
	</script>
</body>
</html>