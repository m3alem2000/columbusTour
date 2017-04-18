<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="container-fluid">

	<div style="background-color: #f1f1f1; height:100%" class="row content">

		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
		
			<c:set var="count" value="1" scope="page" />
			<c:forEach var="landmark" items="${landmarks}">
				<input type="hidden" name="landmarkId${count}" value="${landmark.landmarkId}"/>
				<input type="hidden" name="name${landmark.landmarkId}" value="${landmark.landmarkName}"/>
				<input type="hidden" name="latitude${landmark.landmarkId}" value="${landmark.latitude}"/>
				<input type="hidden" name="longitude${landmark.landmarkId}" value="${landmark.longitude}"/>
				<input type="hidden" name="landmarkRating${landmark.landmarkId}" value="${landmark.landmarkRating}"/>
				<input type="hidden" name="landmarkPicture${landmark.landmarkId}" value="${landmark.landmarkPicture}"/>
				<input type="hidden" name="description${landmark.landmarkId}" value="${landmark.description}"/>
				<div id="homePageSiteDescription">
					<span>
						${landmark.landmarkName}
					</span>
				</div>
				<div id="homePageSmallPic">
					<a href="javascript:show_detail(${count})" >
<<<<<<< HEAD
						<img src="img/${landmark.landmarkPicture}" class="photo_image" style="width: 150px">	
					</a>
				</div>			
				<br>
					<!-- <hr> -->
				
=======
						<img src="img/${landmark.landmarkPicture}" class="photo_image" style="width: 100px">	
					</a>				
>>>>>>> 632585e8274123abe445995963674313f4d11963
				<c:set var="count" value="${count + 1}" scope="page"/>
			</c:forEach>
		</div>
		
		<!-- end links on the left of the homepage -->

		<!-- body of the homepage -->
		<div class="col-sm-8 text-left">
		<!--  <input id="input-3" name="input-3" value="4" class="rating-loading">-->
			<!--  --><h3>Central Ohio's best places to visit</h3>
			<div id="map"></div>
			<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp3v8bo_hTpRITrBYWJD5bzzKO3QEZWkg&v=3&callback=initMap">

			</script>
			<c:url value="/js" var="jsHref" />
			<script src="${jsHref}/maps.js"></script>
		
		</div>
		<!-- end of body of the homepage -->

		<!-- Ads on the right of the homepage -->
		<c:import url="/WEB-INF/jsp/common/right.jsp" />
		<!--end of Ads on the right of the homepage  -->
	</div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />