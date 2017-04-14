<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="container-fluid text-center">
	<div class="row content">
		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
			<p>
				<c:url var="addLAndmarkhref" value="/users/${currentUser.username}/addLandmark"/>
				<a href="${addLAndmarkhref}">Add landmark form</a>
			</p>
			<p>
				<c:url var="cAllUsrs" value="/users/${currentUser.username}/cAllusrs"/>
				<a href="${cAllUsrs}">See all users</a>
			</p>
			<p>
				<c:url var="manageReviews" value="/users/${currentUser.username}/manageReviews"/>
				<a href="${manageReviews}">Manage Reviews</a>
			</p>
			<p>
				<c:url var="addAdmin" value="/users/${currentUser.username}/addAdmin"/>
				<a href="${addAdmin}">Add Admin</a>
			</p>
		</div>

		<div class="col-sm-8 text-left">

		</div>
		<!-- end of body of the homepage -->

		<!-- Ads on the right of the homepage -->
		<div class="col-sm-2 sidenav">
			<div class="well">
			
			</div>
		</div>

	</div>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />