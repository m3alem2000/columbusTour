package com.techelevator.capstone.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.capsone.DAO.AppUserDAO;
import com.techelevator.capsone.DAO.LandmarkDAO;
import com.techelevator.capsone.DAO.ReviewDAO;
import com.techelevator.capstone.model.AppUser;
import com.techelevator.capstone.model.Landmark;
import com.techelevator.capstone.model.Review;

@Controller
@SessionAttributes({"landmark","landmarks","currentUser","reviews","allUsers"})
public class AdminController {
	private AppUserDAO appUserDao;

	@Autowired
	private ReviewDAO reviewDao;
	@Autowired
	private LandmarkDAO landmarkDao;

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
	public String createProfile(@RequestParam String password, 
			AppUser newUser, ModelMap model) {

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
		List<AppUser> allUsers= new ArrayList<AppUser>();
		allUsers = appUserDao.readAllAppUsers();
		model.put("allUsers", allUsers);
		return "cAllUsers";
	}

	@RequestMapping(path="/users/{userName}/cAllUsers", method=RequestMethod.POST)
	public String deleteUser(@RequestParam(value = "userToDeleteId", required=false) long userToDeleteId,
			ModelMap model) {
		AppUser sessionUser = (AppUser)model.get("currentUser");
		sessionUser = appUserDao.readUserByEmail(sessionUser.getEmail());
		if(!sessionUser.isAdmin()){
			return "null";
		}
		List<Review> delRev = reviewDao.getAllLandmarksReviewsByUserId(userToDeleteId);
		for (Review review: delRev){
			reviewDao.deleteReviewById(review.getReviewId());
		}
		appUserDao.deleteAppUser(userToDeleteId);
		model.put("currentUser", sessionUser);
		List<AppUser> allUsers= new ArrayList<AppUser>();
		allUsers = appUserDao.readAllAppUsers();
		model.put("allUsers", allUsers);
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
		List<Review> reviews = reviewDao.getAllLandmarksReviews();
		model.put("reviews", reviews);
		return "manageReviews";
	}

	@RequestMapping(path="/users/{userName}/manageReviews", method=RequestMethod.POST)
	public String deleteReviews(@RequestParam long reviewId, ModelMap model) {
		AppUser sessionUser = (AppUser)model.get("currentUser");
		sessionUser = appUserDao.readUserByEmail(sessionUser.getEmail());
		if(!sessionUser.isAdmin()){
			return "null";
		}
		model.put("currentUser", sessionUser);
		reviewDao.deleteReviewById(reviewId);
		List<Review> reviews = reviewDao.getAllLandmarksReviews();
		model.put("reviews", reviews);
		return "manageReviews";
	}
	@RequestMapping(path="/users/{userName}/addOUpdateLandmark", method=RequestMethod.GET)
	public String displayAddLandmarkForm(
			@RequestParam(value = "landmark2Update", required=false) Long landmarkUpdateId,
			ModelMap model){
		if (landmarkUpdateId != null ) {
			Landmark update = landmarkDao.readLandmarkById(landmarkUpdateId);
			System.out.println(landmarkUpdateId);
			model.put("landmark", update);
		} else {
			model.remove("landmark");
			System.out.println("Banana");
		}
		return "addOUpdateLandmark";
	}

	@RequestMapping(path="/users/{userName}/addOUpdateLandmark", method=RequestMethod.POST)
	public String saveLandmarkInDB(Landmark inputLandMark, ModelMap model){
		landmarkDao.createLandmark(inputLandMark);
		AppUser adminUser = (AppUser)model.get("currentUser");
		return "redirect:/users/"+adminUser.getUsername()+"/adminHomePage";
	}

	@RequestMapping(path="/users/{userName}/menageLandmarks", method=RequestMethod.GET)
	public String displaymenageLendmarksForm(ModelMap model){
		List<Landmark> landmarks =landmarkDao.getAllLandmarks();
		model.put("landmarks", landmarks);
		return "manageLandmarks";
	}

	@RequestMapping(path="/users/{userName}/deleteLandmark", method=RequestMethod.POST)
	public String deleteLandmark(@RequestParam(value = "landmark2delId", required=false) long landmark2delId,
			ModelMap model){
		landmarkDao.inactivateLandmarkById(landmark2delId);
		List<Landmark> landmarks =landmarkDao.getAllLandmarks();
		model.put("landmarks", landmarks);
		return "manageLandmarks";
	}

}
