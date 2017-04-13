package com.techelevator.capstone.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.techelevator.capsone.DAO.LandmarkDAO;
import com.techelevator.capsone.DAO.UserStartingPointDAO;
import com.techelevator.capstone.model.Landmark;
import com.techelevator.capstone.model.UserStartingPoint;


	@Controller
	public class HomeController {
		@Autowired
		private LandmarkDAO landmarkDao;
		private UserStartingPointDAO uspDao;
		
		@RequestMapping(path="/", method=RequestMethod.GET)
			public String showHomePage(HttpServletRequest request) {
			List<Landmark> landmark = landmarkDao.getTopFiveLandMarks();
			request.setAttribute("landmarks", landmark);
			return "home";
		}
		
		@RequestMapping(path="/landmarkSearchPage", method=RequestMethod.GET)
		public String showlandmarkSearchPage(HttpServletRequest request) {
		UserStartingPoint usps = uspDao.createStartingPoint(1l, "AAA", 39.9969, 83.0093);
		request.setAttribute("userStartingPoint", usps);
		return "landmarkSearchPage";
		}
		
}
