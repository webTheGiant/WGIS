<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" >


<title>Wonderful GiS</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<%
  HttpSession sess = request.getSession();
  if(sess!= null &&(sess.getAttribute("user"))!=null)
  {
	  
	  System.out.println(request.getSession().getAttribute("user"));
	  response.sendRedirect("./Success");
  }
  else{
	  System.out.println("user sessione non trovato");
  
   %>
	<div class="container-fluid" style="padding: 12px;">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">WGIS Login</h3>
					</div>
					<div class="panel-body">
						<form accept-charset="UTF-8" action="Login" method="post"
							role="form">
							<fieldset>
								<div class="form-group">
									<input id="email "class="form-control" placeholder="yourmail@example.com"
										name="email" type="text">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password"
										name="password" type="password" value="">
								</div>
								<div class="checkbox">
									<label> <input name="remember" type="checkbox"
										value="Remember Me"> Remember Me
									</label>
								</div>
								<input id="sign" class="btn btn-lg btn-success btn-block" type="submit"
									value="Sign In">
							</fieldset>
						</form>
						<hr />

						<input class="btn btn-lg btn-facebook btn-block" type="submit"
							value="Login via facebook">
					</div>
				</div>
			</div>
		</div>
	</div>
	<%} %>
</body>