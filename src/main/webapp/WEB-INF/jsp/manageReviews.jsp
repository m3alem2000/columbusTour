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
		<h2>Manage Reviews</h2>

<ul class="reviewList">		
	<c:forEach var="review" items="${reviews}">
			<li class="review">
			    <span class="">${review.username}</span>
			    
				<span class="">${review.review}</span>
				<span class="">${review.landmarkId}</span>
 				
				<c:url var="landmarkFormAction" value="/landmarkDetail"/>
				
				<form action="${landmarkFormAction}" method="GET">
					<input type="hidden" name="landmarkId" value="${review.landmarkId}"/>
					<input type="submit" value="Landmark Details" />
					
				</form>
				
				<form action="${deleteUrl}" method="POST">		
					<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
					<input type="hidden" name="reviewId" value="${review.reviewId}">
					<input type="submit" id="${review.reviewId}" class="deleteButton" value="Delete">
				</form>
			</li>
		</c:forEach>	
</ul>

			
	</div>
		
<!-- end of body of the homepage -->

	</div>
	</div> 
	<br>
	<br>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />