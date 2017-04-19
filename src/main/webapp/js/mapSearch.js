var map;
var startMark;
var radMiles;
var marker;
var markers = [];
var landmarkAr = [];
var locationCircles = [];





function haversine() {
	var radians = Array.prototype.map.call(arguments, function(deg) { return deg/180.0 * Math.PI; });
	var lat1 = radians[0], lon1 = radians[1], lat2 = radians[2], lon2 = radians[3];
	var R = 6372.8; // km
	var dLat = lat2 - lat1;
	var dLon = lon2 - lon1;
	var a = Math.sin(dLat / 2) * Math.sin(dLat /2) + Math.sin(dLon / 2) * Math.sin(dLon /2) * Math.cos(lat1) * Math.cos(lat2);
	var c = 2 * Math.asin(Math.sqrt(a));
	return R * c;
}
//haversine(lat1, lon1, lat2, lon2);

var idToAdd = [];

function clickMarker(marker) {
	var id = $(marker).val();
	
	if($(marker).is(':checked')) {
		// Add to list
		idToAdd.push(id);
	} else {
		// Remove
		for(var i = 0; i < idToAdd.length; i++) {
			if(idToAdd[i] === id) {
				idToAdd.splice(i, 1);
			}
		}
	}
	
	console.log(idToAdd);
}

function submitIds() {
	var form = $('#idForm');
	form.children('.idItem').remove();
	for(var i = 0; i < idToAdd.length; i++) {
		var input = $('<input>').addClass('idItem').attr('name', 'itenIds').attr('value', idToAdd[i]).attr('type', 'hidden');
		form.append(input);
	}
}

//DONE
function pullLandmarkCoordsFromLandmark() {	//pass the lankdmark list length
	clearOverlays();
	var lat1 = parseFloat($('#userStartLat').val());
	var lng1 = parseFloat($('#userStartLong').val());
	var startMark = new google.maps.LatLng(lat1, lng1);
	var userMiles = parseFloat($('#user_miles').val());
	var userMeter = 1609.344 * userMiles;
	var startPoint = "Starting Point";
	dropMarker(startMark, startPoint, userMeter);
	
	for(var i = 0; i < landmarks.length; i++) {
		var landmark = landmarks[i];
		var miles = haversine(lat1, lng1, landmark.lat, landmark.lng) / 1.609344;
		
		if(miles <= userMiles) {
			var contentString = 
			'<div style="width:300px" id="siteNotice">'+
				'<h5>'+landmark.name+'</h5>'+
				'<a href="#"><img style="width:200px" src=img/'+landmark.imageUrl+'></a><br>'+
				'<p><b>Description: </b>'+landmark.description+'</p>'+
				'<span>Add to Itinerary  </span>' +
				'<input class="landmarkCheckbox" type="checkbox" name="ids" value="'+landmark.id+'" onclick="clickMarker(this)"/>'+
			'</div>';
			var location = new google.maps.LatLng(landmark.lat, landmark.lng);
			dropMarker(location, contentString, 0);
		}
	}
}	


function clearOverlays() {
	for (var i = 0; i < markers.length; i++ ) {
		markers[i].setMap(null);
	}
	markers.length = 0;
	for (var i = 0; i < locationCircles.length; i++ ) {
		locationCircles[i].setMap(null);
	}
	locationCircles.length = 0;
}


//DONE
function initMap() {
	// Constructor creates a new map - only center and zoom are required.
	map = new google.maps.Map(document.getElementById('map'), {
		center: {lat: 39.993788, lng: -83.000574},
		zoom: 11
	});
	pullLandmarkCoordsFromLandmark();
};


//DONE
function dropMarker(coords, contentString, miles) {
	this.marker = new google.maps.Marker({
		position: coords,
		map: map,
		animation: google.maps.Animation.DROP 
	});  
	markers.push(marker);
	map.panTo(coords);

	marker.infoWindow = new google.maps.InfoWindow({
		content: contentString
	});

	marker.addListener('click', function() {
		this.infoWindow.open(map, this);
	});

	circle = new google.maps.Circle({
		strokeColor: '#FF0000',
		strokeOpacity: 0.8,
		strokeWeight: 2,
		fillColor: '#FF0000',
		fillOpacity: 0.35,
		map: map,
		center: coords,
		radius: miles,
	});
	locationCircles.push(circle);
};	    	  









//DONE
function dropPin() {
	if(marker != null) {
		marker.setMap(null);
		locationCircle.setMap(null);
	}
	this.startMark = new google.maps.LatLng(parseFloat($("#user_latitude").val()),parseFloat($("#user_longitude").val()));
	this.radMiles = 1609.33 * $("#user_miles").val();
	dropMarker(startMark, radMiles);
};


