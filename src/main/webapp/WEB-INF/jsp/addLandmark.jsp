<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container-fluid text-center">
	<div class="row content">

		<!-- links on the left of the page -->
		<div class="col-sm-2 sidenav"></div>
		<!-- end links on the left of the page -->

		<!-- body of the page -->
		<div class="col-sm-8 text-left">
			<h2>Edit your user profile:</h2>
			<c:url var="formAction"
				value="/users/${currentUser.username}/addLandmark" />
			<form id="user-profile" method="POST" action="${formAction}">
				<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}">

				<div class="form-group">
					<label for="LandmarkName">Landmark Name: </label> <input
						type="text" value="${landMark.landmarkName}" id="landmarkName"
						name="landmarkName" placeHolder="Landmark Name"
						class="form-control" />
				</div>

				<div class="form-group">
					<label for="LandmarkSubName">Landmark Sub Name: </label> <input
						type="text" value="${landMark.landmarkSubName}"
						id="landmarkSubName" name="landmarkSubName"
						placeHolder="Landmark Sub Name" class="form-control" />
				</div>

				<div class="form-group">
					<label for="landmarkPicture">Picture Path: </label> <input
						type="text" value="${currentUser.landmarkPicture}"
						id="landmarkPicture" name="landmarkPicture"
						placeHolder="Picture Path" class="form-control" />
				</div>

				<div class="form-group">
					<label for="landmarkRating">Landmark Rating: </label> <input
						type="text" value="${currentUser.landmarkRating}"
						id="landmarkRating" name="landmarkRating"
						placeHolder="Landmark Rating" class="form-control" />
				</div>

				<div class="form-group">
					<label for="latitude">Latitude: </label> <input type="text"
						value="${currentUser.latitude}" id="latitude" name="latitude"
						placeHolder="Latitude" class="form-control" />
				</div>

				<div class="form-group">
					<label for="longitude">Longitude: </label> <input type="text"
						value="${currentUser.longitude}" id="longitude" name="longitude"
						placeHolder="Longitude" class="form-control" />
				</div>

				<div class="form-group">
					<label for="state">State: </label> <input type="text"
						value="${currentUser.state}" id="state" name="state"
						placeHolder="State" class="form-control" />
				</div>

				<div class="form-group">
					<label for="city">City: </label> <input type="text"
						value="${currentUser.city}" id="city" name="city"
						placeHolder="City" class="form-control" />
				</div>

				<div class="form-group">
					<label for="zipCode">Zip Code: </label> <input type="text"
						value="${currentUser.zipCode}" id="zipCode" name="zipCode"
						placeHolder="Zip Code" class="form-control" />
				</div>

				<div class="form-group">
					<label for="address">Address: </label> <input type="text"
						value="${currentUser.address}" id="address" name="address"
						placeHolder="Address" class="form-control" />
				</div>

				<div class="form-group">
					<label for="description">Description: </label> <input type="text"
						value="${currentUser.description}" id="description"
						name="description" placeHolder="Description" class="form-control" />
				</div>

				<input type="submit" class="btn btn-default" value="Submit" />
			</form>
		</div>
		<!-- end of body of the page -->

		<div class="col-sm-2 sidenav"></div>


	</div>
</div>

