<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<script type="text/javascript">
        function copy()
        {
            var sel = document.getElementById("DropDownList1");
            var text = sel.options[sel.selectedIndex].value;


            // Assigning selected value of DropDownList to a hidden TextArea
            document.getElementById("hdnTextBox").value = text;


            // Creating text range from hidden TextArea's content
            var CopiedTxt = document.getElementById("hdnTextBox").createTextRange();


            // Copying the teat range to clipboard
            CopiedTxt.execCommand("Copy");
        }
    </script>
<div class="container-fluid">

	<div class="row content">
		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
			<h3>Create Itinerary</h3>
			<form id="form" runat="server">
				<table>
					<col width="50">
					<col width="50">
					<tr>
						<td></td>
						<td>Starting address</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text"></td>
					<tr>
						<td>City</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>State</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>Zip</td>

						<td><input type="text"></td>
					</tr>
				</table>
				<br> <br>
				<p>Select Landmark</p>
				<select id="DropDownList1" name="landmark">
					<c:forEach var="allLandmarks" items="${allLandmarks}">
						<option value="${allLandmarks.landmarkSubName}">${allLandmarks.landmarkSubName}</option>
					</c:forEach>
				</select>
				
				<input id="Copy" type="button" value="Copy Url" runat="server"
					onclick="copy();" style="vertical-align: top;" />
<textarea id="hdnTextBox" cols="20" rows="2" style="display: none;"></textarea>
				<button id="add">More</button>
				<br> <br> <input type="submit">
			</form>
		</div>

		<!-- end links on the left of the homepage -->


		<!-- body of the homepage -->
		<div class="col-sm-8 text-left">


			<div id="map"></div>

		</div>
		<!-- end of body of the homepage -->

		<!-- Ads on the right of the homepage -->
		<div class="col-sm-2 sidenav">
			<c:import url="/WEB-INF/jsp/common/right.jsp" />
		</div>
		<!--end of Ads on the right of the homepage  -->
	</div>
</div>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp3v8bo_hTpRITrBYWJD5bzzKO3QEZWkg&v=3&libraries=places&callback=initMapSearch">
	
</script>
<c:url value="/js" var="jsHref" />

<c:import url="/WEB-INF/jsp/common/footer.jsp" />