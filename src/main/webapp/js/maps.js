	      var map;
	      function initMap() {
	        // Constructor creates a new map - only center and zoom are required.
	        map = new google.maps.Map(document.getElementById('map'), {
	          center: {lat: 39.963788, lng: -83.000574},
	          zoom: 13
	        });
	      }