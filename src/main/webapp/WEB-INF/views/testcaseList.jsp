<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href='<c:url value="/resources/css/demo.css" />'>
<link rel="stylesheet"
	href='<c:url value="/resources/css/component.css" />'>

<!-- SITE TITLE -->
<title>Zed : Test cases</title>

<!-- =========================
     FAV AND TOUCH ICONS AND FONT  
    ============================== -->
<link rel="icon" href='<c:url value="/resources/images/fav.png" />'>

<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">	
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
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

<!-- DROP DOWN LIST -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/dropdownstyle.css" />'>

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
							href="<c:url value='/' />" class="btn nav-button">LOGOUT</a>
						</li>
					</ul>
				</nav>
			</div>
		</header>
		<!-- ==========================   header  ends   ================================= -->

		<div class="container">
			<h1 align="center" style="color: #fff;">
				Test case <em>List</em>
			</h1>
			
			<div class="myButton">
				<ul>
					<li><br/></li>
				    <li class="myLabel"> DOWNLOAD&nbsp;&nbsp;<h3 class="fa fa-long-arrow-right"></h3></li>
				    <li><br/></li>
				    <li><br/></li>
      				<li><a class="btn btn-info" 
						href="<c:url value='/Testcase' />"><b class="fa fa-plus fa-fw" ></b>&nbsp; Testcase</a>&nbsp;&nbsp;&nbsp;
					</li>
					<li><br/></li>	
					<%-- <li><a class="btn btn-info" 
						href="<c:url value='/lineGraph' />">&nbsp;&nbsp; <b class="fa fa-eye fa-fw"></b>&nbsp;&nbsp; Graph</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</li>
					<li><br/></li> --%>	
					<li><hr/></li>
					<%-- <li style="color:#fff;"><b> DOWNLOAD :</b></li>	
					<li><br/></li>
					<li><a class="btn btn-primary" 
						href="<c:url value='/Dxml' />">&nbsp;&nbsp;<b class="fa fa-download"></b>&nbsp;&nbsp;&nbsp;&nbsp; XML</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</li>
					<li><br/></li>	
					<li><a class="btn btn-primary" 
						href="<c:url value='/Dhtml' />">&nbsp;&nbsp;<b class="fa fa-download"></b>&nbsp;&nbsp; HTML</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</li> --%>
				</ul>
			</div>

			<div class="component">
				<table class="display"  id="testcasesTable">
					<thead>
						<tr>
							<th>&nbsp;Id</th>
							<th>&nbsp;Name</th>
							<th>&nbsp;Details&nbsp;</th>
							<th>&nbsp;Priority&nbsp;</th>						
							<th>&nbsp;State&nbsp;</th>
 							<th>&nbsp;Created By&nbsp;&nbsp;&nbsp;</th>
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
									<td>
										<b style="background-color: #45c672">Objective :&nbsp;</b>&nbsp;&nbsp;&nbsp;&nbsp;${testcase.objective}<br/>
										<b style="background-color: #45c672">Expected result :</b>&nbsp;${testcase.expectedresult}<br/>
										<b style="background-color: #45c672">Obtained result :</b>&nbsp;${testcase.obtainedresult}<br/>
									</td>
									<td>${testcase.prioritylevel}</td>
									<c:if test="${testcase.state == 'failed'}">
										<td style="color : #ce1616">
										${testcase.state}</td>
									</c:if>
									<c:if test="${testcase.state != 'failed'}">
										<td style="color : #01ba0e">
										${testcase.state}</td>
									</c:if>
									<c:forEach items="${listOfUsers}" var="qauser">
										<c:if test="${testcase.qauser.id == qauser.id }">
											<td>${qauser.fullname}</td>
										</c:if>
									</c:forEach>								
									<td>&nbsp;&nbsp;&nbsp;<a
										href="<c:url value='/editTestcase/${testcase.id}' />"
										class="fa fa-pencil fa-fw" role="button"></a>&nbsp;&nbsp;&nbsp;
									</td>
									<td>&nbsp;&nbsp;&nbsp;<a class="fa fa-eye fa-fw"
										href="<c:url value='/viewTestcase/${testcase.id}' />"
										role="button"></a>&nbsp;&nbsp;&nbsp;
									</td>
									<td>&nbsp;&nbsp;&nbsp;<a
										href="<c:url value='/deleteTestcase/${testcase.id}' />"
										class="fa fa-trash-o fa-fw" role="button"></a>&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		<%-- 	<div class="btn btn-info" style="float: right;">
				<a class="fa fa-download fa-2x" aria-hidden="true"
					style="float: right;" href="<c:url value='/addProject' />">Download</a>
			</div> --%>
		
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br /> <br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
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











	<!-- =========================               SCRIPTS          ============================== -->

	<!-- nav bar scripts  -->
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'
		type="text/javascript"></script>
	<script src='<c:url value="/resources/js/v-index.js"/> '
		type="text/javascript"></script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"
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
	        $('#testcasesTable').DataTable( {
	            dom: 'Brtip',
	            buttons: [
	                'copy', 'csv', 'excel', 'pdf', 'print'
	            ]
	        } );
	    } );
    </script>


</body>
</html>