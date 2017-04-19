<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url value="/js/itineraryGoogleMap.js" var="jsHref" />
			<script src="${jsHref}"></script>
<div class="container-fluid" onload="initialize()" >

	<div style="background-color: #f1f1f1; height:100%" class="row content">

		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
		<p><a href="newItinerary">New Itinerary</a></p>
		<p>Saved Itineraries</p>
			
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

		</div>
		<!-- end links on the left of the homepage -->

		<!-- body of the homepage -->

			<div id="map"></div>
				<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp3v8bo_hTpRITrBYWJD5bzzKO3QEZWkg&v=3&callback=initialize">
       	 		</script>
			</div>
		<!-- end of body of the homepage -->

		<!-- Ads on the right of the homepage -->
			<c:import url="/WEB-INF/jsp/common/right.jsp" />
		<!--end of Ads on the right of the homepage  -->
	</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />