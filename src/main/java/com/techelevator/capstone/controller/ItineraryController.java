package com.techelevator.capstone.controller;

import java.util.ArrayList;
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
import com.techelevator.capstone.model.AppUser;
import com.techelevator.capstone.model.Itinerary;

@Controller
@SessionAttributes("currentUser")
public class ItineraryController {

	private ItineraryDAO itineraryDao;
	@Autowired
	public ItineraryController(ItineraryDAO itineraryDao){
		this.itineraryDao = itineraryDao;
	}

	@RequestMapping(path="/itinerary", method=RequestMethod.GET)
	public String displayItineraryList(HttpServletRequest request, ModelMap model) {

		if(model.isEmpty() || model.get("currentUser")==null){
			return "redirect:/login";
		}else{

			AppUser appUser = (AppUser) model.get("currentUser");
			int userId = (int) appUser.getUserId();
			List<Itinerary> itineraries = new ArrayList<Itinerary>();
			itineraries = itineraryDao.getItinerariesListByUserId(userId);
			request.setAttribute("itineraries", itineraries);
			return "itinerary";
		}
	}

	@RequestMapping(path="/itineraryDetail", method=RequestMethod.GET)
	public String displayItineraryDetail(HttpServletRequest request, ModelMap model) {

		if(model.isEmpty() || model.get("currentUser")==null){
			return "redirect:/login";
		}else{
			int itineraryId = 3;
			AppUser appUser = (AppUser) model.get("currentUser");
			int userId = (int) appUser.getUserId();
			List<Itinerary> itinerariesDetail = new ArrayList<Itinerary>();
			itinerariesDetail = itineraryDao.getItinerariesDetailByUserId(userId, itineraryId);
			request.setAttribute("itinerariesDetail", itinerariesDetail);
			return "itineraryDetail";
		}

		//			long userId = sessionUser.getUserId();
		//			if(userId != 0){
		//				
		////				List<Itinerary> itineraries = new ArrayList<Itinerary>();
		////				itineraries = itineraryDao.getItineraryByUserIdAndItineraryId(userId, itineraryId);
		////				model.put("itineraries", itineraries);
		////				return "itinerary";
		//			}


	}
}

