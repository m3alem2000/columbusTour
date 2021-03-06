<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url value="/js" var="jsHref" />
<script src="${jsHref}/mapSearch.js"></script>

<div class="container-fluid">

	<div style="background-color: #f1f1f1; height: 100%" class="row content">
		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
		<h3>Create Itinerary</h3><br>

			<c:url var="updateItenUrl" value="/users/${currentUser.username}/createItinerary" />
			<form action="${createAStartPoint}" method="POST" id="createItinForm">
				<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
				<span>Name your itinerary</span><br>
				<input type="text" name="itineraryName"><br><br>
				<span>Starting address / click on map</span><br>
				<input type="text" name="itineraryAddress" id="address" onFocus="geolocate()"> <br><br><br>
				<input type="hidden" name="userId" value="${currentUser.userId}"> 
				<input type="hidden" name="startingLatitude" id="latitude"> 
				<input type="hidden" name="startingLongitude" id="longitude"> 
				<input type="submit" value="Create Itinerary" onclick="submitIds()">
			</form>
		</div>

		<script>
			var locations = [
					[
							<c:out value="${itinerariesDetail[0].startingLatitude}"/>,
							<c:out value="${itinerariesDetail[0].startingLongitude}"/> ],
					<c:forEach var="itin" items="${itinerariesDetail}" >[
							<c:out value="${itin.destinationLatitude}"/>,
							<c:out value="${itin.destinationLongitude}"/>],
					</c:forEach> ];
		</script>


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
		</c:forEach>
		];
		</script>




		<script type="text/javascript">
			$(document).ready(function() {

				$("#createItinForm").validate({
					ignore: [],
					groups: {
				        locationGroup: "startingLatitude startingLongitude"
				    },
					rules : {
						itineraryName : {
							required : true
						},
						userId : {
							required : true
						},
						startingLatitude : {
							required : true,
						},
						startingLongitude : {
							required : true,
						}
					},
					messages : {
						itineraryName : {
							required : "Give your itinerary a name"
						},
						startingLatitude : {
							required : "No starting point was chosen"
						},
						startingLongitude : {
							required : "No starting point was chosen"
						}
					},
					errorClass : "error"
				});

			});
		</script>
		<!-- end links on the left of the homepage -->


		<!-- body of the homepage -->
		<div class="col-sm-8 text-left">
			
			Search Landmarks By Radius: 
			<input id="user_miles" value="5" />
			<button onclick="pullLandmarkCoordsFromLandmark()">Search
				Map</button>
			<div id="map"></div>

		</div>
		<!-- end of body of the homepage -->

		<!-- Ads on the right of the homepage -->
		<div class="col-sm-2 sidenav">
			<c:import url="/WEB-INF/jsp/common/right.jsp" />
		</div>
		<!--end of Ads on the right of the homepage  -->
	</div>
</div>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp3v8bo_hTpRITrBYWJD5bzzKO3QEZWkg&v=3&libraries=places&callback=initMapSearch">
	
</script>
<c:url value="/js" var="jsHref" />
<script src="${jsHref}/maps.js"></script>
<script>
	var marker = null;
	var placeSearch, autocomplete;
	var componentForm = {
		street_number : 'short_name',
		route : 'long_name',
		locality : 'long_name',
		administrative_area_level_1 : 'short_name',
		country : 'long_name',
		postal_code : 'short_name'
	};

	function initAutocomplete() {
		// Create the autocomplete object, restricting the search to geographical
		// location types.
		autocomplete = new google.maps.places.Autocomplete(
		/** @type {!HTMLInputElement} */
		(document.getElementById('address')), {
			types : [ 'geocode' ]
		});

		// When the user selects an address from the dropdown, populate the address
		// fields in the form.
		autocomplete.addListener('place_changed', fillInAddress);
	}

	function fillInAddress() {
		// Get the place details from the autocomplete object.
		var place = autocomplete.getPlace();

		// TODO: AJAX!
		var address = place.formatted_address;
		var url = 'https://maps.googleapis.com/maps/api/geocode/json?address='
				+ encodeURI(address)
				+ '&key=AIzaSyCp3v8bo_hTpRITrBYWJD5bzzKO3QEZWkg';
		$.ajax({
			url : url
		}).done(function(data) {
			var location = data.results[0].geometry.location;
			acceptLatLong(location.lat, location.lng);
		}).fail(function(xhr, status, error) {
			console.log(error);
		});
	}

	function initMapSearch() {
		initMap();
		initAutocomplete();
		google.maps.event.addListener(map, 'click', function(event) {
			acceptLatLong(event.latLng.lat(), event.latLng.lng());
		});
	}

	function acceptLatLong(lat, lng) {
		$('#latitude').val(lat);
		$('#longitude').val(lng);

		var latLng = new google.maps.LatLng(lat, lng);

		if (marker == null) {
			marker = new google.maps.Marker({
				position : latLng,
				map : map
			});
		} else {
			marker.setPosition(latLng);
		}
	}

	function geolocate() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var geolocation = {
					lat : position.coords.latitude,
					lng : position.coords.longitude
				};
				var circle = new google.maps.Circle({
					center : geolocation,
					radius : position.coords.accuracy
				});
				autocomplete.setBounds(circle.getBounds());
			});
		}
	}
</script>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />