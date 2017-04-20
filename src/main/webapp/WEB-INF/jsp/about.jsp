<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url var="imgFolder" value="/img/" />
<div class="container-fluid text-center">

	<div style="background-color: #f1f1f1; height: 100%"
		class="row content">

		<!-- links on the left of the homepage -->
		<div class="col-sm-2 sidenav">
			<h4>Thinking of moving?</h4>
			<div class="tech-elevator-pic">
				<a href="https://www.columbus.gov/"> <img
					src="${imgFolder}Columbus USA.png" class="photo_image"
					style="width: 205px" />
				</a>
			</div>
			<div class="tech-elevator-link">
				<a href="https://www.columbus.gov/">Come visit Columbus!</a>
			</div>
		</div>

		<!-- end links on the left of the homepage -->

		<!-- body of the homepage -->
		<div class="col-sm-8 text-left">
			<!--  <input id="input-3" name="input-3" value="4" class="rating-loading">-->
			<div class="teamwork">
			
			<h5>Welcome to Columbus Landmarks! This webapp allows 
			visitors to Columbus, Ohio to map out a tour of the city based 
			on the best route from their hotel/starting point. If they wish, 
			they can plan multiple routes on different days from the same location. 
			The app offers the most efficient route to see as many local 
			landmarks as possible. It is ideal for the first time visitor who
			 does not have a feel for the lay of the land but wants to see
			  some of the city in a short amount of time. Go ahead and register 
			  so you can create your own itinerary. Enjoy your visit to Columbus!</h5>
			
			<h5>This webapp was the culmination of a collaborative project
					by team Delta during the final weeks of a full stack Java Software
					Development Bootcamp.</h5>
			</div>
			
			<div class="team-members">
				<h3>Our worldwide team:</h3>

			</div>

			<div class="about-pics">
				<div class="photo-image">
					<c:url var="imgLiel" value="/img/Liel1.jpg" />
					<img src="${imgLiel}" style="width: 200px">
					<p>Liel Azrieli (Israel)</p>
				</div>

				<div class="photo-image">
					<img src="${imgFolder}Devin.jpg" style="width: 200px">
					<p>Devin Distelhorst (United States)</p>
				</div>

				<div class="photo-image">
					<img src="${imgFolder}Debora.jpg" style="width: 200px">
					<p>Debora Lipetz (Brazil)</p>
				</div>

				<div class="photo-image">
					<img src="${imgFolder}Mohammad.jpg" style="width: 200px">
					<p>Mohammad Ramadan (Syria)</p>
				</div>
			</div>
		</div>
		<!-- end of body of the homepage -->

		<!-- Ads on the right of the homepage -->
		<c:import url="/WEB-INF/jsp/common/right.jsp" />
		<!--end of Ads on the right of the homepage  -->
	</div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />