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


//WIP	  
function pullLandmarkCoordsFromLandmark() {	
	clearOverlays();
	var lat1 = parseFloat($('#userStartLat').val());
	var lon1 = parseFloat($('#userStartLong').val());
	var startMark = new google.maps.LatLng(lat1, lon1);
	var userMiles = parseFloat($('#user_miles').val());
	var userMeter = 1609.344 * userMiles;
	dropMarker(startMark, userMeter);
	for(var i = 0; i < 21; i++) {
		var lat2 = parseFloat($('[name=latitude'+i+']').val());
		var lon2 = parseFloat($('[name=longitude'+i+']').val());
		var miles = haversine(lat1, lon1, lat2, lon2) / 1.609344;


		if(miles <= userMiles){
			var contentString = 
				'<div style="width:300px" id="siteNotice">'+
				'<h5>'+$('[name=name'+i+']').val()+'</h5>'+
				'<button>Add to Itinerary</button>' +
				'<a href="#"><img style="width:200px" src=img/'+$('[name=landmarkPicture'+i+']').val()+'></a><br>'+
				'<p><b>Description: </b>'+$('[name=description'+i+']').val()+'</p>'+
				'<c:url var="formAction" ' +
				'value="/users/${currentUser.username}/mapSearch" />'+
				'<form id="land-itin" method="POST" action="${formAction}">'+
				'<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}">'+
				'<input type="hidden" name="landmarkId" value="'+
				$('[name='+i+']').val()+
				'">' +
				'<input type="hidden" name="itineraryId" value="${itinerary.itineraryId}">'+
				'<div class="form-group">'+
				//'<a href="landmarkDetail?landmarkId='+$('[name=landmarkId'+i+']').val()+'">See details</a>'+
				'<input type="submit" class="btn btn-default" value="Add to itinerary" />'+
				'</div>';

//			<form id="user-profile" method="POST" action="${formAction}">
//			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}">

//			<div class="form-group">
//			<label for="userName">User Name: </label> 
//			<input type="text" id="userName"
//			name="username" placeHolder="userName" class="form-control" />
//			</div>
//			<input type="submit" class="btn btn-default" value="Submit" />
//			</form>
			var endMark = new google.maps.LatLng(lat2, lon2);
			dropMarker(endMark, contentString, 0);
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


