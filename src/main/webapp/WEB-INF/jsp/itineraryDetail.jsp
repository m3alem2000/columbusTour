<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url value="/js" var="jsHref" />
			<script src="${jsHref}/itineraryGoogleMap.js"></script>
<div class="container-fluid">

	<div style="background-color: #f1f1f1; height:100%" class="row content">

		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
		<a href="newItinerary"><p>New Itinerary</p></a>
		<p>Saved Itineraries</p>
		<c:set var="count" value="1" scope="page" />
		
			<c:forEach var="itinerariesDetail" items="${itinerariesDetail}">
				<input type="hidden" name="SLatitude" value="${itinerariesDetail.startingLatitude}"/>
				<input type="hidden" name="SLongitude" value="${itinerariesDetail.startingLongitude}"/>
				<input type="hidden" name="DLatitude${count}" value="${itinerariesDetail.destinationLatitude}"/>
				<input type="hidden" name="DLongitude${count}" value="${itinerariesDetail.destinationLongitude}"/>
				<c:set var="count" value="${count + 1}" scope="page"/>
			</c:forEach>
		
	<c:forEach var="itinerariesDetail" items="${itinerariesDetail}">
			<p>${itinerariesDetail.itineraryId}</p>
			<p>${itinerariesDetail.userId}</p>
			<p>${itinerariesDetail.startingLatitude}</p>
			<p>${itinerariesDetail.startingLongitude}</p>
			<p>${itinerariesDetail.destinationLatitude}</p>
			<p>${itinerariesDetail.destinationLongitude}</p>
			<p>${itinerariesDetail.userStartingPointId}</p>
			<p>${itinerariesDetail.dateCreated}</p>
			
	</c:forEach>
		</div>
		<!-- end links on the left of the homepage -->
					<a href="javascript:show_detail(${count})" >
						<img src="img/${landmark.landmarkPicture}" class="photo_image" style="width: 100px">	
					</a>
		<!-- body of the homepage -->
		<div class="col-sm-8 text-left">
			<div id="map"></div>
				<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp3v8bo_hTpRITrBYWJD5bzzKO3QEZWkg&v=3&callback=initMap">
       	 		</script>
			</div>
		<!-- end of body of the homepage -->

		<!-- Ads on the right of the homepage -->
			<c:import url="/WEB-INF/jsp/common/right.jsp" />
		<!--end of Ads on the right of the homepage  -->
	</div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />