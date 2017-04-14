package com.techelevator.capstone.controller;

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
public class AdminController {
	private AppUserDAO appUserDao;

	public AdminController(AppUserDAO appUserDao) {
		this.appUserDao = appUserDao;
	}

	@RequestMapping(path="/users/{userName}/adminHomePage", method=RequestMethod.GET)
	public String displayProfileForm(ModelMap model) {
		AppUser sessionUser = (AppUser)model.get("currentUser");
		sessionUser = appUserDao.readUserByEmail(sessionUser.getEmail());
		if(!sessionUser.isAdmin()){
			return "null";
		}
		model.put("currentUser", sessionUser);
		return "adminHomePage";
	}


	@RequestMapping(path="/users/{userName}/addAdmin", method=RequestMethod.GET)
	public String addAdminForm(ModelMap model) {
		AppUser sessionUser = (AppUser)model.get("currentUser");
		sessionUser = appUserDao.readUserByEmail(sessionUser.getEmail());
		if(!sessionUser.isAdmin()){
			return "null";
		}
		model.put("currentUser", sessionUser);
		return "addAdmin";
	}

	@RequestMapping(path="/users/{userName}/addAdmin", method=RequestMethod.POST)
	public String createProfile(@RequestParam String password, AppUser newUser, ModelMap model) {

		AppUser newAdmin = new AppUser();
		newAdmin.setEmail(newUser.getEmail());
		newAdmin.setUsername(newUser.getUsername());
		newAdmin.setFirstName(newUser.getFirstName());
		newAdmin.setLastName(newUser.getLastName());
		newAdmin.setAddress(newUser.getAddress());
		newAdmin.setCity(newUser.getCity());
		newAdmin.setState(newUser.getState());
		newAdmin.setZipCode(newUser.getZipCode());
		newAdmin.setPhoneNumber(newUser.getPhoneNumber());
		appUserDao.createAdmin(newAdmin, password);
		AppUser sessionUser = (AppUser)model.get("currentUser");
		model.put("currentUser", sessionUser);
		return "redirect:/users/"+sessionUser.getUsername()+"/adminHomePage";
	}

	@RequestMapping(path="/users/{userName}/cAllUsers", method=RequestMethod.GET)
	public String manageUsers(ModelMap model) {
		AppUser sessionUser = (AppUser)model.get("currentUser");
		sessionUser = appUserDao.readUserByEmail(sessionUser.getEmail());
		if(!sessionUser.isAdmin()){
			return "null";
		}
		model.put("currentUser", sessionUser);
		return "cAllUsers";
	}

	@RequestMapping(path="/users/{userName}/manageReviews", method=RequestMethod.GET)
	public String manageReviews(ModelMap model) {
		AppUser sessionUser = (AppUser)model.get("currentUser");
		sessionUser = appUserDao.readUserByEmail(sessionUser.getEmail());
		if(!sessionUser.isAdmin()){
			return "null";
		}
		model.put("currentUser", sessionUser);
		return "manageReviews";
	}
	
	@RequestMapping(path="/adminReviews", method=RequestMethod.GET)
	public String displaySignupForm() {
		
		
		return "adminReviews";
	}


}
