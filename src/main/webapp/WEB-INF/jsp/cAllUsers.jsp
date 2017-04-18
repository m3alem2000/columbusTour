<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div id="manageUsersH2">
	<h2>See and Manage All Users</h2>
</div>

<table id="userListTable" class="usersList">
	<tr>
		<th>userId</th>
		<th>email</th>
		<th>username</th>
		<th>firstName</th>
		<th>lastName</th>
		<th>address</th>
		<th>city</th>
		<th>state</th>
		<th>zipCode</th>
		<th>phoneNumber</th>
		<th>isAdmin</th>
		<th>Delete</th>
	</tr>
	<c:forEach var="userFromList" items="${allUsers}">
		<tr>
			<td>${userFromList.userId}</td>
			<td>${userFromList.email}</td>
			<td>${userFromList.username}</td>
			<td>${userFromList.firstName}</td>
			<td>${userFromList.lastName}</td>
			<td>${userFromList.address}</td>
			<td>${userFromList.city}</td>
			<td>${userFromList.state}</td>
			<td>${userFromList.zipCode}</td>
			<td>${userFromList.phoneNumber}</td>
			<td><c:if test="${user.admin==true}">
					Admin
				</c:if></td>
			<td><c:url var="deleteUserUrl"
					value="/users/${currentUser.username}/cAllUsers" />
				<form action="${deleteUserUrl}" method="POST">
					<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> <input
						type="hidden" name="userToDeleteId" value="${userFromList.userId}">
					<input type="submit" class="deleteButton" value="Delete User">
				</form></td>

		</tr>
	</c:forEach>
</table>





<br>
<br>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />