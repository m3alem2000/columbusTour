package com.techelevator.capstone.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.capsone.DAO.LandmarkDAO;
import com.techelevator.capsone.DAO.UserStartingPointDAO;
import com.techelevator.capstone.model.Landmark;
import com.techelevator.capstone.model.UserStartingPoint;


	@Controller
	public class HomeController {
		@Autowired
		private LandmarkDAO landmarkDao;
		@Autowired
		private UserStartingPointDAO uspDao;
		
		@RequestMapping(path="/", method=RequestMethod.GET)
			public String showHomePage(HttpServletRequest request) {
			List<Landmark> landmark = landmarkDao.getTopPickLandMarksByFlag();
			request.setAttribute("landmarks", landmark);
			return "home";
		}
		

		@RequestMapping(path="/landmarkDetail", method=RequestMethod.GET)
		public String viewLandmarkDetail(HttpServletRequest request, @RequestParam Long landmarkId, ModelMap map) {
				request.setAttribute("landmarks", landmarkDao.readLandmarkById(landmarkId));
			return "landmarkDetail";
		}

		@RequestMapping(path="/landmarkSearchPage", method=RequestMethod.GET)
		public String showlandmarkSearchPage(HttpServletRequest request, @RequestParam long itineraryId, @RequestParam String address, @RequestParam double latitude, @RequestParam double longitude) {
		UserStartingPoint usps = uspDao.createStartingPoint(itineraryId, address, latitude, longitude);
			request.setAttribute("userStartingPoint", usps);
		return "landmarkSearchPage";
		}
		
}
