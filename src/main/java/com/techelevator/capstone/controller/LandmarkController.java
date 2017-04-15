package com.techelevator.capstone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.capsone.DAO.LandmarkDAO;
import com.techelevator.capstone.model.AppUser;
import com.techelevator.capstone.model.Landmark;

@Controller
@SessionAttributes({"landmark","currentUser"})
public class LandmarkController {
	private LandmarkDAO landmarkDao;
	
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
}
