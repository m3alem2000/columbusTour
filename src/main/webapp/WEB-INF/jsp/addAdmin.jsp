<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add system Admin</title>
</head>
<body>
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 text-left"></div>
			<!-- body of the homepage -->
			<div class="col-sm-8 text-left">
				<!-- Complete if coming from signup Edit if from currentuser -->
				<h2 class="admin-title">Add System Admin</h2>
				<c:url var="formAction"
					value="/users/${currentUser.username}/addAdmin" />

				<form class="form-fields" id="new-user" method="POST" action="${formAction}">
					<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}">

					<div class="form-group">
						<label for="userName">User Name: </label> <input type="text"
							id="userName" name="username" placeHolder="userName"
							class="form-control" />
					</div>
					<div class="form-group">
						<label for="email">E-mail: *</label> <input type="text" id="email"
							name="email" placeHolder="E-mail" class="form-control" />
					</div>
					<div class="form-group">
						<label for="password">Password: *</label> <input type="password"
							id="password" name="password" placeHolder="Password"
							class="form-control" />
					</div>
					<div class="form-group">
						<label for="password">Confirm password: *</label> <input
							type="password" id="confirmPassword" name="confirmPassword"
							placeHolder="Confirm Password" class="form-control" />
					</div>
					<div class="form-group">
						<label for="firstName">First Name: </label> <input type="text"
							id="firstName" name="firstName" placeHolder="First Name"
							class="form-control" />
					</div>

					<div class="form-group">
						<label for="lastName">Last Name: </label> <input type="text"
							id="lastName" name="lastName" placeHolder="Last Name"
							class="form-control" />
					</div>

					<div class="form-group">
						<label for="address">Address: </label> <input type="text"
							id="address" name="address" placeHolder="Address"
							class="form-control" />
					</div>

					<div class="form-group">
						<label for="address">City: </label> <input type="text" id="city"
							name="city" placeHolder="city" class="form-control" />
					</div>

					<div class="form-group">
						<label for="address">State: </label> <input type="text" id="state"
							name="state" placeHolder="State" class="form-control" />
					</div>

					<div class="form-group">
						<label for="address">Zip Code: </label> <input type="text"
							id="zipCode" name="zipCode" placeHolder="Zip Code"
							class="form-control" />
					</div>

					<div class="form-group">
						<label for="address">Phone Number: </label> <input type="text"
							id="phone" name="phoneNumber" placeHolder="Cell Phone"
							class="form-control" />
					</div>
					<input type="submit" class="btn btn-default" value="Submit" />
				</form>
				<br> <br>
			</div>
			<!-- end of body of the homepage -->


		</div>
	</div>

</body>
</html>