<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="container-fluid text-center">    
  <div class="row content">
  
    <!-- links on the left of the homepage -->
    <div class="col-sm-2 sidenav">
      
    </div>
    <!-- end links on the left of the homepage -->
    
    <!-- body of the homepage -->
    <div class="col-sm-8 text-left"> 
<%-- 		<c:url var="formAction" value="/users/${currentUser.username}/login" />
 --%>		
 			<c:url var="formAction" value="/login"/>
 			<form id="new-user" method="POST" action="${formAction}">
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
			<input type="hidden" name="destination" value="${param.destination}" />
			<div class="form-group">
				<label for="email">E-mail: </label>
				<input type="text" id="email" name="email" placeHolder="E-mail" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="password">Password: </label>
				<input type="password" id="password" name="password" placeHolder="Password" class="form-control" />
			</div>
			<button type="submit" class="btn btn-default">Login</button>
		</form>
</div>

    <!-- end of body of the homepage -->
    
    <!-- Ads on the right of the homepage -->
      	<div class name="techelevator-right">
      	<c:import url="/WEB-INF/jsp/common/right.jsp" />
      </div>
    <!--end of Ads on the right of the homepage  -->
    
  </div>
</div>







<c:import url="/WEB-INF/jsp/common/footer.jsp" />