<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Columbus Landmark Tour</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- https://code.jquery.com/ to get the right urls for all the scripts-->
<c:url value="/js" var="jsHref" />
<script src="${jsHref}/jquery.min.js"></script>
<script
	type="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
<script src="${jsHref}/jquery.validate.min.js"></script>
<script
	type="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/additional-methods.min.js"></script>
<script src="${jsHref}/additional-methods.min.js "></script>
<!-- <script src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script> -->
<script src="${jsHref}/bootstrap.min.js"></script>
<!--  <script src="${jsHref}/validation.js"></script>-->

<c:url var="cssHref" value="/css/site.css" />
<link rel="stylesheet" type="text/css" href="${cssHref}">

</head>

<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<c:url var="homeHref" value="/" />
				<%-- <c:if test="${not empty currentUser}">
					<c:url var="homeHref" value="/users/${currentUser.username}/" />
				</c:if> --%>
				<a class="navbar-brand" href="${homeHref}"> <c:url
						var="logoHref" value="/img/delta_logo.gif" /> <img
					style="width: 60px" src="${logoHref}" alt="Delta Tour" width="25%">
				</a>
				
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<c:url var="homeHref" value="/" />
					<li class="active"><a href="${homeHref}">Home</a></li>

					<c:url var="aboutHref" value="/about" />
					<c:if test="${not empty currentUser}">
						<c:url var="aboutHref" value="/users/${currentUser.username}/about" />
					</c:if>
					<li><a href="${aboutHref}">About</a></li>

					<c:if test="${empty currentUser}">
						<c:url var="searchLandmarkHref" value="/searchLanmark" />
						<li><a href="${searchLandmarkHref}">Search Landmark</a></li>
						<c:url var="itineraryHref" value="/itinerary"/>
						<li><a href="${itineraryHref}">Itinerary</a> 
						<c:url var="suggestALandmark" value="/suggestALandmark"/>
						<li><a href="#">Suggest a Landmark</a></li>
					</c:if>

					<c:if test="${not empty currentUser}">
						<c:url var="searchLandmarkHref" value="/users/${currentUser.username}/searchLanmark" />
						<li><a href="${searchLandmarkHref}">Search Landmark</a></li>
						<c:url var="itineraryHref" value="/itinerary" />
						<li><a href="${itineraryHref}">Itinerary</a> 
						<c:url var="suggestALandmark" value="/users/${currentUser.username}/suggestALandmark" />
						<li><a href="#">Suggest a Landmark</a></li>
					</c:if>
				</ul>


				<ul class="nav navbar-nav navbar-right">
					<c:if test="${empty currentUser}">
						<c:url var="loginHref" value="/login" />
						<c:url var="signupHref" value="/signup" />
						<li><a href="${signupHref}"><span class="glyphicon"></span>
								Signup</a></li>
						<li><a href="${loginHref}"><span
								class="glyphicon glyphicon-log-in"></span> Login</a></li>
					</c:if>
					<c:if test="${not empty currentUser}">
						<c:url var="registeredUserProfileHref"
							value="/users/${currentUser.username}/profile" />
						<li><a href="${registeredUserProfileHref}"><span
								class="glyphicon"></span>Profile</a></li>
						<c:url var="registeredUserHref"
							value="/users/${currentUser.username}/registeredUser" />
						<li><a href="${registeredUserHref}"><span
								class="glyphicon"></span>${currentUser.username}</a></li>
						<c:url var="logOutHref" value="/logout" />
						<li><a href="${logOutHref}"><span
								class="glyphicon glyphicon-log-out"></span> LogOut</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<div class="jumbotron">
		<div class="container">
			<h1>
				<img style="width: 80px" src="${logoHref}" alt="Delta Tour"
					width="25%">Delta Tours are the Best!
			</h1>
		</div>
	</div>