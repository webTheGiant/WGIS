<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<!DOCTYPE html>
<html>
<head>
<title>Wonderful WGIS</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/custom.css">

<link rel="stylesheet"
	href="http://openlayers.org/en/v3.15.1/css/ol.css">


<script src="http://openlayers.org/en/v3.15.1/build/ol.js"></script>


<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<%
	Object value = request.getSession().getAttribute("user");
%>


</head>
<body>

	<header>
		<h1 id="titleGis" align="center">Wonderful WGIS</h1>
	</header>
   
    
  
  <nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="./index.jsp">Home <span class="sr-only">(current)</span></a></li>
        <li><a href="./Login">Sign in</a></li>
         <li><a href="#">Sign up</a></li>
      </ul>
      <%if(value!=null) {%>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./Logout">Logout</a></li>
       <li><p id="signed_as" class="navbar-text">Signed as <%=value %></p></li>
      </ul>
      <%} %>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
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
			</p>

		</div>
	</div>

	<div class="jumbotron-fluid" style="background-color: inherit;">
		<div class="row" id="map-row">
			<div class="col-xs-10 col-md-10 col-lg-10">
				<div id="map" class="map"></div>
				<div id="scale-line" class="ol-scale-line"></div>

			</div>



			<div class="col-xs-2 col-md-2 col-lg-2">
				<div class="btn-group-vertical">

					<button type="button" class="btn " id="regioni">Regioni</button>
					<button type="button" class="btn" id="province">Province</button>
					<div id="info" style="display: none;"></div>
					<label> Show Position <input id="track" type="checkbox" /></label>
					<p id="info"></p>


					<script type="text/javascript" src="/Wgis/assets/js/start.js">
						
					</script>
					<script type="text/javascript"
						src="/Wgis/assets/js/regprovOnOff.js">
						
					</script>

					<script type="text/javascript" src="/Wgis/assets/js/geoLoc.js">
						
					</script>


				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			
			<%
				File img = new File("/home/stefano/workspace/Wgis/src/main/webapp/assets/img/allertaOggi.jpg");

				if (img.exists()) {
			%>

			
				<div class="col-xs-4 col-md-4 col-lg-4">
					<img type="image/tif" src="/Wgis/assets/img/allertaOggi.jpg">
				</div>
		
			<%
				}
			%>
			<div class="col-xs-2 col-md-2 col-lg-2">
				<img style="width: 200px; height: 300px;"
					
					src="http://www.protezionecivile.gov.it/resources/cms/images/legenda_bcr_5_d0.jpg">
			</div>


		</div>
	</div>
</body>
</html>