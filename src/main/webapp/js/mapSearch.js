var location = {
          center: {lat: 41.878, lng: -87.629},
         
      };


      function initMap() {
    	   var location;
    	   startPoint = new google.maps.Marker({
	            map: map,
	            draggable: true,
	            animation: google.maps.Animation.DROP,
	            position: {
	            		lat: parseFloat($('#user_latitude').val()),
	            		lng: parseFloat($('#user_longitude').val())
	            	}
	        });       

        // Construct the circle for value in citymap.       
          // Add the circle for this city to the map.
          var radiusCircle = new google.maps.Circle({
            strokeColor: '#FF0000',
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: '#FF0000',
            fillOpacity: 0.35,
            map: $('#user_map'),
            center: startingPoint,
            radius: $(document).ready(function(){
        	    $("button").click(function(){
        	        $("#mile_radius").val();
        	    });
        	})
          });
          
          
          
      }