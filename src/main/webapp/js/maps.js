	      var map;
	      function initMap() {
	        // Constructor creates a new map - only center and zoom are required.
	        map = new google.maps.Map(document.getElementById('map'), {
	          center: {lat: 39.993788, lng: -83.000574},
	          zoom: 11
	        });
	        var marker1;
	        marker1 = new google.maps.Marker({
	            map: map,
	            draggable: true,
	            animation: google.maps.Animation.DROP,
	            position: {
	            		lat: parseFloat($('[name=latitude1]').val()),
	            		lng: parseFloat($('[name=longitude1]').val())
	            	}
	        });        

	        
	        var marker2;
	        marker2 = new google.maps.Marker({
	            map: map,
	            draggable: true,
	            animation: google.maps.Animation.DROP,
	            position: {
	            		lat: parseFloat($('[name=latitude2]').val()),
	            		lng: parseFloat($('[name=longitude2]').val())
	            	}
	        });
	        
	        var marker3;
	        marker3 = new google.maps.Marker({
	            map: map,
	            draggable: true,
	            animation: google.maps.Animation.DROP,
	            position: {
	            		lat: parseFloat($('[name=latitude3]').val()),
	            		lng: parseFloat($('[name=longitude3]').val())
	            	}
	        });
	        
	        var marker4;
	        marker4 = new google.maps.Marker({
	            map: map,
	            draggable: true,
	            animation: google.maps.Animation.DROP,
	            position: {
	            		lat: parseFloat($('[name=latitude4]').val()),
	            		lng: parseFloat($('[name=longitude4]').val())
	            	}
	        });
	        var marker5;
	        marker5 = new google.maps.Marker({
	            map: map,
	            draggable: true,
	            animation: google.maps.Animation.DROP,
	            position: {
	            		lat: parseFloat($('[name=latitude5]').val()),
	            		lng: parseFloat($('[name=longitude5]').val())
	            	}
	        });

	            var contentString1 = 
	                '<div style="width:300px" id="siteNotice">'+
	                '<h5>'+$('[name=name1]').val()+'</h5>'+
	                '<img style="width:200px" src=img/'+$('[name=landmarkPicture1]').val()+'></a><br>'+
	                '<p><b>Description: </b>'+$('[name=description1]').val()+'</p>'+
	                '</div>';

	            var infowindow1 = new google.maps.InfoWindow({
	              content: contentString1
	            });

	            marker1.addListener('mouseover', function() {
	              infowindow1.open(map, marker1);
	            });				
	      }
