<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<h2>See and Manage All Users</h2>


<table class="usersList">
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
	<c:forEach var="user" items="${allUsers}">
			<tr class="user">
			<td>${user.userId}</td>
			<td>${user.email}</td>
			<td>${user.username}</td>
			<td>${user.firstName}</td>
			<td>${user.lastName}</td>
			<td>${user.address}</td>
			<td>${user.city}</td>
			<td>${user.state}</td>
			<td>${user.zipCode}</td>
			<td>${user.phoneNumber}</td>
			<td>
				<%-- <c:if test="${user.isAdmin}">
					Admin
				</c:if> --%>
			</td>
			<td>
				<%-- <form action="${deleteUrl}" method="POST">		
					<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
					<input type="hidden" name="userId" value="${user.userId}">
					<input type="submit" id="${user.userId}" class="deleteButton" value="Delete">
				</form> --%>
			</td>

			</tr>
		</c:forEach>	
</table>





	<br>
	<br>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />