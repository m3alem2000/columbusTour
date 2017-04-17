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
		<h2>Manage Landmarks</h2>
<ol class="landmarkList">
		<c:forEach var="listLandmark" items="${lenamarks}">
			<li class="">
				<span class="">${listLandmark.landmarkName}</span>
				<span class="">${listLandmark.landmarkId}</span>
				
				<c:url var="landmarkDetails" value="/landmarkDetail"/>
				<form action="${landmarkDetails}" method="GET">
					<input type="hidden" name="landmarkId" value="${listLandmark.landmarkId}"/>
					<input type="submit" value="Landmark Details" />
					
				</form>
				
				<c:url var="landmarkUpdateUrl" value="/users/${currentUser.userName}/addOUpdateLandmark"/>
				<form action="${landmarkUpdateUrl}" method="POST">		
					<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
					<input type="hidden" name="landmarkId" value="${listLandmark.landmarkId}">
					<input type="submit" id="${review.reviewId}" class="deleteButton" value="Delete">
				</form>
				
				<c:url var="landmarkDeleteUrl" value="/users/${currentUser.userName}/DeleteLandmark"/>
				<form action="${landmarkDeleteUrl}" method="POST">		
					<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
					<input type="hidden" name="landmarkId" value="${listLandmark.landmarkId}">
					<input type="submit" id="${review.reviewId}" class="deleteButton" value="Delete">
				</form>
			</li>
		</c:forEach>	
</ol>

			
	</div>
		
<!-- end of body of the homepage -->

	</div>
	</div> 
	<br>
	<br>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />