
var blackList = [];
var reviewArray = [];
var testing;
var badWords = 'ass ballsack balls bastard bitch biatch blowjob boner boob '
	+ 'bugger bum butt buttplug clitoris cock cunt damn dick dildo dyke fag fellate '
	+ 'fellatio felching fuck fudgepacker hell homo jerk jizz knobend labia '
	+ 'nigg penis piss prick pussy queer scrotum sex sh1t slut smegma spunk tit tosser '
	+ 'turd twat vagina wank whore @ss hoe shit';





//checks to see if review string contains banned words
function containChar(original, check)
{
	if(original.indexOf(check) >= 0)
	{
		return true;
	}
	return false;
}

//checks the users post for any foul language
function blackListWord()
{
	testing = false;
	this.blackList = badWords.split(' ');
	var review = $("#reviewInput").val(); 
	this.reviewArray = review.split(' ');
	for(var i = 0; i < reviewArray.length; i++)
	{
	var original =	reviewArray[i].toLowerCase();	
		for(var x = 0; x < blackList.length; x++)
		{
			var check = blackList[x];
			if(containChar(original, check) == true)
			{
			testing = true; 
			break;
			}
		}
	}
	$(document).ready(function () {
		$('#landmark-input').validate({
			rules:{
				CSRF_TOKEN: { required: true },
				userId: { required: true },
				landmarkId: {	required: true },
				reviewS: { required: true },
				rating: { required: true }, 
			},
			messages: {
				CSRF_TOKEN: { required: "bad CSRF TOKEN" },
				userId: { required: "Please Login First" },
				landmarkId: {required: "Select a Landmark" },
				reviewS: { required: "Please write a review" },
				rating: { required: "Please give a rating" }, 
			},
		});
	});
	return true;
}

