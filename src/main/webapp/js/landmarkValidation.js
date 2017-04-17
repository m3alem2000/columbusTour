$(document).ready(function () {
	$('#landmark-input').validate({
		rules:{
			landmarkName: { required: true },
			landmarkSubName: { },
			landmarkPicture: {	//this is the path to the file folder location that has the main picture for the landmark
			},
			latitude: {	required: true,	latitudeFormat: true },
			longitude: { required: true, },
			state: { required: true, stateUS: true }, 
			city: { },
			address: {},
			zipCode: { required: true , zipcode: true },
			// https://smartystreets.com/signup address validation
		},
		messages: {
			landmarkName: { required: "Landmark name is required" },
			landmarkSubName: { required: "landmark SubName is required" },
			landmarkRating: { required: "Rating is required" },
			latitude: { required: "Latitude is required" },
			longitude: { required: "Longitude is required" },
			state: { required: "State is required" },
			city: { required: "City is required" },
			address: {required: "Address is requiered" },
			zipCode: { required: "Postal Code is required" },
		},
	});
});

$.validator.addMethod("stateUS", function(value, element) {
	var states = [
		"AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA",
		"HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
		"MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
		"NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
		"SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY",
		"AS", "DC", "FM", "GU", "MH", "MP", "PR", "PW", "VI"
		];
	return $.inArray(value.toUpperCase(), states) != -1;
}, "Valid state is the 2 letter reprasentation");

$.validator.addMethod("zipcode", function(value, element) {
	return this.optional(element) || /^\d{5}(?:-\d{4})?$/.test(value);
}, "Please provide a valid zipcode.");


$.validator.addMethod("latitudeFormat", function(value, element) {
	if(this.optional(element)) {
		return true;
	} else if(!/^-?([0-8]?[0-9]|90)\.[0-9]{1,6}$/.test(value)) {
		return false;
	} else {
		value = parseFloat(value);
		return value >= -90 && value <= 90;
	}
}, "Please provide a valid latitude.");

$.validator.addMethod("longitudeFormat", function(value, element) {
	if (this.optional(element)) {
		return true;
	} else if (!/^-?((1?[0-7]?|[0-9]?)[0-9]|180)\.[0-9]{1,6}$/.test(value)) {
		return false;
	} else {
		return false;
	}
}, "Please provide a valid longitude.");




