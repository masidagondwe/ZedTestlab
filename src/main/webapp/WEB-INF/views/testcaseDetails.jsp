<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet"
	href='<c:url value="/resources/css/normalize.css" />'>
<link rel="stylesheet" href='<c:url value="/resources/css/demo.css" />'>
<link rel="stylesheet"
	href='<c:url value="/resources/css/component.css" />'>

<!-- DROP DOWN LIST -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/dropdownstyle.css" />'>


<!-- SITE TITLE -->
<title>Zed : Test case details</title>

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

<!-- CUSTOM STYLESHEETS -->
<link rel="stylesheet" href='<c:url value="/resources/css/style.css" />'>

<!-- FONTS -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/font-awesome.css" />'>

<!-- sort/filter -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/layout.css" />'>


</head>

<body>
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
					<a class="navbar-brand wow fadeInLeft animated"
						data-wow-offset="30" data-wow-duration="2s" data-wow-delay="0.25s"
						href="<c:url value='/' />"><img
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
							href="<c:url value='/logout' />" class="btn nav-button">LOGOUT</a>
						</li>
					</ul>
				</nav>
			</div>
		</header>

		<!-- ------------------------------------------VERSION AND TEST CASE REPORT TABLE-------------------------------------- -->

		<div class="container">
			<h1 align="center" style="color: #fff;">
				Test case <em>Details</em>
			</h1>
			<div>
				<!-- -----CHOOSE PROJECT FROM DROP DOWN LIST----- -->
				<span class="custom-dropdown big"> <form:form
						action="/viewTestcase/${testcase.id}" method="POST"
						modelAttribute="myTestcase">
						<form:select path="name">
							<form:option value="NONE" label="Select Test case" />
							<form:options items="${listOfTestcases}" itemValue="id"
								itemLabel="name" />
						</form:select>
						<button class="fa fa-search fa-1x"></button>
					</form:form>
				</span>
				<br/>
			</div>
			<br/>
			<div class="component">
				<table>
					<thead>
						<tr>
							<th>Project Version ID</th>
							<th>Version</th>
							<th>Report</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listOfVersions}" var="version">
							<tr>
								<th>${version.id}</th>
								<td><b>Name of project version : </b> ${version.name} <br />
									<br /> <b>Date version was launched :</b>
									${version.datelaunched}</td>
								<td>
									<table>
										<c:forEach items="${listOfReports}" var="report">
											<tr>
												<c:if test="${report.testcase.id == version.testcase.id }">
													<td><b>Name of case report : </b>${report.name} <br />
														<br /> <b>Date report was made : </b>${report.reportdate}<br />
														<br /> <b>Report description : </b>${report.report}</td>
												</c:if>
											</tr>
										</c:forEach>
									</table>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td></td>
							<td>
								<div>
									<a class="btn btn-info" href="<c:url value='/addVersion' />">Add
										New Version</a>
								</div>
							</td>
							<td>
								<div>
									<a class="btn btn-info" href="<c:url value='/addReport' />">Add
										New Test report</a>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="section" id="home">
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<br /> <br />
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

	<!-- ===========================================     SCRIPTS    =========================================== -->


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"
		type="text/javascript"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"
		type="text/javascript"></script>
	<script
		src='http://ajax.googleapis.com/ajax/libs/prototype/1.7.1/prototype.js'
		type="text/javascript"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/jquery-1.11.2.min.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/bootstrap.min.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/wow.min.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/jquery.easing.min.js"/>'
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/jquery.mixitup.min.js"/>'
		type="text/javascript"></script>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/index.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/prefix-free.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/jquery.stickyheader.js"/> '
		type="text/javascript"></script>
	<!-- nav bar scripts  -->
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/v-index.js"/> '
		type="text/javascript"></script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/jquery-1.11.2.min.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/bootstrap.min.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/wow.min.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/jquery.easing.min.js"/>'
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/jquery.mixitup.min.js"/>'
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/fresco/fresco.js"/>'
		type="text/javascript"></script>
	<script type="text/javascript">
		wow = new WOW({
			animateClass : 'animated',
			offset : 100
		});
		wow.init();
		document.getElementById('moar').onclick = function() {
			var section = document.createElement('section');
			section.className = 'section--purple wow fadeInDown';
			this.parentNode.insertBefore(section, this);
		};
	</script>

	<script type="text/javascript">
		$(function() {

			var filterList = {

				init : function() {

					// MixItUp plugin
					// http://mixitup.io
					$('#portfoliolist').mixitup({
						targetSelector : '.portfolio',
						filterSelector : '.filter',
						effects : [ 'fade' ],
						easing : 'snap',
						// call the hover effect
						onMixEnd : filterList.hoverEffect()
					});

				},

				hoverEffect : function() {

					// Simple parallax effect
					$('#portfoliolist .portfolio').hover(function() {
						$(this).find('.label').stop().animate({
							bottom : 0
						}, 200, 'easeOutQuad');
						$(this).find('img').stop().animate({
							top : -30
						}, 500, 'easeOutQuad');
					}, function() {
						$(this).find('.label').stop().animate({
							bottom : -40
						}, 200, 'easeInQuad');
						$(this).find('img').stop().animate({
							top : 0
						}, 300, 'easeOutQuad');
					});

				}

			};

			// Run the show!
			filterList.init();

		});
	</script>



</body>
</html>
