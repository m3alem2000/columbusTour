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
			<img id= "pic" class="land-image" src="./img/${landmarks.landmarkPicture}" />
		</div>
		
	<%-- 	<p id="landmark-rating">
			<c:out value="${landmarks.landmarkRating}" />
			<div class="prw_rup prw_common_bubble_rating" data-prwidget-name="common_bubble_rating" data-prwidget-init="">
			<span class="ui_bubble_rating bubble_45" style="font-size:14px;" alt="4.5 of 5 bubbles"></span>
			<div class="rating_div"> --%>
	<c:choose>
		<c:when test="${landmarks.landmarkRating == 5}">
			<img style="width:20px" src="img/5-star.png">
		</c:when>
		<c:when test="${landmarks.landmarkRating >4}">
			<img class="rating" src="img/4-star.png">
		</c:when>
		<c:when test="${landmarks.landmarkRating >3}">
			<img class="rating" src="img/3-star.png">
		</c:when>
		<c:when test="${landmarks.landmarkRating >2}">
			<img class="rating" src="img/2-star.png">
		</c:when>
		<c:otherwise>
			<img class="rating" src="img/1-star.png">
		</c:otherwise>
	</c:choose>
			
			</div>
		</p>
		
		<p id="landmark-address">
			<c:out value="${landmarks.address}" />
		</p>

		<p id="landmark-description">
			<c:out value="${landmarks.description}" />
		</p>
	</div>
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


<%--  link for landmarkSearchPage <c:url value="/landmarkDetail" var="landmarkDetailUrl">
 --%> 
 
<c:import url="/WEB-INF/jsp/common/footer.jsp" />