<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url value="/js/itineraryGoogleMap.js" var="jsHref" />
			<script src="${jsHref}"></script>
<div class="container-fluid" onload="initialize()">

	<div style="background-color: #f1f1f1; height: 100%"
		class="row content">

		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
			<c:url var="createItinerary"
				value="/users/${currentUser.username}/createItinerary" />
			<a href="${createItinerary}"> <span class="label label-default">New
					Itinerary</span>
			</a> <br> <br>
			<p><b>Saved Itineraries</b></p>
			<c:forEach var="itineraries" items="${itineraries}">
				<c:url var="itineraryLink" value="/users/${currentUser.username}/itinerary" >
				<c:param name="itineraryId" value="${itineraries.itineraryId}" />
				</c:url>
				<p>
					<a href="${itineraryLink}">${itineraries.itineraryName}</a>
				</p>
			</c:forEach>
			
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
					'<c:out value="${itin.landmarkName}"/>',
					'<c:out value="${itin.description}"/>',
					'<c:out value="${itin.landmarkPicture}"/>',
					<c:out value="${itin.landmarkRating}"/>,
					<c:out value="${itin.landmarkId}"/>
				],
			</c:forEach>
				];
			</script>
		</div>
		<!-- end links on the left of the homepage -->

		<!-- body of the homepage -->
		<div class="col-sm-8 text-left">
			<div id="map"></div>
			<script async defer
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp3v8bo_hTpRITrBYWJD5bzzKO3QEZWkg&v=3&callback=initialize">
				
			</script>
		</div>
		<!-- end of body of the homepage -->

		<!-- Ads on the right of the homepage -->
		<c:import url="/WEB-INF/jsp/common/right.jsp" />
		<!--end of Ads on the right of the homepage  -->
	</div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />