<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

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
<link rel="stylesheet"
	href='<c:url value="/resources/css/animate.css" />'>
<link rel="stylesheet" href='<c:url value="/resources/css/app.css" />'>

<!-- CUSTOM STYLESHEETS -->
<link rel="stylesheet" href='<c:url value="/resources/css/style.css" />'>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet"
	href='<c:url value="/resources/scss/style.scss" />'>
<link rel="stylesheet"
	href='<c:url value="/resources/css/form-style.scss" />'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<!-- FONTS -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/font-awesome.css" />'>

<!-- sort/filter -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/layout.css" />'>

<style type="text/css">
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
@import url(http://fonts.googleapis.com/css?family=Montserrat:400,700);

form {
	max-width: 420px;
	margin: 50px auto;
}

.feedback-input {
	color: white;
	font-family: Helvetica, Arial, sans-serif;
	font-weight: 500;
	font-size: 18px;
	border-radius: 5px;
	line-height: 22px;
	background-color: #008080;
	background: url(../images/main-header.jpg) fixed;
	background-repeat: no-repeat;
	background-size: cover;
	border: 2px solid #68e6ac;
	transition: all 0.3s;
	padding: 13px;
	margin-bottom: 15px;
	width: 100%;
	box-sizing: border-box;
	outline: 0;
}

.feedback-input:focus {
	border: 2px solid #68e6ac;
}

textarea {
	height: 150px;
	line-height: 150%;
	resize: vertical;
}

[type="submit"] {
	font-family: 'Montserrat', Arial, Helvetica, sans-serif;
	width: 100%;
	background: #68e6ac;
	border-radius: 5px;
	border: 0;
	cursor: pointer;
	color: white;
	font-size: 24px;
	padding-top: 10px;
	padding-bottom: 10px;
	transition: all 0.3s;
	margin-top: -4px;
	font-weight: 700;
}

[type="submit"]:hover {
	background: #68e6ac;
}
</style>
<title>ZED : Edit Test case</title>
</head>
<body>
	<!-- ----------------------------------------------NAVIGATION BAR------------------------------------------ -->
	<div class="section" id="home">
		<header class="navbar navbar-customs">
			<div class="container-fluid">
				<div class="navbar-header navbar-left">
					<!-- RESPONSIVE MENU BUTTON -->
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
						<!-- HEADER ACTION BUTTON -->
						<li>&nbsp;&nbsp;&nbsp;</li>
						<li class="header-login-button"><a
							href="<c:url value='/' />" class="btn nav-button">LOGOUT</a>
						</li>
					</ul>
				</nav>
			</div>
		</header>

		<!-- fill in form  -->
		<div class="section" id="home">
			<form:form action="save" method="post"
				modelAttribute="testcase">
				<form:input path="id" name="id" type="text"
					class="feedback-input" placeholder="${testcase.id}" />
					
				<form:input path="name" name="name" type="text"
					class="feedback-input" placeholder="${testcase.name}" />
					
				<form:input path="objective" name="objective" type="text"
					class="feedback-input" placeholder="${testcase.objective}" />
					
				<form:input path="prioritylevel" name="prioritlevel" type="text"
					class="feedback-input" placeholder="${testcase.prioritylevel}" />
					
				<form:input path="expectedresult" name="expectedresult" type="text"
					class="feedback-input" placeholder="${testcase.expectedresult}" />
					
				<form:input path="obtainedresult" name="obtainedresult" type="text"
					class="feedback-input" placeholder="${testcase.obtainedresult}" />

				<form:select path="state" class="feedback-input"
					style="background-color: #008080;">
					<form:option value="-1" label="${testcase.state}" />
					<form:options items="${stateList}" />
				</form:select>
				
				<!-- -----CHOOSE USER FROM DROP DOWN LIST----- -->
				<form:select path="qauser.id" class="feedback-input"
					style="background-color: #008080;">
					<form:option value="-1" label="Select user" />
					<c:forEach items="${userList}" var="myUser">
						<option value="${myUser.id}">${myUser.fullname}</option>
					</c:forEach>
				</form:select>
				
				<!-- -----CHOOSE PROJECT FROM DROP DOWN LIST----- -->
				<form:select path="project.id" class="feedback-input"
					style="background-color: #008080;">
					<form:option value="-1" label="Select project" />
					<c:forEach items="${projectList}" var="myProject">
						<option value="${myProject.id}">${myProject.name}</option>
					</c:forEach>
				</form:select>
				<!-- -----CHOOSE Feature FROM DROP DOWN LIST----- -->
				<form:select path="feature.id" class="feedback-input"
					style="background-color: #008080;">
					<form:option value="-1" label="Select feature" />
					<c:forEach items="${featureList}" var="myFeature">
						<option value="${myFeature.id}">${myFeature.name}</option>
					</c:forEach>
				</form:select>

				<input type="submit" value="Update Testcase" />
			</form:form>
			<hr />



			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<br /> <br /> <br /> <br />
		</div>
	</div>

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



	<!-- scripts  -->
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/index.js"/> '
		type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"
		type="text/javascript"></script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src='<c:url value="/resources/js/jquery-1.11.2.min.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/bootstrap.min.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/jquery.easing.min.js"/>'
		type="text/javascript"></script>

</body>
</html>