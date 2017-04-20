<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="container-fluid text-center">
	<div class="row content">

		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav"></div>
		<!-- end links on the left of the homepage -->

		<!-- body of the homepage -->
		<div id="signup-main" class="col-sm-8 text-left">
			<c:if test="${not empty messageLog}">
				<c:out value="${messageLog}" />
			</c:if>

			<c:url var="formAction" value="/signup" />
			<form id="new-user" method="POST" action="${formAction}">
				<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}">
				<h3>Please register so you can create your itinerary:</h3>
				<div class="form-group">
					<label for="userName">User Name: </label> <input type="text"
						id="userName" name="userName" placeHolder="User Name"
						class="form-control" />
				</div>

				<div class="form-group">
					<label for="email">E-mail: </label> <input type="text" id="email"
						name="email" placeHolder="E-mail" class="form-control" />
				</div>

				<div class="form-group">
					<label for="password">Password: </label> <input type="password"
						id="password" name="password" placeHolder="Password"
						class="form-control" />
				</div>
				<div class="form-group">
					<label for="password">Confirm password: </label> <input
						type="password" id="confirmPassword" name="confirmPassword"
						placeHolder="Confirm Password" class="form-control" />
				</div>
				<button type="submit" class="btn btn-default">Sign up</button>
			</form>
			<br>
			<br>
			<br>
			<br>
		</div>

		<!-- end of body of the homepage -->

		<!-- Ads on the right of the homepage -->
		<div class="col-sm-2 sidenav">
			<c:import url="/WEB-INF/jsp/common/right.jsp" />
		</div>
		<!--end of Ads on the right of the homepage  -->

	</div>
</div>







<c:import url="/WEB-INF/jsp/common/footer.jsp" />