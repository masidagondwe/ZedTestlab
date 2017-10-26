<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Projects</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">	
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">		
<link rel="stylesheet" href='<c:url value="/resources/css/demo.css" />'>
<link rel="stylesheet" href='<c:url value="/resources/css/component.css" />'>
<link rel="stylesheet" href='<c:url value="/resources/css/grid.css" />'>

<!-- SITE TITLE -->
<title>Zed : Projects</title>

<link rel="icon" href='<c:url value="/resources/images/fav.png" />'>

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
<style>
.myLabel{
color: #000;
background-color: #fff;
}
#plus  {  font-family:Helvetica;
          font-weight:900;
          color:rgba(255,255,255,.85);
          font-size:96px;
          }

</style>

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
							href="<c:url value='/logout' />" class="btn nav-button">LOGOUT</a>
						</li>
					</ul>
				</nav>
			</div>
		</header>
		<!-- ========================== header ends================================= -->

		<div class="container">
			<!-- Top Navigation -->
			<h1 align="center" style="color: #fff;">
				Project <em>List</em>
			</h1>

			<div class="myButton">
				<ul>
					<li><br/></li>
					<li><br/></li>
				    <li class="myLabel"> DOWNLOAD&nbsp;&nbsp;<h3 class="fa fa-long-arrow-right"></h3></li>
				    <li><br/></li>
				    <li><br/></li>
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
						
		
			<div  class="component">
			
	 			<table id="projectsTable">
					<thead>
						<tr>
							<th>&nbsp;</th>
							<th>&nbsp;Name</th>
							<th>&nbsp;Date created&nbsp;</th>
							<th>No. Test cases</th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty listOfProjects}">
							<c:forEach items="${listOfProjects}" var="project">
								<tr>
									<td><i class="fa fa-folder-open 3x"></i></td>
									<td>${project.name}</td>
									<td>${project.datelaunched}</td>
									<c:set var="count" value="0" scope="page" />
									<c:forEach items="${Testcases}" var="testcase">
										<c:if test="${testcase.project.id == project.id }">
										<c:set var="count" value="${count + 1}" scope="page"/>
												
										</c:if>
									</c:forEach>
									<td><c:out value="${count}"/></td>						
									<td><a
										href="<c:url value='/editProject/${project.id}' />"
										class="fa fa-pencil-square-o fa-fw" role="button"></a>&nbsp;&nbsp;&nbsp;
									</td>
									<td>&nbsp;&nbsp;&nbsp;<a class="fa fa-eye fa-fw"
										href="<c:url value='/viewProject/${project.id}' />"
										role="button"></a>&nbsp;&nbsp;&nbsp;
									</td>
									<td>&nbsp;&nbsp;&nbsp;<a
										href="<c:url value='/deleteProject/${project.id}' />"
										class="fa fa-trash-o fa-fw" role="button"></a>&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>

		</div>
	</div>

	<!--     ---------------------------end of section--------------------------    -->

	<!--	 ---------------------------footer----------------------------------	-->
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


	<!-- =========================               SCRIPTS          ============================== -->

	<!-- jQuery (necessary for header and footer's JavaScript plugins) -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/jquery-1.11.2.min.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/bootstrap.min.js"/> '
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
		
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src='<c:url value="/resources/js/jquery.easing.min.js"/>'
		type="text/javascript"></script>
		
<!-- jQuery (necessary for download JavaScript plugins) -->
	<script src='<c:url value="/resources/js/jquery-1.12.4.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/jquery.dataTables.min.js"/> '
		type="text/javascript"></script>	
	<script src='<c:url value="/resources/js/dataTables.buttons.min.js"/> '
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/buttons.flash.min.js"/> '
		type="text/javascript"></script>	
	<script src='<c:url value="/resources/js/jszip.min.js"/> '
		type="text/javascript"></script>	
	<script src='<c:url value="/resources/js/pdfmake.min.js"/> '
		type="text/javascript"></script>	
	<script src='<c:url value="/resources/js/vfs_fonts.js"/> '
		type="text/javascript"></script>	
	<script src='<c:url value="/resources/js/buttons.html5.min.js"/> '
		type="text/javascript"></script>	
	<script src='<c:url value="/resources/js/buttons.print.min.js"/> '
		type="text/javascript"></script>
				
    <script type="text/javascript">
	    $(document).ready(function() {
	        $('#projectsTable').DataTable( {
	            dom: 'Brtip',
	            buttons: [
	                 'csv', 'excel', 'pdf', 'print'
	            ]
	        } );
	    } );
    </script>


</body>
</html>