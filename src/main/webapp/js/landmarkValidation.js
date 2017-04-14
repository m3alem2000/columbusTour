$(document).ready(function () {
	$('#landmark-input').validate({
		rules:{
			landmarkName: {
				required: true
				},
			landmarkSubName: {
					required: true
				},
		}
		
	})
	
	
});