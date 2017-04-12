<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Columbus Landmark Tour</title>
  		<meta charset="utf-8">
 		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	    <script src="./js/jquery.min.js"></script>
	    <script src="./js/jquery.validate.min.js"></script>
	    <script src="./js/additional-methods.min.js "></script>
	    <script src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script>
	    <script src="./js/bootstrap.min.js"></script>
	    <!--  <script src="./js/validation.js"></script>-->
	    
	    <c:url var="cssHref" value="/css/site.css" />
		<link rel="stylesheet" type="text/css" href="${cssHref}">
			
</head>
	<body>
		<nav class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">
						<img src="img/delta_logo.gif" alt="Delta Tour" width="25%">
					</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<c:url var="loginHref" value="/login"/>
						<c:url var="signupHref" value="/signup"/>
						<c:url var="homeHref" value="/"/>
						<li><a href="${homeHref}">Home</a></li>
						<li><a href="${loginHref}">Log In</a></li>
						<li><a href="#impact">Take me on a tour</a></li>
						<li><a href="${signupHref}">Sign Up</a></li>
					</ul>
				</div>
			</div>
		</nav>
		
		<div class="jumbotron">
			<div class="container">
				<h1>Delta Tours are the Best!</h1>
				<p><a href="#features" class="btn btn-primary btn-lg">
					      See top 5 landmarks on map! <span class="glyphicon glyphicon-location"></span></a><br>
				Ingenious marketing copy. And some more ingenious marketing copy. </p>
			</div>
		</div>
