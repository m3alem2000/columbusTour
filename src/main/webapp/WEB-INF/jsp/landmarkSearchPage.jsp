<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<script src="./js/mapSearch.js"></script>
<div class="container-fluid">

	<div class="row content">
		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
			<c:url var="createItinerary"
				value="/users/${currentUser.username}/createItinerary" />
			<a href="${createItinerary}" >
				<button type="button" class="btn btn-link">Create Itinerary</button>
			</a>
		</div>
		<!-- end links on the left of the homepage -->


		<!-- body of the homepage -->
		<div class="col-sm-8 text-left">
			<h2>Land Mark Search Page</h2>
			<input id="mile_radius" name="input_mile" value="5"
				class="mile_radius">
			<div id="map"></div>
			<script async defer
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp3v8bo_hTpRITrBYWJD5bzzKO3QEZWkg&v=3&callback=initMap">
				
			</script>
			<c:url value="/js" var="jsHref" />
			<script src="${jsHref}/maps.js"></script>
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
		<!--end of Ads on the right of the homepage  -->
	</div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />