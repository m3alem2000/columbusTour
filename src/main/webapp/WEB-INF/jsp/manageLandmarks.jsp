<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div class="container-fluid">

	<div class="row content">

		<!-- links on the left of the homepage -->
			<div class="col-sm-2 text-left"></div> 
		<!-- end links on the left of the homepage -->

		<!-- body of the homepage -->
		<div class="col-sm-8 text-left">
			<h2 class="admin-title">Manage Landmarks</h2>
			<table class="landmarkList">
				<tr>
					<th>Landmark Name</th>
					<th>Landmark Id</th>
					<th>Address</th>
					<th>TopPick</th>
					<th>Details</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
				<c:forEach var="listLandmark" items="${landmarks}">
					<tr>
					<td>${listLandmark.landmarkName}</td>
					<td>${listLandmark.landmarkId}</td>
					<td>${listLandmark.address}</td>
					<td>${listLandmark.topPick}</td>
					<td>
						<c:url var="landmarkDetailsHref" value="/landmarkDetail"/>
						<form  class="form-fields" action="${landmarkDetailsHref}" method="GET">
							<input type="hidden" name="landmarkId" value="${listLandmark.landmarkId}"/>
							<input type="submit" value="More Details" />
						</form>
					</td>
					<td>
						<c:url var="landmarkUpdateHref" value="/users/${currentUser.username}/addOUpdateLandmark"/>
						<form action="${landmarkUpdateHref}" method="GET">
							<input type="hidden" name="landmark2Update" value="${listLandmark.landmarkId}"/>
							<input type="submit" value="Update" />
						</form>
					</td>
					<td>
						<c:url var="DeleteLandmarkHref" value="/users/${currentUser.username}/deleteLandmark"/>
						<form action="${DeleteLandmarkHref}" method="POST">		
						<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
						<input type="hidden" name="landmark2delId" value="${listLandmark.landmarkId}">
						<input type="submit" id="${review.reviewId}" class="deleteButton" value="In Activate">
				</form>
					</td>
					<%-- <li class=""><span class="">${listLandmark.landmarkName}</span>
						<span class="">${listLandmark.landmarkId}</span> <c:url
							var="landmarkDetails" value="/landmarkDetail" />
						<form action="${landmarkDetails}" method="GET">
							<input type="hidden" name="landmarkId"
								value="${listLandmark.landmarkId}" /> 
							<input type="submit" value="Landmark Details" />

						</form> <c:url var="landmarkUpdateUrl"
							value="/users/${currentUser.userName}/addOUpdateLandmark" />
						<form action="${landmarkUpdateUrl}" method="POST">
							<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> <input
								type="hidden" name="landmarkId"
								value="${listLandmark.landmarkId}"> <input type="submit"
								id="${review.reviewId}" class="deleteButton" value="Delete">
						</form> <c:url var="landmarkDeleteUrl"
							value="/users/${currentUser.userName}/DeleteLandmark" />
						<form action="${landmarkDeleteUrl}" method="POST">
							<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> <input
								type="hidden" name="landmarkId"
								value="${listLandmark.landmarkId}"> <input type="submit"
								id="${review.reviewId}" class="deleteButton" value="Delete">
						</form></li> --%>
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