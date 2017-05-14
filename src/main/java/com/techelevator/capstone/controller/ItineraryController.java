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
import com.techelevator.capsone.DAO.LandmarkDAO;
import com.techelevator.capstone.model.AppUser;
import com.techelevator.capstone.model.Itinerary;
import com.techelevator.capstone.model.Landmark;

@Controller
@SessionAttributes({"currentUser","itinerary","landmarks"})
public class ItineraryController {

	private ItineraryDAO itineraryDao;
	@Autowired
	private LandmarkDAO landmarkDao;

	@Autowired
	public ItineraryController(ItineraryDAO itineraryDao, LandmarkDAO landmarkDao){
		this.itineraryDao = itineraryDao;
		this.landmarkDao = landmarkDao;
	}

	//	@RequestMapping(path="/itinerary", method=RequestMethod.GET)
	//	public String displayItineraryList(HttpServletRequest request, ModelMap model) {
	//
	//		if(model.isEmpty() || model.get("currentUser")==null){
	//			return "redirect:/login";
	//		}else{
	//
	//			AppUser appUser = (AppUser) model.get("currentUser");
	//			int userId = (int) appUser.getUserId();
	//			List<Itinerary> itineraries = new ArrayList<Itinerary>();
	//			itineraries = itineraryDao.getItinerariesListByUserId(userId);
	//			request.setAttribute("itineraries", itineraries);
	//			return "itinerary";
	//		}
	//	}


	@RequestMapping(path={"/users/{userName}/itinerary","/itinerary"}, method=RequestMethod.GET)
	public String displayItineraryList(@RequestParam (defaultValue = "0" ,required = false) int itineraryId, HttpServletRequest request, ModelMap model) {

		if(model.isEmpty() || model.get("currentUser")==null){
			return "redirect:/login";
		}else{

			AppUser appUser = (AppUser) model.get("currentUser");
			int userId = (int) appUser.getUserId();
			List<Itinerary> itineraries = new ArrayList<Itinerary>();
			List<Itinerary> itinerariesDetail = new ArrayList<Itinerary>();

			if(itineraryId!=0){
				itinerariesDetail = itineraryDao.getItinerariesDetailByUserId(userId, itineraryId);
				request.setAttribute("itinerariesDetail", itinerariesDetail);
			}
			itineraries = itineraryDao.getItinerariesListByUserId(userId);
			request.setAttribute("itineraries", itineraries);
			return "itinerary";
		}
	}

	//	@RequestMapping(path="/itineraryDetail", method=RequestMethod.GET)
	//	public String displayItineraryDetail(@RequestParam int itineraryId, HttpServletRequest request, ModelMap model) {
	//
	//		if(model.isEmpty() || model.get("currentUser")==null){
	//			return "redirect:/login";
	//		}else{
	//			AppUser appUser = (AppUser) model.get("currentUser");
	//			int userId = (int) appUser.getUserId();
	//			List<Itinerary> itinerariesDetail = new ArrayList<Itinerary>();
	//			itinerariesDetail = itineraryDao.getItinerariesDetailByUserId(userId, itineraryId);
	//			request.setAttribute("itinerariesDetail", itinerariesDetail);
	//			return "itineraryDetail";
	//		}
	//	}

	//	@RequestMapping(path="/newItinerary", method=RequestMethod.GET)
	//	public String newItineraryStartPoint(HttpServletRequest request, ModelMap model) {
	//
	//		if(model.isEmpty() || model.get("currentUser")==null){
	//			return "redirect:/login";
	//		}else{
	//			List<Landmark> allLandmarks = landmarkDao.getAllLandmarks();
	//			request.setAttribute("allLandmarks", allLandmarks);
	//			return "newItinerary";
	//		}
	//	}
	
	@RequestMapping(path="/users/{userName}/createItinerary", method=RequestMethod.GET)
	public String createItineraryStartPoint(ModelMap model) {
		//start from landmarkSearchPage
		List<Landmark> landmarks = landmarkDao.getAllLandmarks();
		model.put("landmarks", landmarks);
		if(model.isEmpty() || model.get("currentUser")==null){
			return "redirect:/login";
		}else{
			return "createItinerary";
		}
	}

	@RequestMapping(path="/users/{userName}/createItinerary", method=RequestMethod.POST)
	public String createItinerary(Itinerary itinerary, 
			@RequestParam(required=false) int[] landmarkIds,
			ModelMap model) {

		if(model.isEmpty() || model.get("currentUser")==null){
			return "redirect:/login";
		}else{
			if(itinerary==null){
				return "redirect:/createItinerary";
			} else {
				Itinerary theItinerary =itineraryDao.getItineraryById(itineraryDao.createItinerary(itinerary));
				if (landmarkIds != null && landmarkIds.length>0){
					for (int landId : landmarkIds){
						itineraryDao.addLandmark2Itin(theItinerary.getItineraryId(), landId);
					}
				}
				//model.put("itinerary", theItinerary);
				AppUser sessionUser = (AppUser)model.get("currentUser");
				return "redirect:/users/"+sessionUser.getUsername()+"/itinerary";
			}

		}
	}
	//	@RequestMapping(path="/users/{userName}/addLandmark2Itinerary", method=RequestMethod.POST)
	//	public String addLandmark2Itin(@RequestParam int itineraryId, @RequestParam(required=false) int[] landmarkIds, ModelMap model) {
	//		for (int landId : landmarkIds){
	//			itinDAO.addLandmark2Itin(itineraryId, landId);
	//		}
	//		AppUser sessionUser = (AppUser)model.get("currentUser");
	//		return "redirect:/users/"+sessionUser.getUsername()+"/registeredUser";
	//	}
}

