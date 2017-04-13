<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div class="container-fluid">

	<div class="row content">

		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
		
		
		</div>
		<!-- end links on the left of the homepage -->


		<!-- body of the homepage -->
		<div class="col-sm-8 text-left">
		
		<section class="section">
		
	<h1 id="detail-title">${landmarks.landmarkName}</h1>

	<div class="landmark-detail">
		<div class="landmark-image">
			<c:set value="${landmarks.landmarkId}" var="landmarkId" />
			<img class="land-image" src="./img/${landmarks.landmarkPicture}" />
		</div>
		<p id="landmark-rating">
			<c:out value="${landmarks.landmarkRating}" />
		</p>
		
		<p id="landmark-address">
			<c:out value="${landmarks.address}" />
		</p>

		<p id="landmark-description">
			<c:out value="${landmarks.description}" />
		</p>
	</div>

	</section>
		
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