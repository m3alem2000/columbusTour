package com.techelevator.capstone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.capsone.DAO.AppUserDAO;
import com.techelevator.capsone.DAO.ItineraryDAO;
import com.techelevator.capsone.DAO.LandmarkDAO;
import com.techelevator.capsone.DAO.ReviewDAO;
import com.techelevator.capstone.model.AppUser;
import com.techelevator.capstone.model.Itinerary;
import com.techelevator.capstone.model.Landmark;

@Controller
@SessionAttributes("currentUser")
public class UserController {
	private AppUserDAO appUserDao;

	@Autowired
	private LandmarkDAO landmarkDao;

	@Autowired
	private ItineraryDAO itinDAO;


	@Autowired
	public UserController(AppUserDAO appUserDao) {
		this.appUserDao = appUserDao;
	}

	@RequestMapping(path="/users/{userName}/profile", method=RequestMethod.GET)
	public String displayProfileForm(ModelMap model) {
		AppUser sessionUser = (AppUser)model.get("currentUser");
		AppUser formUser = appUserDao.readUserByEmail(sessionUser.getEmail());
		//formUser = getValuesForForm(formUser, sessionUser);
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
		appUser.setUserId(sessionUser.getUserId());
		appUser.setUsername(sessionUser.getUsername());
		appUser.setEmail(sessionUser.getEmail());
		// appUser has the rest of the data
		model.put("currentUser", appUser);
		//start from landmarkSearchPage
		List<Landmark> landmarks = landmarkDao.getAllLandmarks();
		model.put("landmarks", landmarks);
		AppUser currentUser = (AppUser)model.get("currentUser");
		List<Itinerary> itineraries = itinDAO.getItinerariesListByUserId(currentUser.getUserId());
		model.put("itineraries", itineraries);
		return "registeredUser";
	}

	//	@RequestMapping(path="/users/{userName}/createItinerary", method=RequestMethod.GET)
	//	public String createItin( ModelMap model) {
	//		return "createItinerary";
	//	}  

	//	@RequestMapping(path="/users/{userName}/addLandmark2Itinerary", method=RequestMethod.POST)
	//	public String addLandmark2Itin(@RequestParam int itineraryId, @RequestParam(required=false) int[] landmarkIds, ModelMap model) {
	//		for (int landId : landmarkIds){
	//			itinDAO.addLandmark2Itin(itineraryId, landId);
	//		}
	//		AppUser sessionUser = (AppUser)model.get("currentUser");
	//		return "redirect:/users/"+sessionUser.getUsername()+"/registeredUser";
	//	}

}
