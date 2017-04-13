package com.techelevator.capstone.controller;

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
public class UserController {
	private AppUserDAO appUserDao;

	@Autowired
	public UserController(AppUserDAO appUserDao) {
		this.appUserDao = appUserDao;
	}

	@RequestMapping(path="/login", method=RequestMethod.GET)
	public String displayLoginForm() {
		return "login";
	}

	@RequestMapping(path="/signup", method=RequestMethod.GET)
	public String displaySignupForm() {
		return "signup";
	}

	@RequestMapping(path="/signup", method=RequestMethod.POST)
	public String createUser(@RequestParam String userName, @RequestParam String email, @RequestParam String password, ModelMap model) {
		AppUser user = appUserDao.createAppUser(userName, email, password);
		model.put("currentUser", user);
		return "redirect:/users/"+user.getUsername()+"/profile";
	}
	
	@RequestMapping(path="/users/{userName}/profile", method=RequestMethod.GET)
	public String displayProfileForm() {
		return "profile";
	}

	@RequestMapping(path="/users/{userName}/profile", method=RequestMethod.POST)
	public String createProfile(AppUser formUser, ModelMap model) {
		AppUser sessionUser = (AppUser)model.get("currentUser");
		sessionUser.setFirstName(formUser.getFirstName());
		sessionUser.setLastName(formUser.getLastName());
		sessionUser.setAddress(formUser.getAddress());
		sessionUser.setCity(formUser.getCity());
		sessionUser.setState(formUser.getState());
		sessionUser.setZipCode(formUser.getZipCode());
		sessionUser.setPhoneNumber(formUser.getPhoneNumber());
		appUserDao.updateAppUserProfile(sessionUser);
		return "redirect:/registeredUser";
	}
}
