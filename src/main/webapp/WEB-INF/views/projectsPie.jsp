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

<link rel="icon" href='<c:url value="/resources/images/fav.png" />'>

<!-- BOOTSTRAP AND ANIMATION -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/bootstrap.min.css" />'>
<link rel="stylesheet"
	href='<c:url value="/resources/css/bootstrap-theme.min.css" />'>

<!-- CUSTOM STYLESHEETS -->
<link rel="stylesheet" href='<c:url value="/resources/css/style.css" />'>
<link rel="stylesheet" href='<c:url value="/resources/css/component.css" />'>


<!-- FONTS -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/font-awesome.css" />'>

<style type="text/css">
/* css for button arrangement */
.myButton {
    float: left;
    max-width: 160px;
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

/* css for column arrangement */

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
</style>


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
						<li>&nbsp;&nbsp;&nbsp;</li>
						<li class="header-login-button"><a
							href="<c:url value='/logout' />" class="btn nav-button">LOGOUT</a>
						</li>
					</ul>
				</nav>
			</div>
		</header>
		<!-- ==========================header ends================================= -->

		<div class="container">
			<div class="myButton">
				<ul>
      				<li><a class="btn btn-info" 
						href="<c:url value='/addProject' />">&nbsp;&nbsp;<b class="fa fa-plus fa-fw" ></b>&nbsp;&nbsp;Project</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</li>
					<li><br/></li>	
					<li><a class="btn btn-info" 
						href="<c:url value='/projects' />"><b class="fa fa-eye fa-fw"></b>&nbsp;&nbsp; Projects</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</li>
					<li><br/></li>
					<li><a class="btn btn-info" 
						href="<c:url value='/graph' />">&nbsp;&nbsp;<b class="fa fa-eye fa-fw"></b>&nbsp;&nbsp; Graph</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</li>
					<li><br/></li>		
					<li><hr/></li>
					<%--<li style="color:#fff;"><b> DOWNLOAD :</b></li>	
					 <li><br/></li>
					<li><a class="btn btn-primary" 
						href="<c:url value='/Dpie' />">&nbsp;&nbsp;<b class="fa fa-download"></b>&nbsp;&nbsp;&nbsp;&nbsp; EXCEL</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</li> 
					<li><br/></li>
					<li><a class="btn btn-primary" 
						href="<c:url value='/Dpie' />">&nbsp;&nbsp;<b class="fa fa-download"></b>&nbsp;&nbsp;&nbsp;&nbsp; CSV</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</li>
					<li><br/></li>
					<li><a class="btn btn-primary" 
						href="<c:url value='/Dpie' />">&nbsp;&nbsp;<b class="fa fa-download"></b>&nbsp;&nbsp;&nbsp;&nbsp; PDF</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</li>--%>
				</ul>
			</div>
	
			<div class="myPie" >
				<div id="chart"></div>
				<table>
				    <caption><b>KEY</b></caption>
					<thead>
						<tr>
							<th>Projects</th>
							<th>Color</th>
						<tr>
					</thead>
					<tbody>
					<tr>
						<td style="background-color: #4f9bba"></td>
						<td>With passed test cases</td>
					<tr>
					<tr>
						<td style="background-color: rgb(195, 206, 70)"></td>
						<td>With failed test cases</td>
					<tr>
					<tr>
						<td style="background-color: #e67d7e "></td>
						<td>With no test cases</td>
					<tr>
					</tbody>
				</table>
			</div>
				
		</div><!-- container ends -->
	
	</div><!-- end section -->


	<!-- =========================                SECTION: FOOTER          ============================== -->
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


	<!-- =========================                SCRIPTS             ============================== -->

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
		
	<!-- ----------------scripts for the pie------------------ -->
	<script src="//d3js.org/d3.v3.min.js" type="text/javascript"></script>

	<script>
	var w = 300;
	var h = 300;
	var r = h/2;
	var aColor = [
	    'rgb(79, 155, 186)',
	    'rgb(195, 206, 70)',
	    'rgb(230, 125, 126)'
	]
	
	var myP = '${passed}';
	var dataP = JSON.parse(myP);
	var myF = '${failed}';
	var dataF = JSON.parse(myF);
	var myN = '${noCases}';
	var dataN = JSON.parse(myN);
	
	var data = [
	    dataP, 
	    dataF,
	    dataN
	];
	
	
	var vis = d3.select('#chart').append("svg:svg").data([data]).attr("width", w).attr("height", h).append("svg:g").attr("transform", "translate(" + r + "," + r + ")");
	
	var pie = d3.layout.pie().value(function(d){return d.value;});
	
	// Declare an arc generator function
	var arc = d3.svg.arc().outerRadius(r);
	
	// Select paths, use arc generator to draw
	var arcs = vis.selectAll("g.slice").data(pie).enter().append("svg:g").attr("class", "slice");
	arcs.append("svg:path")
	    .attr("fill", function(d, i){return aColor[i];})
	    .attr("d", function (d) {return arc(d);})
	;
	
	// Add the text
	arcs.append("svg:text")
	    .attr("transform", function(d){
	        d.innerRadius = 100; /* Distance of label to the center*/
	        d.outerRadius = r;
	        return "translate(" + arc.centroid(d) + ")";}
	    )
	    .attr("text-anchor", "middle")
	    .text( function(d, i) {return data[i].value + '%';})
	;
	</script>

	
</body>
</html>