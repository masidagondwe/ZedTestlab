<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href='<c:url value="/resources/css/demo.css" />'>
<link rel="stylesheet"
	href='<c:url value="/resources/css/component.css" />'>

<!-- DROP DOWN LIST -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/dropdownstyle.css" />'>

<!-- SITE TITLE -->
<title>Zed : Project details</title>

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
							href="<c:url value='/login' />" class="btn nav-button">LOGOUT</a>
						</li>
					</ul>
				</nav>
			</div>
		</header>

		<!-- ------------------------------------------FEATURE AND TEST CASE DISPLAY TABLE-------------------------------------- -->
		<div class="container">
			<h1 align="center" style="color: #fff;">
				Project <em>Details</em>
			</h1>
			<div>
				<!-- -----CHOOSE PROJECT FROM DROP DOWN LIST----- -->
				<span class="custom-dropdown big"> 
					<!-- -----CHOOSE PROJECT FROM DROP DOWN LIST----- -->
					<form:form action="/viewProject/${project.id}" method="post"
				modelAttribute="project">
					<form:select path="project.id" class="feedback-input"
						style="background-color: #008080;">
						<form:option value="-1" label="Select project" />
						<c:forEach items="${listOfProjects}" var="myProject">
							<option value="${myProject.id}">${myProject.name}</option>
						</c:forEach>
					</form:select>
					
					<input class="fa fa-search fa-1x" type="submit" value="" />
					</form:form>
				</span>
				<br/>
			</div>
			<br/>
			<div class="component">
				<table>
					<thead>
						<tr>
							<th>Feature ID</th>
							<th>Features</th>
							<th>Test cases</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listOfFeatures}" var="feature">
							<tr>
								<th>${feature.id}</th>
								<td><b>Name of project feature : </b> ${feature.name} <br/>
								    <b>Function of the feature : </b> ${feature.function} <br/>
								    <b>Type of feature : </b> ${feature.type} <br/>
								</td>
								<td>
									<table>
										<c:forEach items="${listOfTestcases}" var="testcase">
											<tr>
												<c:if test="${testcase.feature.id == feature.id }">
													<td>
														<h3>${testcase.name}</h3>
														<b style="background-color: #45c672">Objective :&nbsp;</b>&nbsp;&nbsp;&nbsp;&nbsp;${testcase.objective}<br/>
														<b style="background-color: #45c672">Expected result :</b>&nbsp;${testcase.expectedresult}<br/>
														<b style="background-color: #45c672">Obtained result :</b>&nbsp;${testcase.obtainedresult}<br/>
														<b style="background-color: #45c672">Priority level :</b>&nbsp;${testcase.prioritylevel}<br/>
													</td>
													<c:if test="${testcase.state == 'failed'}">
														<td style="color : #ce1616">
														<h4>${testcase.state}</h4></td>
													</c:if>
													<c:if test="${testcase.state != 'failed'}">
														<td style="color : #01ba0e">
														<h4>${testcase.state}</h4></td>
													</c:if>
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
									<a class="btn btn-info" href="<c:url value='/Feature' />">Add
										New Feature</a>
								</div>
							</td>
							<td>
								<div>
									<a class="btn btn-info" href="<c:url value='/Testcase' />">Add
										New Test case</a>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="section" id="home">
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<br /> <br /> <br />
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
		src='http://ajax.googleapis.com/ajax/libs/prototype/1.7.1/prototype.js'
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/jquery-1.11.2.min.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/bootstrap.min.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/jquery.easing.min.js"/>'
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

</body>
</html>
