package com.techelevator.capstone.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.capsone.DAO.LandmarkDAO;
import com.techelevator.capstone.model.Landmark;



@Controller
@SessionAttributes("landmarks")
public class HomeController {
	@Autowired
	private LandmarkDAO landmarkDao;

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String showHomePage(HttpServletRequest request) {
		List<Landmark> landmark = landmarkDao.getTopPickLandMarksByFlag();
		request.setAttribute("landmarks", landmark);
		return "home";
	}

}
