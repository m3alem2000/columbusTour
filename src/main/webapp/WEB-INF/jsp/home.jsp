<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="container-fluid text-center">

	<div class="row content">

		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
			<p>
				<a href="#">Link</a>
			</p>
			<p>
				<a href="#">Link</a>
			</p>
			<p>
				<a href="#">Link</a>
			</p>
		</div>
		<!-- end links on the left of the homepage -->
		
		<c:forEach var="landmarks" items="${landmarks}">
		<input type="hidden" name="name${landmarks.landmarkId}" value="${landmarks.landmarkName}"/>
		<input type="hidden" name="latitude${landmarks.landmarkId}" value="${landmarks.latitude}"/>
		<input type="hidden" name="longitude${landmarks.landmarkId}" value="${landmarks.longitude}"/>
		<input type="hidden" name="landmarkRating${landmarks.landmarkId}" value="${landmarks.landmarkRating}"/>
		<input type="hidden" name="landmarkPicture${landmarks.landmarkId}" value="${landmarks.landmarkPicture}"/>
			</c:forEach>

		<!-- body of the homepage -->
		<div class="col-sm-8 text-left">
			<div id="map"></div>
			<script async defer
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp3v8bo_hTpRITrBYWJD5bzzKO3QEZWkg&v=3&callback=initMap">
			      var marker;
			        marker = new google.maps.Marker({
			            map: map,
			            draggable: true,
			            animation: google.maps.Animation.DROP,
			            position: {
			            		lat: parseFloat($('[name=latitude1]').val()),
			            		lng: parseFloat($('[name=longitude1]').val())
			            	}
			        });
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