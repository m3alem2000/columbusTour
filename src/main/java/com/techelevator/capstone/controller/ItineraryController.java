package com.techelevator.capstone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.capsone.DAO.ItineraryDAO;
import com.techelevator.capsone.DAO.UserStartingPointDAO;

@Controller
public class ItineraryController {
	
	@Autowired
	private ItineraryDAO itineraryDao;
	@Autowired
	private UserStartingPointDAO uspDao;
	
	@RequestMapping(path="/itinerary", method=RequestMethod.GET)
	public String displayItineraryForm() {
		return "itinerary";
	}
	
}
	