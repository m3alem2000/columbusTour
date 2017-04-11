package com.techelevator.capsone.DAO;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.capstone.model.Itinerary;

public class ItineraryJdbcDao implements ItineraryDAO{

	private JdbcTemplate jdbcTemplate;

	@Override
	public void createItinerary(Itinerary itinerary) {
		String sqlCreateItinerary = "INSERT INTO itinerary(user_id, landmark_id, starting_latitude, starting_longitude, date_created) VALUES (?,?,?,?,?)";
		jdbcTemplate.update(sqlCreateItinerary, itinerary.getUserId(), itinerary.getlandmarkId(), itinerary.getStartingLatitude(), itinerary.getStartingLongitude());
	}

	@Override
	public Itinerary readItineraryById(long itineraryId) {
		Itinerary itinerary = null;
		String sqlgetItineraryById = "select * from itinerary where itinerary_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlgetItineraryById, itinerary);
		if(results.next()){
		itinerary = mapRowToItinerary(results);
		}
		return itinerary;
	}
		
	@Override
	public List<Itinerary> itineraryByUser(long userId) {
		List<Itinerary> userItineraries = new ArrayList<>();
		String sqlSelectItineraryByUser = "SELECT itinerary.landmark_id " +
				"FROM itinerary " +
			     "JOIN users ON itinerary.user_id = users.user_id " +
			     "WHERE users.user_id = ? "+
			     "ORDER BY date_created DESC ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectItineraryByUser, userId);
		while(results.next()) {
			Itinerary itinerary = new Itinerary();
			itinerary.setUserId(results.getLong("user_id"));
			itinerary.setLandmarkId(results.getLong("landmark_id"));
			itinerary.setStartingLatitude(results.getDouble("starting_Latitude"));
			itinerary.setStartingLongitude(results.getDouble("starting_Longitude"));
			itinerary.setDateCreated(results.getTimestamp("date_created").toLocalDateTime());
			userItineraries.add(itinerary);
		}
		return userItineraries;
	}

	@Override
	public void deleteItineraryByUserId(long userId) {
		String sqlDeleteItinerary = "DELETE FROM itinerary "+
			     "WHERE user_id = ?";
		jdbcTemplate.update(sqlDeleteItinerary, userId);
	}
	
	private Itinerary mapRowToItinerary(SqlRowSet results) {
	Itinerary theItinerary;
	theItinerary = new Itinerary();
	theItinerary.setUserId(results.getLong("user_id"));
	theItinerary.setStartingLatitude(results.getDouble("startingLatitude"));
	theItinerary.setStartingLongitude(results.getDouble("startingLongitude"));
	
	return theItinerary;
	}	
}
