var map;
var markers = [];
function show_detail(index) {
	markers[index].infoWindow.open(map, markers[index]);
}

function initMap() {
	// Constructor creates a new map - only center and zoom are required.
	map = new google.maps.Map(document.getElementById('map'), {
		center: {lat: 39.993788, lng: -83.000574},
		zoom: 11
	});

	infoWindow = new google.maps.InfoWindow;

	// Try HTML5 geolocation.
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
			var pos = {
					lat: position.coords.latitude,
					lng: position.coords.longitude
			};

		}, function() {
			handleLocationError(true, infoWindow, map.getCenter());
		});
	} else {
		// Browser doesn't support Geolocation
		handleLocationError(false, infoWindow, map.getCenter());
	}

	for (i = 0; i < 2; i++) { 
		var marker = new google.maps.Marker({
			map: map,
			draggable: true,
			animation: google.maps.Animation.DROP,
			position: {
				lat: parseFloat($('[name=DLatitude'+i+']').val()),
				lng: parseFloat($('[name=DLongitude'+i+']').val())
			}
		});

		marker.infoWindow = new google.maps.InfoWindow({
			content: contentString
		});

		marker.addListener('click', function() {
			this.infoWindow.open(map, this);
		});

		markers[i] = marker;
	}
}	
	
	
	
	
	
