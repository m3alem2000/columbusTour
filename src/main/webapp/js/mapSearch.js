var map;
var startMark;
var radMiles;
var marker;
var markers = [];
var locationCircle;

var directionsService = new google.maps.DirectionsService;
//Create a renderer for directions and bind it to the map.
var directionsDisplay = new google.maps.DirectionsRenderer({map: map});
//Instantiate an info window to hold step text.
var stepDisplay = new google.maps.InfoWindow;

calculateAndDisplayRoute(directionsDisplay, directionsService, markers, stepDisplay, map);
//WIP
function calculateAndDisplayRoute(directionsDisplay, directionsService,
		markers, stepDisplay, map) {
	// First, remove any existing markers from the map.
	for (var i = 0; i < markerArray.length; i++) {
		markerArray[i].setMap(null);
	}


//	//WIP	  
//	function pullLandmarkCoordsFromItinerary() {
//	for(var ) {

//	}
//	}

	//DONE
	function initMap() {
		// Constructor creates a new map - only center and zoom are required.
		map = new google.maps.Map(document.getElementById('map'), {
			center: {lat: 39.993788, lng: -83.000574},
			zoom: 11
		});

	};
	//DONE
	function startPoint(coords, miles) {
		this.marker = new google.maps.Marker({
			position: coords,
			map: map,
			animation: google.maps.Animation.DROP 
		});  
		map.panTo(coords);

		locationCircle = new google.maps.Circle({
			strokeColor: '#FF0000',
			strokeOpacity: 0.8,
			strokeWeight: 2,
			fillColor: '#FF0000',
			fillOpacity: 0.35,
			map: map,
			center: coords,
			radius: miles,
		});
	};	    	  
	//DONE
	function dropPin() {
		if(marker != null) {
			marker.setMap(null);
			locationCircle.setMap(null);
		}
		this.startMark = new google.maps.LatLng(parseFloat($("#user_latitude").val()),parseFloat($("#user_longitude").val()));
		this.radMiles = 1609 * $("#user_miles").val();
		startPoint(startMark, radMiles);
	};

};
