
package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.Itinerary;

public interface ItineraryDAO {
	//CRUD
	public Long createItinerary(Itinerary itinerary);

	public Itinerary getItineraryById(long itineraryId);
	public List<Itinerary> getItinerariesListByUserId(int userId);
	public List<Itinerary> getItinerariesDetailByUserId(int userId, int itineraryId);

	public void deleteItineraryByItineraryId(long itineraryId);
}