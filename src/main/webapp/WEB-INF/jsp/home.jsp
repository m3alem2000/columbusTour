<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="container-fluid">

	<div class="row content">

		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
			<c:forEach var="landmarks" items="${landmarks}">
				<input type="hidden" name="name${landmarks.landmarkId}" value="${landmarks.landmarkName}"/>
				<input type="hidden" name="latitude${landmarks.landmarkId}" value="${landmarks.latitude}"/>
				<input type="hidden" name="longitude${landmarks.landmarkId}" value="${landmarks.longitude}"/>
				<input type="hidden" name="landmarkRating${landmarks.landmarkId}" value="${landmarks.landmarkRating}"/>
				<input type="hidden" name="landmarkPicture${landmarks.landmarkId}" value="${landmarks.landmarkPicture}"/>
				<input type="hidden" name="description${landmarks.landmarkId}" value="${landmarks.description}"/>
				
			<a href="javascript:show_detail()">${landmarks.landmarkName}<br>
			<img src="img/${landmarks.landmarkPicture}" class="photo_image" style="width: 100px">				
			</a><hr>
			</c:forEach>
		</div>
		<!-- end links on the left of the homepage -->

		<!-- body of the homepage -->
		<div class="col-sm-8 text-left">
		<input id="input-3" name="input-3" value="4" class="rating-loading">
			<div id="map"></div>
			<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp3v8bo_hTpRITrBYWJD5bzzKO3QEZWkg&v=3&callback=initMap">

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
		<!--end of Ads on the right of the homepage  -->
	</div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />