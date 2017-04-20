<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div class="container-fluid">

	<div class="row content">

		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav"></div>
		<!-- end links on the left of the homepage -->

		<!-- body of the homepage -->
		<div class="col-sm-8 text-left">
			<div class="landmark-detail">
				<h3 id="detail-title">${landmark.landmarkName}</h3>

				<c:set value="${landmark.landmarkId}" var="landmarkId" />
				<%-- <img src="<c:url value="./img/${landmark.landmarkPicture}"/>" /> --%>
				<img id="pic" class="land-image"
					src="./img/${landmark.landmarkPicture}" />
					
				<c:choose>
					<c:when test="${landmark.landmarkRating == 5}">
						<img class="rating" src="img/5-star.png">
					</c:when>
					<c:when test="${landmark.landmarkRating == 4}">
						<img class="rating" src="img/4-star.png">
					</c:when>
					<c:when test="${landmark.landmarkRating == 3}">
						<img class="rating" src="img/3-star.png">
					</c:when>
					<c:when test="${landmark.landmarkRating == 2}">
						<img class="rating" src="img/2-star.png">
					</c:when>
					<c:otherwise>
						<img class="rating" src="img/1-star.png">
					</c:otherwise>
				</c:choose>

				<p id="landmark-address">
					<c:out value="${landmark.address}" />
				</p>
	
				<p id="landmark-description">
					<c:out value="${landmark.description}" />
				</p>
				
				<p id="landmark-history">
					<c:out value="${landmark.history}" />
				</p>
				<c:choose>
					<c:when test="${landmark.website != null}">
						<p>
							Website: <a href="${landmark.website}"><c:out
									value="${landmark.website}" /> </a>
						</p>
					</c:when>
					<%-- <c:otherwise>
   
    	</c:otherwise> --%>
				</c:choose>


				<!--Add a hidden div with all the reviews that can be reveled and re-hide  -->
				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
				<script>
					$(document).ready(function() {
						$("button").click(function() {
							$("#reviews").toggle();
						});
					});
				</script>


				<button>Show/Hide reviews</button>
				<div id="reviews">
					<table>
						<c:forEach var="review" items="${reviews}">
							<tr>
 								<td>${review.formattedDateTime}</td>
 								<td>${review.review}</td>
								<td>
				<c:choose>
					<c:when test="${review.rating == 5}">
						<img class="rating" src="img/5-star.png">
					</c:when>
					<c:when test="${review.rating == 4}">
						<img class="rating" src="img/4-star.png">
					</c:when>
					<c:when test="${review.rating == 3}">
						<img class="rating" src="img/3-star.png">
					</c:when>
					<c:when test="${review.rating == 2}">
						<img class="rating" src="img/2-star.png">
					</c:when>
					<c:otherwise>
						<img class="rating" src="img/1-star.png">
					</c:otherwise>
				</c:choose></td>
							</tr>
							
						</c:forEach>
						<br>
					</table>
				</div>
				
				<div class="col-sm-8 text-left">
			<h2>Like a place? Leave a review and rating!</h2>
			<c:url var="addReview" value="/landmarkDetail" />
			<form action="${addReview}" method="POST" id="landmark-input">
				<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}">
				<input type="hidden" name="userId" value="${currentUser.userId}"> 
				<input type="hidden" name="landmarkId" value="${landmark.landmarkId}">
				<%-- <input type="hidden" name="username" value="${currentUser.username}">  --%> 
				<div class="form-group">
					<label for="LandmarkName">Review: *</label> 
					<input type="text" value="${review.review}" id="review"
						name="review" placeHolder="Write a review/No Foul Language Please"
						class="form-control" />
				</div>
				<div class="form-group">
				<label for="LandmarkName">Rating: *</label>
					<select name="rating">
					  <option value="${review.rating}">5</option>
					  <option value="${review.rating}">4</option>
					  <option value="${review.rating}">3</option>
					  <option value="${review.rating}">2</option>
					  <option value="${review.rating}">1</option>
					</select>
				</div>
				<input type="submit" class="btn btn-default" value="Submit" />
			</form>
		</div>

			</div>
		</div>


		<!-- end of body of the homepage -->

		<!-- Ads on the right of the homepage -->
		<div class="col-sm-2 sidenav">
			<c:import url="/WEB-INF/jsp/common/right.jsp" />
		</div>
		<!--end of Ads on the right of the homepage  -->
	</div>
</div>
<br>
<br>

<%--  link for landmarkSearchPage <c:url value="/landmarkDetail" var="landmarkDetailUrl">
 --%>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />