<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url value="/js" var="jsHref" />
<script src="${jsHref}/mapSearch.js"></script>
<div class="container-fluid text-center">
	<div class="row content">
		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
		  <div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown Example
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">HTML</a></li>
      <li><a href="#">CSS</a></li>
      <li><a href="#">JavaScript</a></li>
    </ul>
  </div>
</div>
		
		
			<div id="itincreate">
		<c:url var="createItinerary" value="/users/${currentUser.username}/createItinerary" />
		<a href="${createItinerary}" >
		<button type="button" class="btn btn-link">New Itinerary</button>
		</div>
		</a><br><br><div class="savedItin">
			<p>Saved Itineraries</p>
			<c:forEach var="itineraries" items="${itineraries}">
				<c:url var="itineraryLink" value="/itinerary" >
				<c:param name="itineraryId" value="${itineraries.itineraryId}" />
				</c:url>
				<p>
					<a href="${itineraryLink}">${itineraries.itineraryName}</a>
				</p>
			</c:forEach>
				</div>
				<div id="searchLand">
			<h2>Land Mark Search</h2>
			<p>Search By Miles</p>
			<input id="user_miles" value="5"/>
			<button onclick="pullLandmarkCoordsFromLandmark()">Search Map</button>
	<c:url var="updateItenUrl" value="/users/${currentUser.username}/registeredUser"/>
			<form id="idForm" action="${updateItenUrl}" method="POST">
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}">
			<input type="hidden" name="itineraryId" value="${itinerary.itineraryId}">
			<input type="submit" value="Save Itinerary" onclick="submitIds()">
			</form>		
			</div>
			
			
		</div>
			<script>
			var locations = [
				[
					 <c:out value="${itinerariesDetail[0].startingLatitude}"/>,
					 <c:out value="${itinerariesDetail[0].startingLongitude}"/>
				],
			<c:forEach var="itin" items="${itinerariesDetail}" >
				[
					 <c:out value="${itin.destinationLatitude}"/>,
					 <c:out value="${itin.destinationLongitude}"/>
				],
			</c:forEach>
			];
			</script>
			<script>
			var itinDetail = [
			<c:forEach var="itin" items="${itinerariesDetail}" >
				[
					<c:out value="${itin.itineraryName}"/>,
					<c:out value="${itin.description}"/>,
					<c:out value="${itin.landmarkPicture}"/>,
					<c:out value="${itin.landmarkRating}"/>
				],
			</c:forEach>
				];
			</script>

		<div class="col-sm-8 text-left">
			<div id="map"></div>
			<script>
				var map;
				function initMap() {
					// Constructor creates a new map - only center and zoom are required.
					map = new google.maps.Map(document.getElementById('map'), {
						center : {
							lat : 39.963788,
							lng : -83.000574
						},
						zoom : 13
					});
				}
			</script>
			<c:forEach var="itinerary" items="${itineraries}">
				<input type="hidden" id="userStartLat" type="number" value="${itinerary.startingLatitude}"/>
				<input type="hidden" id="userStartLong" type="number" value="${itinerary.startingLongitude}"/>
		</c:forEach><!--  -->
			<script>
		var landmarks = [
		<c:forEach var="landmark" items="${landmarks}">
			{
				id: ${landmark.landmarkId},
				name: '${landmark.landmarkName}',
				lat: ${landmark.latitude},
				lng: ${landmark.longitude},
				rating: ${landmark.landmarkRating},
				pictureUrl: '${landmark.landmarkPicture}',
				description: '${landmark.description}'
			},
				<%-- <input type="hidden" name="${landmark.landmarkId}" value="${landmark.landmarkId}"/>
				<input type="hidden" name="name${landmark.landmarkId}" value="${landmark.landmarkName}"/>
				<input type="hidden" name="latitude${landmark.landmarkId}" value="${landmark.latitude}"/>
				<input type="hidden" name="longitude${landmark.landmarkId}" value="${landmark.longitude}"/>
				<input type="hidden" name="landmarkRating${landmark.landmarkId}" value="${landmark.landmarkRating}"/>
				<input type="hidden" name="landmarkPicture${landmark.landmarkId}" value="${landmark.landmarkPicture}"/>
				<input type="hidden" name="description${landmark.landmarkId}" value="${landmark.description}"/> --%>
		</c:forEach>
		];
		</script>
		<c:url value="/js" var="jsHref" />
			<script src="${jsHref}/maps.js"></script>
			<script async defer
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp3v8bo_hTpRITrBYWJD5bzzKO3QEZWkg&v=3&callback=initMap">
				console.log("banana");
			</script>
		</div>
		<!-- end of body of the homepage -->

		<!-- Ads on the right of the homepage -->
		<div class="col-sm-2 sidenav">
			<div class="well">
				<p>ADS</p>
			</div>
			<div class="well">
				<p>ADS</p>
			</div>
		</div>

	</div>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />