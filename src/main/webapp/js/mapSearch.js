var map;
var startMark;
var radMiles;
var marker;
var markers = [];
var landmarkAr = [];
var locationCircle;




	
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
	for(var i = 0; i < 21; i++) {
		var lat1 = parseFloat($('#userStartLat').val());
		var lon1 = parseFloat($('#userStartLong').val());
		var lat2 = parseFloat($('[name=latitude'+i+']').val());
		var lon2 = parseFloat($('[name=longitude'+i+']').val());
		var miles = haversine(lat1, lon1, lat2, lon2) / 1609;
		var userMiles = $('user_miles').val();
		if(miles <= userMiles){
			var endMark = new google.maps.LatLng(lat2, lon2);
			marker(endMark, 0);
		}
	
	}
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
	function marker(coords, miles) {
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
		marker(startMark, radMiles);
	};


