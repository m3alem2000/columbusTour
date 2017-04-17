<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url value="/js" var="jsHref" />
			<script src="${jsHref}/maps.js"></script>
<div class="container-fluid">

	<div style="background-color: #f1f1f1; height:100%" class="row content">

		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
		<p><a href="newItinerary">New Itinerary</a></p>
		<p>Saved Itineraries</p>
		<c:forEach var="itineraries" items="${itineraries}">
			<c:url var="itineraryLink" value="/itineraryDetail">
				<c:param name="itineraryId" value="${itineraries.itineraryId}"/>
			</c:url>
				<p><a href="${itineraryLink}">${itineraries.itineraryId}</a></p>
		</c:forEach>
		</div>
		<!-- end links on the left of the homepage -->

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