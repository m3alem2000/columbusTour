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
		Long id = getNextId();
		String sqlCreateItinerary = "INSERT INTO itinerary(itinerary_id, user_id, landmark_ids, starting_latitude, starting_longitude) VALUES (?,?,?,?,?)";
		jdbcTemplate.update(sqlCreateItinerary, itinerary.getItineraryId(), itinerary.getUserId(), itinerary.getLandmarkIds(), itinerary.getStartingLatitude(), itinerary.getStartingLongitude());
		itinerary.setItineraryId(id);
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
			itinerary.setItineraryId(results.getLong("itinerary_id"));
			itinerary.setUserId(results.getLong("user_id"));
			itinerary.setStartingLatitude(results.getDouble("starting_Latitude"));
			itinerary.setStartingLongitude(results.getDouble("starting_Longitude"));
			itinerary.setDateCreated(results.getTimestamp("date_created").toLocalDateTime());
			userItineraries.add(itinerary);
		}
		return userItineraries;
	}

	@Override
	public boolean updateItinerary(long itineraryId, Itinerary itinerary) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteItineraryById(long itineraryId) {
		
		return false;
	}
	

	private Long getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_itinerary_id')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		Long id = null;
		if(results.next()) {
			id = results.getLong(1);
		} else {
			throw new RuntimeException("Unable to select next itinerary id from sequence");
		}
		return id;
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
