<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="container-fluid">

	<div style="background-color: #f1f1f1; height:100%" class="row content">

		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
		<h4>Thinking of moving?</h4>
		<div class="tech-elevator-pic">
				<a href="https://www.columbus.gov/"><img src="img/Columbus USA.png" class="photo_image" style="width: 205px"/>	
		</div>
		<div class="tech-elevator-link">
		<a href="https://www.columbus.gov/">Come visit Columbus!</a>
		</div>
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

						<img src="img/${landmark.landmarkPicture}" class="photo_image" style="width: 150px">	
					</a>
				</div>			
				<br>
					<!-- <hr> -->
				
				<c:set var="count" value="${count + 1}" scope="page"/>
			</c:forEach>
		</div>
		
		<!-- end links on the left of the homepage -->

		<!-- body of the homepage -->
		<div class="col-sm-8 text-left">
		<!--  <input id="input-3" name="input-3" value="4" class="rating-loading">-->
			<div class="team-members">
			<h3>Our worldwide team:</h3>
			
			</div>
			
			<div class="about-pics">
			<div class="photo-image">
			<img src="img/Liel.jpg"  style="width: 200px">	
			<p>Liel Azrieli (Israel)</p>
			</div>
			
			<div class="photo-image">
			<img src="img/Devin.jpg"  style="width: 200px">	
			<p>Devin Distelhorst (United States)</p>
			</div>
			
			<div class="photo-image">
			<img src="img/Debora.jpg" style="width: 200px">	
			<p>Debora Lipetz (Brazil)</p>
			</div>
			
			<div class="photo-image">
			<img src="img/Mohammad.jpg" style="width: 200px">	
			<p>Mohammad Ramadan (Syria)</p>
			</div>
			</div>
			
			<div class="teamwork">
			<h5>This website was the culmination of a collaborative project by team Delta during the fina weeks of a Java Software Development Bootcamp.</h5>
			</div>
			
		</div>	
			
		<!-- end of body of the homepage -->

		<!-- Ads on the right of the homepage -->
		<c:import url="/WEB-INF/jsp/common/right.jsp" />
		<!--end of Ads on the right of the homepage  -->
	
</div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />