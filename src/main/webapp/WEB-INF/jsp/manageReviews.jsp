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
		<div id="manageReviews">
			<h2>Reviews posted</h2>
		</div>

		<table id="reviewTable" class="reviewsList">
			<tr>
				<th class="review-header">Username</th>
				<th>Date</th>
				<th>Review</th>
				<th>Landmark Id</th>
				<!-- <th>Landmark Details</th>
				<th>Delete</th> -->
			</tr>
			<c:forEach var="review" items="${reviews}">
				<tr>
					<td>${review.username}</td>
					<td>${review.formattedDateTime}</td>		
					<td>${review.review}</td>
					<td style="width:150px">${review.landmarkId}</td>
					<td><c:url var="landmarkFormAction" value="/landmarkDetail"/>
					<form action="${landmarkFormAction}" method="GET">
							<input type="hidden" name="landmarkId" value="${review.landmarkId}"/>
							<input type="submit" value="Landmark Details" />
							
						</form></td>
				
					<td><form action="${deleteUrl}" method="POST">		
							<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
							<input type="hidden" name="reviewId" value="${review.reviewId}">
							<input type="submit" id="${review.reviewId}" class="deleteButton" value="Delete">
						</form></td>
		
				</tr>
			</c:forEach>
		</table>
			
	</div>
		
<!-- end of body of the homepage -->

	</div>
	</div> 
	<br>
	<br>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />