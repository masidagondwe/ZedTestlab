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
	href='<c:url value="/resources/css/material.min.css" />'>
<link rel="stylesheet"
	href='<c:url value="/resources/css/animate.css" />'>

<!-- CUSTOM STYLESHEETS -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<%-- <link rel="stylesheet" href='<c:url value="/resources/css/demo.css" />'>
<link rel="stylesheet"
	href='<c:url value="/resources/css/component.css" />'> --%>
<link rel="stylesheet"
	href='<c:url value="/resources/css/user-styles.css" />'>
<link rel="stylesheet"
	href='<c:url value="/resources/scss/style.scss" />'>

<!-- FONTS -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/font-awesome.css" />'>

<!-- sort/filter -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/layout.css" />'>

<style type="text/css">
.myButton {
    float: left;
    max-width: 300px;
    margin-top: 33px;
    padding: 1em;
}

.myButton ul {
    list-style-type: none;
    padding: 0;
}
   
.myButton ul a {
    text-decoration: none;
}

#view-source {
	position: fixed;
	display: block;
	right: 0;
	bottom: 0;
	margin-right: 40px;
	margin-bottom: 40px;
	z-index: 900;
}
.myPie {
    margin-left: 170px;
    border-left: 1px solid gray;
    padding: 1em;
    overflow: hidden;
}

.myPie table {
    margin-left: 450px;
  /*  border-left: 1px dotted #2db79e; */
    padding: 1em;
    overflow: hidden;
}

td, th {
	background-color: #fff;
    padding: 10px;
    text-align: left;
    color: #000;
}
	td.err {
		background-color: #fff;
		color: #000;
		font-size: 3em;
		text-align: left;
		line-height: 1;
	}
th {
    background-color: #31bc86;
    padding: 10px;
    font-weight: bold;
    color: #fff;
    white-space: nowrap;
    text-align: left;
}
tbody th {
/*	background-color: #2ea879; */
	padding: 10px;
	text-align: left;
}
tbody tr:nth-child(2n-1) {
    background-color: #f5f5f5;
    transition: all .125s ease-in-out;
}
 tbody tr:hover {
    background-color: rgba(127,208,177,.3);
} 

</style>

<title>Zed : Profile</title>
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

		<!-- -------------------------------------------------------user profile-------------------------------------------------------  -->
		<div
			class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
			<div class="demo-drawer mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-50">
				<header class="demo-drawer-header">
					<img src='<c:url value="/resources/images/user.jpg" />'
						class="demo-avatar" alt="">
					<div class="demo-avatar-dropdown">
						<span>${userEmail}</span>
						<div class="mdl-layout-spacer">
							<br />
						</div>
					</div>
				</header>
				<nav class="demo-navigation mdl-navigation mdl-color--blue-grey-800">
					<a class="mdl-navigation__link" href=""><i
						class="mdl-color-text--blue-grey-400 material-icons"
						role="presentation">inbox</i>Inbox</a> <a class="mdl-navigation__link"
						href=""><i
						class="mdl-color-text--blue-grey-400 material-icons"
						role="presentation">flag</i>Update Info</a> <a
						class="mdl-navigation__link" href=""><i
						class="mdl-color-text--blue-grey-400 material-icons"
						role="presentation">report</i>Spam</a> <a class="mdl-navigation__link"
						href=""><i
						class="mdl-color-text--blue-grey-400 material-icons"
						role="presentation">forum</i>Forums</a> <a
						class="mdl-navigation__link" href=""><i
						class="mdl-color-text--blue-grey-400 material-icons"
						role="presentation">people</i>Social</a> <a
						class="mdl-navigation__link" href=""><i
						class="mdl-color-text--blue-grey-400 material-icons"
						role="presentation">delete</i>Account</a>
					<div class="mdl-layout-spacer"></div>
					<a class="mdl-navigation__link" href=""><i
						class="mdl-color-text--blue-grey-400 material-icons"
						role="presentation">help_outline</i><span class="visuallyhidden">Help</span></a>
				</nav>
			</div>

			<main class="mdl-layout__content mdl-color--grey-100">
			<div class="mdl-grid demo-content">
				<div class="demo-graphs mdl-shadow--2dp mdl-color--white mdl-cell mdl-cell--8-col">
					<h1 style="margin-left: 0px; color: #41a081;">
							<em>Your Test case List</em>
						</h1>
					<div class="container">
						
						<div class="myButton">
							<ul>
			      				<li><a class="btn btn-info" 
									href="<c:url value='/Project' />">&nbsp;&nbsp;<b class="fa fa-plus fa-fw" ></b>&nbsp;&nbsp; Project</a>&nbsp;&nbsp;&nbsp;&nbsp;
								</li>
								<li><br/></li>	
								<li><a class="btn btn-info" 
									href="<c:url value='/graph' />">&nbsp;&nbsp;<b class="fa fa-eye fa-fw"></b>&nbsp;&nbsp; Graph</a>&nbsp;&nbsp;&nbsp;&nbsp;
								</li>
								<li><br/></li>	
								<li><a class="btn btn-info" 
									href="<c:url value='/pie' />">&nbsp;&nbsp;<b class="fa fa-eye fa-fw"></b>&nbsp;&nbsp; Chart</a>&nbsp;&nbsp;&nbsp;&nbsp;
								</li>
								<li><br/></li>	
								<li><hr/></li>
							</ul>
						</div>

						<div >
							<table class="myPie">
								<thead>
									<tr>
										<th>&nbsp;Id</th>
										<th>&nbsp;Name</th>
										<th>&nbsp;State</th>
										<th></th>
										<th></th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${!empty listOfTestcases}">
										<c:forEach items="${listOfTestcases}" var="testcase">
											<tr>
												<td>${testcase.id}</td>
												<td>${testcase.name}</td>
												<td>Passed</td>
												<td>&nbsp;&nbsp;&nbsp;<a
													href="<c:url value='/editProject/${testcase.id}' />"
													class="fa fa-pencil fa-fw" role="button"></a>&nbsp;&nbsp;&nbsp;
												</td>
												<td>&nbsp;&nbsp;&nbsp;<a
													href="<c:url value='/deleteProject/${testcase.id}' />"
													class="fa fa-trash-o fa-fw" role="button"></a>&nbsp;&nbsp;&nbsp;
												</td>
												<td>&nbsp;&nbsp;&nbsp;<a
													href="<c:url value='/viewTestcase/${testcase.id}' />"
													role="button">View more</a>&nbsp;&nbsp;&nbsp;
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
							
						</div>
						
					</div>
				</div>
				
				<div
					class="demo-cards mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet mdl-grid mdl-grid--no-spacing">
					<div
						class="demo-updates mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
						<div class="mdl-card__title mdl-card--expand mdl-color--teal-300">
							<h2 class="mdl-card__title-text">ZED test lab</h2>
						</div>
						<div class="mdl-card__supporting-text mdl-color-text--grey-600">
							Learn how you can have all your software testing needs in one
							place.</div>
						<div class="mdl-card__actions mdl-card--border">
							<a href="<c:url value='/contact' />" class="mdl-button mdl-js-button mdl-js-ripple-effect">Read
								More</a>
						</div>
					</div>

					<div class="demo-separator mdl-cell--1-col"></div>

				</div>
			</div>
			</main>

		</div>



		<div class="section" id="home">
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<br /> <br /> <br /> <br /> <br />
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




	<!-- ------------------------------------------------------------scripts-------------------------------------------  -->
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
	<script src='<c:url value="/resources/js/material.min.js"/>'
		type="text/javascript"></script>

</body>
</html>