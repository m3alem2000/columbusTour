<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url value="/js" var="jsHref" />
<script src="${jsHref}/mapSearch.js"></script>

<div class="container-fluid text-center">
	<div class="row content">
		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
			<c:url var="createItinerary"
<<<<<<< HEAD
				value="/users/${currentUser.username}/createItinerary" />
			<a href="${createItinerary}">
				<button type="button" class="btn btn-link">New Itinerary</button>
			</a><br>
			<br>
=======
				value="/users/${currentUser.username}/createNewItin" />
			<a href="${createItinerary}">
				<button type="button" class="btn btn-link">New Itinerary</button>
			</a> <br> <br>


>>>>>>> 9f5402bb086e435a7484c8423cdba946cc4add44
			<p>Saved Itineraries</p>


			<c:forEach var="itineraries" items="${itineraries}">
<<<<<<< HEAD
				<c:url var="itineraryLink" value="/itinerary">
=======
				<c:url var="itineraryLink"
					value="/users/${currentUser.username}/itinerary">
>>>>>>> 9f5402bb086e435a7484c8423cdba946cc4add44
					<c:param name="itineraryId" value="${itineraries.itineraryId}" />
				</c:url>
				<p>
					<a href="${itineraryLink}">${itineraries.itineraryName}</a>
				</p>
			</c:forEach>


			<p>Land Mark Search</p>
			<p>Search By Miles</p>
			<input id="user_miles" value="5" />
			<button onclick="pullLandmarkCoordsFromLandmark()">Search
				Map</button>
			<c:url var="updateItenUrl"
<<<<<<< HEAD
				value="/users/${currentUser.username}/registeredUser" />
			<form id="idForm" action="${updateItenUrl}" method="POST">
				<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}">
				<input type="hidden" name="itineraryId" value="${itinerary.itineraryId}"> 
					<input type="submit" value="Save Itinerary" onclick="submitIds()">
=======
				value="/users/${currentUser.username}/addLandmark2Itinerary" />
			<form id="idForm" action="${updateItenUrl}" method="POST">
				<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}">
				<input type="hidden" name="itineraryId"
					value="${itinerary.itineraryId}"> <input type="submit"
					value="Save Itinerary" onclick="submitIds()">
>>>>>>> 9f5402bb086e435a7484c8423cdba946cc4add44
			</form>
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
				var startLat = ${itinerary.startingLatitude};
				var startlng = ${itinerary.startingLongitude};
				function initMap() {
					// Constructor creates a new map - only center and zoom are required.
					map = new google.maps.Map(document.getElementById('map'), {
						center : {
							lat : startLat,
							lng : startlng
						},
						zoom : 13
					});
				}
			</script>
<<<<<<< HEAD
			<c:forEach var="itinerary" items="${itineraries}">
				<input type="hidden" id="userStartLat" type="number"
					value="${itinerary.startingLatitude}" />
				<input type="hidden" id="userStartLong" type="number"
					value="${itinerary.startingLongitude}" />
			</c:forEach>
			<!--  -->
=======
				<input type="hidden" id="userStartLat" type="number" value="${itinerary.startingLatitude}" />
				<input type="hidden" id="userStartLong" type="number" value="${itinerary.startingLongitude}" />
>>>>>>> 9f5402bb086e435a7484c8423cdba946cc4add44
			<script>
		var landmarks = [
		<c:forEach var="landmark" items="${landmarks}">
			{
				id: ${landmark.landmarkId},
				name: '${landmark.landmarkName}',
				lat: ${landmark.latitude} ,
				lng: ${landmark.longitude},
				rating: ${landmark.landmarkRating},
				pictureUrl: '${landmark.landmarkPicture}',
				description: '${landmark.description}'
			},
		</c:forEach>
		];
		</script>
			<c:url value="/js" var="jsHref" />
			<script src="${jsHref}/maps.js"></script>
			<script async defer
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp3v8bo_hTpRITrBYWJD5bzzKO3QEZWkg&v=3&callback=initMap">
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