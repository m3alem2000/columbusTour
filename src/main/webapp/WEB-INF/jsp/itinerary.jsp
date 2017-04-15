<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="container-fluid">

	<div style="background-color: #f1f1f1; height:100%" class="row content">

		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
		<p>Select Starting Point:</p>
		<form>
			<select>
			  <option value="volvo">Volvo</option>
			  <option value="saab">Saab</option>
			  <option value="mercedes">Mercedes</option>
			  <option value="audi">Audi</option>
			</select>
		</form>
		</div>
		<!-- end links on the left of the homepage -->

		<!-- body of the homepage -->
		<div class="col-sm-8 text-left">
			<div id="map"></div>
				<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp3v8bo_hTpRITrBYWJD5bzzKO3QEZWkg&v=3&callback=initMap">
       	 		</script>
			</div>
		<!-- end of body of the homepage -->

		<!-- Ads on the right of the homepage -->
			<c:import url="/WEB-INF/jsp/common/right.jsp" />
		<!--end of Ads on the right of the homepage  -->
	</div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />