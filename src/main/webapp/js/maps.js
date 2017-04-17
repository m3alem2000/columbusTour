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

	for (i = 0; i < 6; i++) { 
		var marker = new google.maps.Marker({
			map: map,
			draggable: true,
			animation: google.maps.Animation.DROP,
			position: {
				lat: parseFloat($('[name=latitude'+i+']').val()),
				lng: parseFloat($('[name=longitude'+i+']').val())
			}
		});

		var contentString = 
			'<div style="width:300px" id="siteNotice">'+
			'<h5>'+$('[name=name'+i+']').val()+'</h5>'+
			'<a href="#"><img style="width:200px" src=img/'+$('[name=landmarkPicture'+i+']').val()+'></a><br>'+
			'<p><b>Description: </b>'+$('[name=description'+i+']').val()+'</p>'+ 
			'<a href=\"http://localhost:8080/capstone/landmarkDetail?landmarkId=1"\">' +
			'</div>';

		marker.infoWindow = new google.maps.InfoWindow({
			content: contentString
		});

		marker.addListener('click', function() {
			this.infoWindow.open(map, this);
		});

		markers[i] = marker;
	}
}


//function text_truncate(str, length, ending) {
//if (length == null) {
//length = 100;
//}
//if (ending == null) {
//ending = '...';
//}
//if (str.length > length) {
//return str.substring(0, length - ending.length) + ending;
//} else {
//return str;
//}
//};



