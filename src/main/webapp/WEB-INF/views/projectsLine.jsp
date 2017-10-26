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

/* Popup container - can be anything you want */
.popup {
    position: relative;
    display: inline-block;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* The actual popup */
.popup .popuptext {
    visibility: hidden;
    width: 160px;
    background-color: #567a78;
    color: #fff;
    text-align: left;
    border-radius: 6px;
    padding: 8px 0;
    position: absolute;
    z-index: 1;
    bottom: 125%;
    left: 50%;
    margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #175091 transparent transparent transparent;
}

/* Toggle this class - hide and show the popup */
.popup .show {
    visibility: visible;
    -webkit-animation: fadeIn 1s;
    animation: fadeIn 1s;
}

/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn {
    from {opacity: 0;} 
    to {opacity: 1;}
}

@keyframes fadeIn {
    from {opacity: 0;}
    to {opacity:1 ;}
}
//projects pie chat css
@import url(http://fonts.googleapis.com/css?family=Droid+Sans|Droid+Sans+Mono);

.slice text {
   font-family: Droid Sans;
}</style>

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
						href="<c:url value='/addProject' />">&nbsp;&nbsp;<b class="fa fa-plus fa-fw" ></b>&nbsp;&nbsp; Project</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</li>
					<li><br/></li>	
					<li><a class="btn btn-info" 
						href="<c:url value='/projects' />">&nbsp;&nbsp;<b class="fa fa-eye fa-fw"></b>&nbsp;&nbsp; Projects</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</li>
					<li><br/></li>	
					<li><hr/></li>
					<li style="color:#fff;"><b> DOWNLOAD :</b></li>	
					<li><br/></li>
					<li><a class="btn btn-primary" 
						href="<c:url value='/Dpie' />">&nbsp;&nbsp;<b class="fa fa-download"></b>&nbsp;&nbsp;&nbsp;&nbsp; XML</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</li>
				</ul>
			</div>
					
			<div id="chart" class="component"></div>
						
		</div><!-- container ends -->
	</div>
	<!-- end section -->


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
		
	<!-- ----------------scripts for the graph------------------ -->
	<script src="//d3js.org/d3.v3.min.js" type="text/javascript"></script>

	<script>
	var w = 400;
	var h = 400;
	var r = h/2;
	var aColor = [
	    'rgb(178, 55, 56)',
	    'rgb(213, 69, 70)',
	    'rgb(230, 125, 126)',
	    'rgb(239, 183, 182)'
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

		
<!-- /* 		//mouse hover
		var e = document.getElementById('myGraph');
		e.onmouseover = function() {
		  document.getElementById('popup').style.display = 'block';
		}
		e.onmouseout = function() {
		  document.getElementById('popup').style.display = 'none';
		} */ -->
	
</body>
</html>