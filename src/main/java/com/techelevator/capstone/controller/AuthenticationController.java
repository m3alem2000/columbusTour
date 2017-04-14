package com.techelevator.capstone.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.capsone.DAO.AppUserDAO;
import com.techelevator.capstone.model.AppUser;

@Controller
@SessionAttributes("currentUser")
public class AuthenticationController {

	private AppUserDAO appUserDao;

	@Autowired
	public AuthenticationController(AppUserDAO appUserDao) {
		this.appUserDao = appUserDao;
	}

	@RequestMapping(path="/signup", method=RequestMethod.GET)
	public String displaySignupForm() {
		return "signup";
	}

	@RequestMapping(path="/signup", method=RequestMethod.POST)
	public String createUser(HttpServletRequest request,
							 @RequestParam String userName, 
							 @RequestParam String email, 
							 @RequestParam String password, 
							 ModelMap model ) {
		if (appUserDao.readUserByEmail(email) == null) {
			AppUser user = appUserDao.createAppUser(userName, email, password);
			model.put("currentUser", user);
			return "redirect:/users/"+user.getUsername()+"/profile";
		} else {
			request.setAttribute("messageLog", "Email exist, please login or signup with a different email!");
			return "signup";
		}
	}
	
	@RequestMapping(path="/login", method=RequestMethod.GET)
	public String displayLoginForm() {
		return "login";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String login(Map<String, Object> model, 
			@RequestParam String email, 
			@RequestParam String password,
			@RequestParam(required=false) String destination,
			HttpSession session) {
		if(appUserDao.matchUsernameAndPassword(email, password)) {
			session.invalidate();
			AppUser user = appUserDao.readUserByEmail(email);
			model.put("currentUser", user);
			if(user.isAdmin()){
				return "adminHomePage";
			}
			if(isValidRedirect(destination)){
				return "redirect:"+destination;
			} else {
				return "redirect:/users/"+user.getUsername()+"/registeredUser";
			}
		} else {
			return "redirect:/login";
		}
	}
	
	private boolean isValidRedirect(String destination) {
		return destination != null && destination.startsWith("http://localhost");
	}


	@RequestMapping(path="/logout", method=RequestMethod.GET)
	public String logout(Map<String, Object> model, HttpSession session) {
		model.remove("currentUser");
		session.removeAttribute("currentUser");
		return "redirect:/";
	}
}
