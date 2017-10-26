<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<!-- SITE TITLE -->
<title>Zed Testlab</title>

<!-- =========================
     FAV AND TOUCH ICONS AND FONT  
    ============================== -->
<link rel="icon" href='<c:url value="/resources/images/fav.png" />'>

<!-- =========================
     STYLESHEETS   
    ============================== -->
<!-- BOOTSTRAP AND ANIMATION -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/bootstrap.min.css" />'>
<link rel="stylesheet"
	href='<c:url value="/resources/css/bootstrap-theme.min.css" />'>

<!-- CUSTOM STYLESHEETS -->
<link rel="stylesheet" href='<c:url value="/resources/css/style.css" />'>

<!-- FONTS -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/font-awesome.css" />'>

<link rel="stylesheet"
	href='<c:url value="/resources/css/form-style.scss" />'>

</head>
<body>
	<!-- ===================================  HEADER  ======================================= -->
	<div class="section" id="home">
		<header class="navbar navbar-customs">
			<div class="container-fluid">
				<div class="navbar-header navbar-left">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navigation">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!-- HEADER LOGO -->
					<a href="<c:url value='/' />"> <img
						src='<c:url value="/resources/images/nav-logo.png" />' alt="logo">
					</a>
				</div>

				<nav id="navigation"
					class="navigation navbar-collapse collapse navbar-right">
					<!-- NAVIGATION LINKS -->
					<ul id="header-nav" class="nav navbar-nav">
						<li><a href="<c:url value='/' />">HOME</a></li>
						<li><a href="<c:url value='/projects' />">PROJECTS</a></li>
						<li><a href="<c:url value='/testcases' />">TEST CASES</a></li>
						<li><a href="<c:url value='/profile' />">PROFILE</a></li>
						<li class="nav-contact"><a href="#">CONTACT</a></li>
						<li class="nav-icon">&nbsp;&nbsp;&nbsp;</li>
						<!-- HEADER ACTION BUTTON -->
						<li class="header-login-button"><a
							href="<c:url value='/login' />" class="btn nav-button">LOGIN</a></li>
						<li>&nbsp;&nbsp;&nbsp;</li>
						<li class="header-login-button"><a
							href="<c:url value='/register' />" class="btn nav-button">REGISTER</a>
						</li>
					</ul>
				</nav>
			</div>
		</header>
		<!-- ==========================header ends================================= -->

		<div class="container">
			<div class="loki-content">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
					<br/><br/><br/><br/><br/><br/>
						<div class="loki-heading" data-animation="fadeIn">
							<h4 style="color: #fff;">HI, WELCOME TO ZED TESTLAB!</h4>
							<h1 style="color: #fff;">READY TO START ?</h1>
						</div>
						<p class="loki-buttons">
							<a style="color: #000;" href="/contact.jsp">DISCOVER</a>
						</p>
						<div class="section" id="home">						 
							<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
							<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
							<br /> <br /> <br /> <br /> <br /><br /> <br /> <br /> <br />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end section -->


	<!-- =========================
                SECTION: FOOTER   
    ============================== -->
	<div class="section" id="twitter">
		<div class="container">
			<div class="row ">
				<div class="col-md-3 social">
					<i class="fa fa-twitter"></i>
				</div>
				<div class="col-md-9 social-news">
					<p>Don't be a stranger.Contact us today!</p>
					<p class="message-http">
						<small class="date"> 17 Nov 2016 </small>
					</p>
				</div>
			</div>
		</div>
	</div>


	<!-- =========================
                SCRIPTS   
    ============================== -->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src='<c:url value="/resources/js/jquery-1.11.2.min.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/bootstrap.min.js"/> '
		type="text/javascript"></script>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/index.js"/> '
		type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"
		type="text/javascript"></script>

</body>
</html>