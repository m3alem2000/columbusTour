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
<ol class="reviewList">
		<c:forEach var="review" items="${reviews}">
			<li class="review">
				<span class="">${review.review}</span>
				<span class="">${review.landmarkId}</span>
				<form action="${deleteUrl}" method="POST">		
					<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
					<input type="hidden" name="reviewId" value="${review.reviewId}">
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