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

<link rel="stylesheet"
	href='<c:url value="/resources/css/form-style.scss" />'>

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
//indented tree css
.axis path, .axis line {
    fill: none;
    stroke: #000;
    shape-rendering: crispEdges;
}

.x.axis path {
    display: none;
}

.line {
    fill: none;
    stroke: steelblue;
    stroke-width: 1.5px;
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
			<div class="loki-content">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">

						<div class="section" id="home">
							<!-- Top Navigation -->
							<h1 align="center" style="color: #fff;">
								Projects Data
							</h1>
							
							<div class="myButton">
								<ul>
								    <li><br/></li>
					     				<li><a class="btn btn-info" 
										href="<c:url value='/Project' />">&nbsp;<b class="fa fa-plus fa-fw" ></b>&nbsp;&nbsp; Project</a>&nbsp;&nbsp;&nbsp;&nbsp;
									</li>
									<li><br/></li>	
									<li><a class="btn btn-info" 
										href="<c:url value='/projects' />">&nbsp;<b class="fa fa-eye fa-fw"></b>&nbsp; Projects</a>&nbsp;&nbsp;&nbsp;
									</li>
									<li><br/></li>	
									<li><a class="btn btn-info" 
										href="<c:url value='/pie' />">&nbsp;&nbsp;<b class="fa fa-eye fa-fw"></b>&nbsp;&nbsp;&nbsp; Chart</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</li>
									<li><br/></li>	
									<li><hr/></li>
								</ul>
							</div>
						
							<div class="myBlock" id="myGraph" style="background-color: #fff;">
							    
							</div>

							<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
							<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
							
						</div>
					</div>
				</div>
			</div>
		</div>
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

	<script type="text/javascript">
	
	var data = [{
		"date":"2010-12-07",
		"Passed test cases":"50",
		"Failed test cases":"33",
		"No test cases":"5"
		},{
		"date":"2011-03-04",
		"Passed test cases":"91",
		"Failed test cases":"12",
		"No test cases":"22"
		},{
		"date":"2012-01-15",
		"Passed test cases":"60",
		"Failed test cases":"49",
		"No test cases":"30"
		},{
		"date":"2013-12-07",
		"Passed test cases":"50",
		"Failed test cases":"30",
		"No test cases":"25"
		},{
		"date":"2014-03-04",
		"Passed test cases":"100",
		"Failed test cases":"50",
		"No test cases":"59"
		},{
		"date":"2015-01-15",
		"Passed test cases":"67",
		"Failed test cases":"89",
		"No test cases":"10"
		},{
		"date":"2016-01-15",
		"Passed test cases":"16",
		"Failed test cases":"59",
		"No test cases":"43"
		},{
		"date":"2017-01-19",
		"Passed test cases":"79",
		"Failed test cases":"48",
		"No test cases":"21"
		}];

	var margin = {
	    top: 20,
	    right: 80,
	    bottom: 30,
	    left: 50
	},
	width = 960 - margin.left - margin.right,
	    height = 500 - margin.top - margin.bottom;

	var parseDate = d3.time.format("%Y-%m-%d").parse;

	var x = d3.time.scale()
	    .range([0, width]);

	var y = d3.scale.linear()
	    .range([height, 0]);

	var color = d3.scale.category10();

	var xAxis = d3.svg.axis()
	    .scale(x)
	    .orient("bottom");

	var yAxis = d3.svg.axis()
	    .scale(y)
	    .orient("left");

	var line = d3.svg.line()
	    .interpolate("basis")
	    .x(function (d) {
	    return x(d.date);
	})
	    .y(function (d) {
	    return y(d.temperature);
	});

	var svg = d3.select(" #myGraph ").append("svg")
	    .attr("width", width + margin.left + margin.right)
	    .attr("height", height + margin.top + margin.bottom)
	    .append("g")
	    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

	color.domain(d3.keys(data[0]).filter(function (key) {
	    return key !== "date";
	}));

	data.forEach(function (d) {
	    d.date = parseDate(d.date);
	});

	var cities = color.domain().map(function (name) {
	    return {
	        name: name,
	        values: data.map(function (d) {
	            return {
	                date: d.date,
	                temperature: +d[name]
	            };
	        })
	    };
	});

	x.domain(d3.extent(data, function (d) {
	    return d.date;
	}));

	y.domain([
	d3.min(cities, function (c) {
	    return d3.min(c.values, function (v) {
	        return v.temperature;
	    });
	}),
	d3.max(cities, function (c) {
	    return d3.max(c.values, function (v) {
	        return v.temperature;
	    });
	})]);
	/*llllll*/
	var legend = svg.selectAll('g')
    .data(cities)
    .enter()
    .append('g')
    .attr('class', 'legend');

  legend.append('rect')
    .attr('x', width - 20)
    .attr('y', function(d, i) {
      return i * 20;
    })
    .attr('width', 10)
    .attr('height', 10)
    .style('fill', function(d) {
      return color(d.name);
    });

  legend.append('text')
    .attr('x', width - 8)
    .attr('y', function(d, i) {
      return (i * 20) + 9;
    })
    .text(function(d) {
      return d.name;
    });
  /*llllll*/
	svg.append("g")
	    .attr("class", "x axis")
	    .attr("transform", "translate(0," + height + ")")
	    .call(xAxis);

	svg.append("g")
	    .attr("class", "y axis")
	    .call(yAxis)
	    .append("text")
	    .attr("transform", "rotate(-90)")
	    .attr("y", 6)
	    .attr("dy", ".71em")
	    .style("text-anchor", "end")
	    .text("Projects");

	var city = svg.selectAll(".city")
	    .data(cities)
	    .enter().append("g")
	    .attr("class", "city");

	city.append("path")
	    .attr("class", "line")
	    .attr("d", function (d) {
	    return line(d.values);
	})
	    .style("stroke", function (d) {
	    return color(d.name);
	});

	city.append("text")
	    .datum(function (d) {
	    return {
	        name: d.name,
	        value: d.values[d.values.length - 1]
	    };
	})
	    .attr("transform", function (d) {
	    return "translate(" + x(d.value.date) + "," + y(d.value.temperature) + ")";
	})
	    .attr("x", 3)
	    .attr("dy", ".35em")
	    .text(function (d) {
	    return d.name;
	});
	/*mouse*/
    var mouseG = svg.append("g")
    .attr("class", "mouse-over-effects");

  mouseG.append("path") // this is the black vertical line to follow mouse
    .attr("class", "mouse-line")
    .style("stroke", "black")
    .style("stroke-width", "1px")
    .style("opacity", "0");
    
  var lines = document.getElementsByClassName('line');

  var mousePerLine = mouseG.selectAll('.mouse-per-line')
    .data(cities)
    .enter()
    .append("g")
    .attr("class", "mouse-per-line");

  mousePerLine.append("circle")
    .attr("r", 7)
    .style("stroke", function(d) {
      return color(d.name);
    })
    .style("fill", "none")
    .style("stroke-width", "1px")
    .style("opacity", "0");

  mousePerLine.append("text")
    .attr("transform", "translate(10,3)");

  mouseG.append('svg:rect') // append a rect to catch mouse movements on canvas
    .attr('width', width) // can't catch mouse events on a g element
    .attr('height', height)
    .attr('fill', 'none')
    .attr('pointer-events', 'all')
    .on('mouseout', function() { // on mouse out hide line, circles and text
      d3.select(".mouse-line")
        .style("opacity", "0");
      d3.selectAll(".mouse-per-line circle")
        .style("opacity", "0");
      d3.selectAll(".mouse-per-line text")
        .style("opacity", "0");
    })
    .on('mouseover', function() { // on mouse in show line, circles and text
      d3.select(".mouse-line")
        .style("opacity", "1");
      d3.selectAll(".mouse-per-line circle")
        .style("opacity", "1");
      d3.selectAll(".mouse-per-line text")
        .style("opacity", "1");
    })
    .on('mousemove', function() { // mouse moving over canvas
      var mouse = d3.mouse(this);
      d3.select(".mouse-line")
        .attr("d", function() {
          var d = "M" + mouse[0] + "," + height;
          d += " " + mouse[0] + "," + 0;
          return d;
        });

      d3.selectAll(".mouse-per-line")
        .attr("transform", function(d, i) {
          console.log(width/mouse[0])
          var xDate = x.invert(mouse[0]),
              bisect = d3.bisector(function(d) { return d.date; }).right;
              idx = bisect(d.values, xDate);
          
          var beginning = 0,
              end = lines[i].getTotalLength(),
              target = null;

          while (true){
            target = Math.floor((beginning + end) / 2);
            pos = lines[i].getPointAtLength(target);
            if ((target === end || target === beginning) && pos.x !== mouse[0]) {
                break;
            }
            if (pos.x > mouse[0])      end = target;
            else if (pos.x < mouse[0]) beginning = target;
            else break; //position found
          }
          
          d3.select(this).select('text')
            .text(y.invert(pos.y).toFixed(2));
            
          return "translate(" + mouse[0] + "," + pos.y +")";
        });
    });
	</script>

</body>
</html>