var geocoder;
var map;
var directionsDisplay;
var directionsService;

function initialize() {
// initMaps();
	directionsService = new google.maps.DirectionsService();
	directionsDisplay = new google.maps.DirectionsRenderer();


  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 11,
    center: new google.maps.LatLng(39.993788, -83.000574),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  
  directionsDisplay.setMap(map);
  var infowindow = new google.maps.InfoWindow();

  var marker, i;
  var request = {
    travelMode: google.maps.TravelMode.DRIVING
  };
  for (i = 0; i < locations.length; i++) {
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(locations[i][0], locations[i][1]),
    });
    
    var contentString = 
		'This is a new bit of text';

	marker.infoWindow = new google.maps.InfoWindow({
		content: contentString
	});

// google.maps.event.addListener(marker, 'click', (function(marker, i) {
// return function() {
// // infowindow.setContent(locations[i][0]);
// infowindow.setContent(locations[i][0]);
// infowindow.open(map, marker);
// }
// })(marker, i));

    if (i == 0) request.origin = marker.getPosition();
    else if (i == locations.length - 1) request.destination = marker.getPosition();
    else {
      if (!request.waypoints) request.waypoints = [];
      request.waypoints.push({
        location: marker.getPosition(),
        stopover: true
      });
    }

  }
  directionsService.route(request, function(response, status) {
	  if (status == google.maps.DirectionsStatus.OK) {
		  var bounds = new google.maps.LatLngBounds();
		  var route = response.routes[0];
		  startLocation = new Object();
		  endLocation = new Object();
		  
		  var path = response.routes[0].overview_path;
		  var legs = response.routes[0].legs;
		  for (i = 0; i < legs.length; i++) {
			  if(i == 0) {
				  // Set legs[i].start_address to the starting point
				  legs[i].start_address = 'Start Point'

			  } else if (i >0 && i< legs.length - 1) {
				// Set legs[i].start_address to the waypoint
				  legs[i].start_address = 
						'<div width="350" id="siteNotice">'+
						'<h5>'+itinDetail[i-1][0]+'</h5>'+
						'<img style="width:200px" src=img/'+itinDetail[i-1][2]+'><br>'+
						'<p><b>Description: </b>'+itinDetail[i-1][1]+'</p>'+
						'<a href="landmarkDetail?landmarkId='+itinDetail[i-1][4]+'">See details</a>'+
						'</div>';
			  }
			  else {
				  // Set the legs[i].start_address to the way point
				  legs[i].end_address = 
					  '<div width="350" id="siteNotice">'+
						'<h5>'+itinDetail[i][0]+'</h5>'+
						'<img style="width:200px" src=img/'+itinDetail[i][2]+'><br>'+
						'<p><b>Description: </b>'+itinDetail[i][1]+'</p>'+
						'<a href="landmarkDetail?landmarkId='+itinDetail[i][4]+'">See details</a>'+
						'</div>';
				  legs[i].start_address = 
					  '<div width="350" id="siteNotice">'+
						'<h5>'+itinDetail[i-1][0]+'</h5>'+
						'<img style="width:200px" src=img/'+itinDetail[i-1][2]+'><br>'+
						'<p><b>Description: </b>'+itinDetail[i-1][1]+'</p>'+
						'<a href="landmarkDetail?landmarkId='+itinDetail[i-1][4]+'">See details</a>'+
						'</div>';
			  }
		  }
		  directionsDisplay.setDirections(response);
	  }
  });
}