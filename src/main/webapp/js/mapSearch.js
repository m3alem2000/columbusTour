	      var map;
	      var infoWindows = [];
	      function initMap() {
	        // Constructor creates a new map - only center and zoom are required.
	        map = new google.maps.Map(document.getElementById('map'), {
	          center: {lat: 39.993788, lng: -83.000574},
	          zoom: 11
	        });
	        
	        for (i = 0; i < 6; i++) { 
		        var marker = new google.maps.Marker({
		            map: map,
		            draggable: true,
		            animation: google.maps.Animation.DROP,
		            position: {
		            		lat: 39.993788,
		            		lng: -83.000574
		            	}
		        });
		        
		        var contentString = 
	                '<div style="width:300px" id="siteNotice">'+
	                '<h5>'+$('[name=name'+i+']').val()+'</h5>'+
	                '<img style="width:200px" src=img/'+$('[name=landmarkPicture'+i+']').val()+'></a><br>'+
	                '<p><b>Description: </b>'+$('[name=description'+i+']').val()+'</p>'+
	                '</div>';

		        marker.infoWindow = new google.maps.InfoWindow({
		              content: contentString
		        });
		        
		        marker.addListener('click', function() {
		        		this.infoWindow.open(map, this);
		        });
		      
	        }
	      }
//        // Construct the circle for value in citymap.       
//          // Add the circle for this city to the map.
//          var radiusCircle = new google.maps.Circle({
//            strokeColor: '#FF0000',
//            strokeOpacity: 0.8,
//            strokeWeight: 2,
//            fillColor: '#FF0000',
//            fillOpacity: 0.35,
//            map: $('#user_map'),
//            center: startingPoint,
//            radius: $(document).ready(function(){
//        	    $("button").click(function(){
//        	        $("#mile_radius").val();
//        	    });
//        	})
//          });
//          
//          
//          
//      }