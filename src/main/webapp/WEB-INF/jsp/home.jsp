
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<!DOCTYPE html>
<html lang="en">

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
        <div id="map"></div>
	    <script>
	      var map;
	      function initMap() {
	        // Constructor creates a new map - only center and zoom are required.
	        map = new google.maps.Map(document.getElementById('map'), {
	          center: {lat: 39.963788, lng: -83.000574},
	          zoom: 13
	        });
	      }
	    </script>
	
	    <script async defer
	        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp3v8bo_hTpRITrBYWJD5bzzKO3QEZWkg&v=3&callback=initMap">
	    	console.log("banana");
	    </script>
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







<c:import url="/WEB-INF/jsp/common/footer.jsp" />