package com.techelevator.capstone.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.capsone.DAO.LandmarkDAO;
import com.techelevator.capsone.DAO.UserStartingPointDAO;
import com.techelevator.capstone.model.AppUser;
import com.techelevator.capstone.model.Landmark;
import com.techelevator.capstone.model.Review;
import com.techelevator.capstone.model.UserStartingPoint;

@Controller
@SessionAttributes({"landmark","currentUser","landmarks"})
public class LandmarkController {
	private LandmarkDAO landmarkDao;

	@Autowired
	private UserStartingPointDAO uspDao;
	
	@Autowired
	public LandmarkController(LandmarkDAO landmarkDao){
		this.landmarkDao = landmarkDao;
	}
	
	@RequestMapping(path="/users/{userName}/addLandmark", method=RequestMethod.GET)
	public String displayAddLandmarkForm(ModelMap model){
		// TODO: get the landmark to pre populate the fields 
//		if (model.get("landmark")!=null){
//		Landmark sessionLandmark = (Landmark)model.get("landmark");
//		landmarkDao.readLandmarkById(sessionLandmark.getLandmarkId())
//		}
		
		return "addLandmark";
	}
	
	@RequestMapping(path="/users/{userName}/addLandmark", method=RequestMethod.POST)
	public String saveLandmarkInDB(Landmark inputLandMark, ModelMap model){
		landmarkDao.createLandmark(inputLandMark);
		AppUser adminUser = (AppUser)model.get("currentUser");
		return "redirect:/users/"+adminUser.getUsername()+"/adminHomePage";
	}
	
	@RequestMapping(path="/users/{userName}/manageLandmarks", method=RequestMethod.GET)
	public String manageReviews(ModelMap model) {

		List<Landmark> landmarks = landmarkDao.getAllLandmarks();
		model.put("landmarks", landmarks);
		return "manageReviews";
	}
	
	@RequestMapping(path="/landmarkDetail", method=RequestMethod.GET)
	public String viewLandmarkDetail(HttpServletRequest request, @RequestParam Long landmarkId, ModelMap map) {
			request.setAttribute("landmarks", landmarkDao.readLandmarkById(landmarkId));
		return "landmarkDetail";
	}

	@RequestMapping(path="/landmarkSearchPage", method=RequestMethod.GET)
	public String showlandmarkSearchPage(HttpServletRequest request, @RequestParam long itineraryId, @RequestParam String address, @RequestParam double latitude , @RequestParam double longitude) {
	UserStartingPoint usps = uspDao.createStartingPoint(itineraryId, address, latitude, longitude);
		request.setAttribute("userStartingPoint", usps);
	return "landmarkSearchPage";
	}
}
