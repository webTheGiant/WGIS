<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.serviddio.gis.controller.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title align="center">Wgis</title>
<%
	HttpSession sess = request.getSession(false);
	if (sess != null) {
		sess.invalidate();
		sess = request.getSession(true);

	}
%>


</head>


<body align="center">
	<header>
		<h2>Welcome to Wonderful GIS</h2>
	</header>



	<div>Now you will be redirected to Main Page</div>
	<div>Have a nice day</div>


	<script>
		window.setTimeout("location=('./Gis');", 5000);
	</script>
</body>
</html>
