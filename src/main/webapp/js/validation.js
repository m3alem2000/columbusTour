$(document).ready(function () {

	$("#new-user").validate({
		rules: {
			userName: {
				required: true,
				minlength: 5,
			},
			email: {
				required: true,
				email: true,
			},
			password: {
				required: true,
				minlength: 8,
				passwordCharacters: true,
				passwordThreeChars: true,
				passwordThreeRules: true,
			},
			confirmPassword: {
				equalTo: "#password",
			}
		},
		messages: {
			userName: {
				required: "Your User name must be at least 5 characters long",
			},
			email: {
				required: "Your email is not valid",
			},
			password: {
				required: "Password must be at least 8 characters long",
			},
			confirmPassword:{
				required: "Your passwords don't match!",
			},
		},
	});
});


$.validator.addMethod("passwordCharacters", function (password, index) {
	if(password.length<129){return true};
}, "Password must be a maximum of 128 characters long");

$.validator.addMethod("passwordThreeChars", function (password, index) {
	var status = true;
	for(var i = 0 ; i < password.length-2 ; i++){
		if(password[i] === password[i+1] && password[i+1] === password[i+2]){
			status = false;
		}
	}return status;
}, "Password must not have more than 2 identical characters in a row");

$.validator.addMethod("passwordThreeRules", function (password, index) {
	var rule = 0;
	if(password.search(/[a-z]/) >= 0 ){
		rule ++;
	}  
	if (password.search(/[0-9]/) >= 0) {
		rule ++;		
	}
	if (password.search(/[A-Z]/) >= 0) {
		rule ++;		
	}
	if (password.search(/[?=.*[!@#$%^&*]/) >= 0) {
		rule ++;		
	}
	if(rule >=3){
		return true;
	}
}, "Password must meet three of these conditions: one lower case letter, one upper case letter, one number and one special character.");

