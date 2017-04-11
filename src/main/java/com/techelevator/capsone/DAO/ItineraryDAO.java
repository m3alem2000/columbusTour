package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.Itinerary;

public interface ItineraryDAO {
	//CRUD
	public void createItinerary(Itinerary itinerary);
	
	public Itinerary readItineraryById(long itineraryId);
	public List<Itinerary> itineraryByUser(long userId);
		
	public void deleteItineraryByUserId(long userId);
}