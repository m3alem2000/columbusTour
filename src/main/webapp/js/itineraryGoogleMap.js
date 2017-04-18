//<!DOCTYPE html>
//<html style="height:100%;width:100%">
//<head>
//<meta charset="UTF-8">
//<title>Insert title here</title>
//</head>
//
//<script type="text/javascript">
var geocoder;
var map;
var directionsDisplay;
var directionsService;
/* var locations = [
  ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
  ['Bondi Beach', -33.890542, 151.274856, 4],
  ['Coogee Beach', -33.923036, 151.259052, 5],
  ['Maroubra Beach', -33.950198, 151.259302, 1],
  ['Cronulla Beach', -34.028249, 151.157507, 3]
]; */

function initialize() {
	/*  initMaps(); */
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
//      position: new google.maps.LatLng(locations[i].latlng),

    });

    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function() {
        infowindow.setContent(locations[i][0]);
        infowindow.open(map, marker);
      }
    })(marker, i));

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
  directionsService.route(request, function(result, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(result);
    }
  });
}



//</script>

//<body style="height:100%;width:100%" onload="initialize()">
//<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp3v8bo_hTpRITrBYWJD5bzzKO3QEZWkg&v=3&callback=initialize">
//</script>
//<div style="height:100%;width:100%" id="map"></div>
//</body>
//</html>

//var map;
//var markers = [];
//function show_detail(index) {
//	markers[index].infoWindow.open(map, markers[index]);
//}
//
//function initMap() {
//	// Constructor creates a new map - only center and zoom are required.
//	map = new google.maps.Map(document.getElementById('map'), {
//		center: {lat: 39.993788, lng: -83.000574},
//		zoom: 11
//	});
//
//	infoWindow = new google.maps.InfoWindow;
//
//	// Try HTML5 geolocation.
//	if (navigator.geolocation) {
//		navigator.geolocation.getCurrentPosition(function(position) {
//			var pos = {
//					lat: position.coords.latitude,
//					lng: position.coords.longitude
//			};
//
//		}, function() {
//			handleLocationError(true, infoWindow, map.getCenter());
//		});
//	} else {
//		// Browser doesn't support Geolocation
//		handleLocationError(false, infoWindow, map.getCenter());
//	}
//
//	for (i = 0; i < 2; i++) { 
//		var marker = new google.maps.Marker({
//			map: map,
//			draggable: true,
//			animation: google.maps.Animation.DROP,
//			position: {
//				lat: parseFloat($('[name=DLatitude'+i+']').val()),
//				lng: parseFloat($('[name=DLongitude'+i+']').val())
//			}
//		});
//
//		marker.infoWindow = new google.maps.InfoWindow({
//			content: contentString
//		});
//
//		marker.addListener('click', function() {
//			this.infoWindow.open(map, this);
//		});
//
//		markers[i] = marker;
//	}
//}	
//	
//	
//	
//	
//	