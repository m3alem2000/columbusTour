package com.techelevator.capstone.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

//import com.techelevator.capsone.DAO.AppUserDAO;
import com.techelevator.capsone.DAO.LandmarkDAO;
import com.techelevator.capstone.model.Landmark;


@Controller
@SessionAttributes({"currentUser","landmarks"})
public class HomeController {
	//	@Autowired
	//	private AppUserDAO appUserDao;
	@Autowired
	private LandmarkDAO landmarkDao;

	@RequestMapping(path={"/","/users/{userName}/"}, method=RequestMethod.GET)
	public String showHomePage(HttpServletRequest request,
			ModelMap model) {
		if (model.containsKey("landmarks")){
			model.remove("landmarks");
		}

		List<Landmark> landmark = landmarkDao.getTopPickLandMarksByFlag();
		request.setAttribute("landmarks", landmark);
		return "home";
	}

	@RequestMapping(path={"/about","/users/{userName}/about"}, method=RequestMethod.GET)
	public String showAboutPage(HttpServletRequest request) {
		return "about";
	}
}
