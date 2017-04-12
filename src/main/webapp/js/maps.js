	      var map;
	      function initMap() {
	        // Constructor creates a new map - only center and zoom are required.
	        map = new google.maps.Map(document.getElementById('map'), {
	          center: {lat: 39.963788, lng: -83.000574},
	          zoom: 13
	        });
	        
	        var marker;
	        marker = new google.maps.Marker({
	            map: map,
	            draggable: true,
	            animation: google.maps.Animation.DROP,
	            position: {
	            		lat: parseFloat($('[name=latitude1]').val()),
	            		lng: parseFloat($('[name=longitude1]').val())
	            	}
	        });
	        
	        var marker;
	        marker = new google.maps.Marker({
	            map: map,
	            draggable: true,
	            animation: google.maps.Animation.DROP,
	            position: {
	            		lat: parseFloat($('[name=latitude2]').val()),
	            		lng: parseFloat($('[name=longitude2]').val())
	            	}
	        });
	        
	        var marker;
	        marker = new google.maps.Marker({
	            map: map,
	            draggable: true,
	            animation: google.maps.Animation.DROP,
	            position: {
	            		lat: parseFloat($('[name=latitude3]').val()),
	            		lng: parseFloat($('[name=longitude3]').val())
	            	}
	        });
	        
	        var marker;
	        marker = new google.maps.Marker({
	            map: map,
	            draggable: true,
	            animation: google.maps.Animation.DROP,
	            position: {
	            		lat: parseFloat($('[name=latitude4]').val()),
	            		lng: parseFloat($('[name=longitude4]').val())
	            	}
	        });
	        var marker;
	        marker = new google.maps.Marker({
	            map: map,
	            draggable: true,
	            animation: google.maps.Animation.DROP,
	            position: {
	            		lat: parseFloat($('[name=latitude5]').val()),
	            		lng: parseFloat($('[name=longitude5]').val())
	            	}
	        });
	      }