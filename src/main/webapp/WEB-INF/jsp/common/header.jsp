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
						<img src="img/Delta_logo.png" alt="Delta Tour" width="120">
					</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="#welcome">Home</a></li>
						<li><a href="#features">Log In</a></li>
						<li><a href="#impact">Take me on a tour</a></li>
						<li><a href="#signup">Sign Up</a></li>
					</ul>
				</div>
			</div>
		</nav>
		
		<div class="jumbotron">
			<div class="container">
				<h1>Big Welcome Message</h1>
				<p>Ingenious marketing copy. And some more ingenious marketing copy. <a href="#features" class="btn btn-primary btn-lg">
					      Learn more <span class="glyphicon glyphicon-download"></span></a></p>
			</div>
		</div>
	
