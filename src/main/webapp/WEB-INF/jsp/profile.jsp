<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="container-fluid text-center">
	<div class="row content">

		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav"></div>
		<!-- end links on the left of the homepage -->

		<!-- body of the homepage -->
		<div class="col-sm-8 text-left">
			<!-- Complete if coming from signup Edit if from currentuser -->
			<h2>Edit your user profile:</h2>
			<c:url var="formAction"
				value="/users/${currentUser.username}/profile" />
			<form id="user-profile" method="POST" action="${formAction}">
				<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}">

				<div class="form-group">
					<label for="firstName">First Name: </label> <input type="text"
						value="${currentUser.firstName}" id="firstName" name="firstName"
						placeHolder="First Name" class="form-control" />
				</div>

				<div class="form-group">
					<label for="lastName">Last Name: </label> <input type="text"
						value="${currentUser.lastName}" id="lastName" name="lastName"
						placeHolder="Last Name" class="form-control" />
				</div>

				<div class="form-group">
					<label for="address">Address: </label> <input type="text"
						value="${currentUser.address}" id="address" name="address"
						placeHolder="Address" class="form-control" />
				</div>

				<div class="form-group">
					<label for="city">City: </label> <input type="text" id="city"
						value="${currentUser.city}" name="city" placeHolder="city"
						class="form-control" />
				</div>

				<div class="form-group">
					<label for="state">State: </label> <input type="text" id="state"
						value="${currentUser.state}" name="state" placeHolder="State"
						class="form-control" />
				</div>

				<div class="form-group">
					<label for="zipCode">Zip Code: </label> <input type="text"
						value="${currentUser.zipCode}" id="zipCode" name="zipCode"
						placeHolder="Zip Code" class="form-control" />
				</div>

				<div class="form-group">
					<label for="phone">Phone Number: </label> <input type="text"
						value="${currentUser.phoneNumber}" id="phone" name="phoneNumber"
						placeHolder="Cell Phone" class="form-control" />
				</div>
				<input type="submit" class="btn btn-default" value="Submit" />
			</form>
		</div>
		<!-- end of body of the homepage -->

		<!-- Ads on the right of the homepage -->
		<div class="col-sm-2 sidenav">
			<div class="well">
				<p>ADS</p>
				<p>
					Want to make<br> an awesome<br> web app <br>like
					this?
				</p>
				<a href="#">Tech Elevator link</a>
			</div>
			<div class="well">
				<p>ADS</p>
			</div>
		</div>
		<!--end of Ads on the right of the homepage  -->


	</div>
</div>
<br>
<br>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />