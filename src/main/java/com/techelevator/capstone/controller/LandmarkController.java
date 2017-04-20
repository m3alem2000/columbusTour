package com.techelevator.capstone.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.capsone.DAO.ItineraryDAO;
import com.techelevator.capsone.DAO.LandmarkDAO;
import com.techelevator.capsone.DAO.ReviewDAO;
import com.techelevator.capstone.model.AppUser;
import com.techelevator.capstone.model.Landmark;
import com.techelevator.capstone.model.Review;

@Controller
@SessionAttributes({"landmark","reviews","currentUser","landmarks"})
public class LandmarkController {

	@Autowired
	private LandmarkDAO landmarkDao;

	@Autowired
	private ReviewDAO reviewDao;
	@Autowired
	private ItineraryDAO itinDAO;

	@Autowired
	public LandmarkController(LandmarkDAO landmarkDao){
		this.landmarkDao = landmarkDao;
	}

	@RequestMapping(path="/users/{userName}/manageLandmarks", method=RequestMethod.GET)
	public String manageReviews(ModelMap model) {

		List<Landmark> landmarks = landmarkDao.getAllLandmarks();
		model.put("landmarks", landmarks);
		return "manageReviews";
	}

	@RequestMapping(path={"/landmarkDetail","/users/{userName}/landmarkDetail"}, method=RequestMethod.GET)
	public String viewLandmarkDetail(HttpServletRequest request, 
			@RequestParam Long landmarkId, 
			ModelMap model) {
		request.setAttribute("landmark", landmarkDao.readLandmarkById(landmarkId));
		List<Review> reviews = reviewDao.getAllLandmarkReviews(landmarkId);
		model.put("reviews", reviews);
		return "landmarkDetail";
	}


	@RequestMapping(path="/landmarkDetail", method=RequestMethod.POST)
	public String submitReview(HttpServletRequest request, 
			@RequestParam long userId, 
			@RequestParam long landmarkId,
			@RequestParam String reviewS,
			@RequestParam double rating,
			ModelMap model) {
		Review review = new Review();
		AppUser currentUser = (AppUser) model.get("currentUser");
		LocalDateTime dateCreated = LocalDateTime.now();
		review.setLandmarkId(landmarkId);
		review.setRating(rating);
		review.setUserId(userId);
		review.setReview(reviewS);
		review.setDateCreated(dateCreated);
		reviewDao.createReview(review);
		model.put("currentUser", currentUser);
		request.setAttribute("landmark", landmarkDao.readLandmarkById(review.getLandmarkId()));
		return "landmarkDetail";//redirect
	}


}
