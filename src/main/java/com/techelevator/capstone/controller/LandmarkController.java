package com.techelevator.capstone.controller;

import java.util.ArrayList;
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
import com.techelevator.capsone.DAO.ReviewDAO;
import com.techelevator.capstone.model.AppUser;
import com.techelevator.capstone.model.Landmark;
import com.techelevator.capstone.model.Review;

@Controller
@SessionAttributes({"landmark","reviews","currentUser","landmarks"})
public class LandmarkController {

	private LandmarkDAO landmarkDao;

	@Autowired
	private ReviewDAO reviewDao;


	@Autowired
	public LandmarkController(LandmarkDAO landmarkDao){
		this.landmarkDao = landmarkDao;
	}


	@RequestMapping(path="/users/{userName}/landmarkSearchPage", method=RequestMethod.GET)
	public String displaySearchLandmarkForm(ModelMap model){
		List<Landmark> landmarks = landmarkDao.getAllLandmarks();
		model.put("landmarks", landmarks);
		return "landmarkSearchPage";
	}

	@RequestMapping(path="/users/{userName}/manageLandmarks", method=RequestMethod.GET)
	public String manageReviews(ModelMap model) {

		List<Landmark> landmarks = landmarkDao.getAllLandmarks();
		model.put("landmarks", landmarks);
		return "manageReviews";
	}

	@RequestMapping(path="/landmarkDetail", method=RequestMethod.GET)
	public String viewLandmarkDetail(HttpServletRequest request, 
			@RequestParam Long landmarkId, 
			ModelMap model) {
		request.setAttribute("landmark", landmarkDao.readLandmarkById(landmarkId));
		List<Review> reviews = reviewDao.getAllLandmarkReviews(landmarkId);
		model.put("reviews", reviews);
		return "landmarkDetail";
	}

	@RequestMapping(path="/landmarkSearchPage", method=RequestMethod.GET)
	public String showlandmarkSearchPage(HttpServletRequest request) {
		return "landmarkSearchPage";
	}
}
