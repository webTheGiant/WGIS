<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.File,com.serviddio.gis.model.*, com.serviddio.gis.controller.SessionCounter"%>

<!DOCTYPE html>
<html>
<head>
<title>Wonderful GIS</title>



<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">


<link rel="stylesheet"
	href="http://openlayers.org/en/v3.15.1/css/ol.css">
<link rel="stylesheet" href="./assets/css/custom.css">




<script src="http://openlayers.org/en/v3.15.1/build/ol.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<%
	UserLog utente = (UserLog)request.getSession().getAttribute("user");
   if(SessionCounter.isNull)
	   request.getSession().invalidate();
	   
%>


</head>
<body>

	<header>
		<h1 id="titleGis" align="center">Wonderful GIS</h1>
	</header>



	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle " data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">WGIS</a>

			</div>


			<div class=" navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="./index.jsp">Home <span
							class="sr-only">(current)</span></a></li>

					<li><a href="./Login">Sign in</a></li>
					<li><a href="./SignUp">Sign up</a></li>
					<% if(utente!=null && utente.isAdmin()){%>
					<li><a href="./ListUsers">Users-List</a></li>
					<%} %>
				</ul>
				<%if(utente!=null) {%>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="./Logout">Logout</a></li>
					<li><p id="signed_as" class="navbar-text">
							Signed as
							<%=utente.getEmail() %></p></li>
				</ul>
				<%} %>


			</div>
		</div>
	</nav>





	<div class="container-fluid">

		<div class="LocInfo">
			<p>
				position accuracy :
				<code id="accuracy"></code>
				&nbsp;&nbsp; altitude :
				<code id="altitude"></code>
				&nbsp;&nbsp; altitude accuracy :
				<code id="altitudeAccuracy"></code>
				&nbsp;&nbsp; heading :
				<code id="heading"></code>
				&nbsp;&nbsp; speed :
				<code id="speed"></code>
				&nbsp;&nbsp; resolution :
				<code id="resolution"></code>
			</p>

		</div>
	</div>

	<div class="jumbotron-fluid" style="background-color: inherit;">
		<div class="row" id="map-row">
			<div class="col-xs-9 col-md-9 col-lg-10">
				<div id="map" class="map"></div>
				<div id="popup"></div>
					
					
				
				<div id="scale-line" class="ol-scale-line"></div>

			</div>



			<div class="col-xs-2 col-md-2 col-lg-2">
				<div class="btn-group-vertical">

					<button type="button" class="btn " id="regioni">Regioni</button>
					<button type="button" class="btn" id="province">Province</button>
					<button type="button" class="btn" id="allerta_meteo">Allerta
						Meteo</button>
					<div id="info" style="display: none;"></div>
					<label> Show Position <input id="track" type="checkbox" /></label>
					<p id="info"></p>
					<button type="button" class="btn btn-info" id="legend">Nascondi Legenda</button>
					<img id="imgLegenda" src="/Wgis/assets/img/legend.jpg" />


					<script type="text/javascript" src="/Wgis/assets/js/start.js">
						
					</script>
					<script type="text/javascript"
						src="/Wgis/assets/js/regprovOnOff.js">
						
					</script>

					<script type="text/javascript" src="/Wgis/assets/js/geoLoc.js">
						
					</script>
					<script type="text/javascript" src="/Wgis/assets/js/user_pos.js">
						
					</script>
					<script type="text/javascript" src="/Wgis/assets/js/slideLegend.js">
						
					</script>


				</div>
			</div>

		</div>
	</div>




</body>
</html>