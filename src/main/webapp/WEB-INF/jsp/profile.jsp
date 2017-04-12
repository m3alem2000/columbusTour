
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />



<div class="container-fluid text-center">    
  <div class="row content">
  
    <!-- links on the left of the homepage -->
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
    <!-- end links on the left of the homepage -->
  
  	 <!-- body of the homepage -->
  <div class="col-sm-8 text-left"> 
		<c:url var="formAction" value="/profile" />
   		<form id="user-profile" method="POST" action="${formAction}">
  			<div class="form-group">
				<label for="firstName">First Name: </label>
				<input type="text" id="firstName" name="firstName" placeHolder="First Name" class="form-control"/>
			</div>
			
			<div class="form-group">
			<label for="lastName">Last Name: </label>
				<input type="text" id="lastName" name="lastName" placeHolder="Last Name" class="form-control"/>
			</div>
			
			<div class="form-group">
				<label for="address">Address: </label>
				<input type="text" id="address" name="address" placeHolder="Address" class="form-control" />
			</div>
   
   			<div class="form-group">
				<label for="address">City: </label>
				<input type="text" id="city" name="city" placeHolder="city" class="form-control" />
			</div>
			
			<div class="form-group">
				<label for="address">State: </label>
				<input type="text" id="state" name="state" placeHolder="State" class="form-control" />
			</div>
			
			<div class="form-group">
				<label for="address">Zip Code: </label>
				<input type="text" id="zipCode" name="zipCode" placeHolder="Zip Code" class="form-control" />
			</div>
			
			<div class="form-group">
				<label for="address">Phone Number: </label>
				<input type="text" id="zipCode" name="zipCode" placeHolder="Zip Code" class="form-control" />
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
			</form>
   </div>
     <!-- end of body of the homepage -->
    
     <!-- Ads on the right of the homepage -->
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
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