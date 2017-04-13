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

	@RequestMapping(path="/users/{userName}/profile", method=RequestMethod.GET)
	public String displayProfileForm(AppUser formUser, ModelMap model) {
		AppUser sessionUser = (AppUser)model.get("currentUser");
		formUser.setUsername(sessionUser.getUsername());
		formUser.setEmail(sessionUser.getEmail());
		model.put("currentUser", formUser);
		return "profile";
	}

	@RequestMapping(path="/users/{userName}/profile", method=RequestMethod.POST)
	public String createProfile(AppUser formUser, ModelMap model) {
		AppUser sessionUser = (AppUser)model.get("currentUser");
		long sessionUserId = (appUserDao.readUserByEmail(sessionUser.getEmail())).getUserId();
		sessionUser.setUserId(sessionUserId);
		sessionUser.setFirstName(formUser.getFirstName());
		sessionUser.setLastName(formUser.getLastName());
		sessionUser.setAddress(formUser.getAddress());
		sessionUser.setCity(formUser.getCity());
		sessionUser.setState(formUser.getState());
		sessionUser.setZipCode(formUser.getZipCode());
		sessionUser.setPhoneNumber(formUser.getPhoneNumber());
		appUserDao.updateAppUserProfile(sessionUser);
		model.put("currentUser", sessionUser);
		return "redirect:/users/"+sessionUser.getUsername()+"/registeredUser";
	}

	@RequestMapping(path="/users/{userName}/registeredUser", method=RequestMethod.GET)
	public String goToUserPage(AppUser appUser, ModelMap model) {
		// sesion user has userName eamil
		AppUser sessionUser = (AppUser)model.get("currentUser");
		appUser.setUsername(sessionUser.getUsername());
		appUser.setEmail(sessionUser.getEmail());
		// appUser has the rest of the data
		model.put("currentUser", appUser);
		return "registeredUser";
	}
}
