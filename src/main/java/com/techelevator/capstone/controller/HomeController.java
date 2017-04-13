package com.techelevator.capstone.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.capsone.DAO.LandmarkDAO;
import com.techelevator.capstone.model.Landmark;


	@Controller
	public class HomeController {
		@Autowired
		private LandmarkDAO landmarkDao;
		
		@RequestMapping(path="/", method=RequestMethod.GET)
			public String showHomePage(HttpServletRequest request) {
			List<Landmark> landmark = landmarkDao.getTopFiveLandMarks();
			request.setAttribute("landmarks", landmark);
			return "home";
		}
		
		@RequestMapping(path="/landmarkDetail", method=RequestMethod.GET)
		public String viewLandmarkDetail(HttpServletRequest request, @RequestParam Long landmarkId, ModelMap map) {
				request.setAttribute("landmarks", landmarkDao.readLandmarkById(landmarkId));
			return "landmarkDetail";
		}
}
