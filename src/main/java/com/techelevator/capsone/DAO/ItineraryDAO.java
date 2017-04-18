
package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.Itinerary;

public interface ItineraryDAO {
	//CRUD
	public Long createItinerary(Itinerary itinerary);

	public Itinerary getItineraryById(long itineraryId);
	public List<Itinerary> getItinerariesListByUserId(long l);
	public List<Itinerary> getItinerariesDetailByUserId(int userId, int itineraryId);

	public boolean addLandmark2Itin(long itinId, long landId);

	public void deleteItineraryByItineraryId(long itineraryId);
}