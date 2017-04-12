package com.techelevator.capsone.DAO;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.capstone.model.Itinerary;
import com.techelevator.capstone.model.Landmark;

//@Component
public class ItineraryJdbcDao implements ItineraryDAO{

	private JdbcTemplate jdbcTemplate;
	//	private Itinerary itinerary;


	@Autowired
	public ItineraryJdbcDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public void createItinerary(Itinerary itinerary) {
		Long itineraryId = getNextId();
		String sqlCreateItinerary = "INSERT INTO itinerary"
				+ "(itinerary_id, user_id, starting_latitude, starting_longitude) "
				+ "VALUES (?,?,?,?,?,?)";
		jdbcTemplate.update(sqlCreateItinerary, itineraryId, itinerary.getUserId(), itinerary.getStartingLatitude(), itinerary.getStartingLongitude());

		// TODO: Add all landmarks into the itinerary landmark join table
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
		String sqlSelectItineraryByUser = "SELECT itinerary_id "+
				"FROM itinerary "+
				"WHERE user_id = ? "+ 
				"ORDER BY date_created DESC ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectItineraryByUser, userId);
		while(results.next()) {
			Itinerary itinerary = new Itinerary();
			itinerary.setItineraryId(results.getLong("itinerary_id"));
			itinerary.setUserId(userId);
			itinerary.setStartingLatitude(results.getDouble("starting_Latitude"));
			itinerary.setStartingLongitude(results.getDouble("starting_Longitude"));
			itinerary.setDateCreated(results.getTimestamp("date_created").toLocalDateTime());

			List<Landmark> landmarksList = getLandmarksByItinerary(itinerary.getItineraryId());
			itinerary.setLandmarkIds(landmarksList);
			userItineraries.add(itinerary);
		}
		return userItineraries;
	}

	@Override
	public void deleteItineraryByItineraryId(long itineraryId) {
		String sqlDeleteItinerary = "DELETE FROM itinerary "+
				"WHERE itinerary_id = ?";
		jdbcTemplate.update(sqlDeleteItinerary, itineraryId);
	}

	private List<Landmark> getLandmarksByItinerary(long itineraryId){
		List<Landmark> landmarksList = new ArrayList<Landmark>();
		// TODO: This should be a JOIN on Landmark
		String sqlGetAllLandmarks = "SELECT * FROM landmark " +
				"JOIN landmark_itinerary ON landmark.landmark_id = landmark_itinerary.landmark_id " +
				"WHERE landmark_itinerary.itinerary_id = ? ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllLandmarks, itineraryId);
		while(results.next()){
			Landmark landmark = new Landmark();
			// TODO fill in all of the data
			landmarksList.add(landmark);
		}
		return landmarksList;
	}

	private Itinerary mapRowToItinerary(SqlRowSet results) {
		Itinerary theItinerary;
		theItinerary = new Itinerary();
		theItinerary.setUserId(results.getLong("user_id"));
		theItinerary.setStartingLatitude(results.getDouble("startingLatitude"));
		theItinerary.setStartingLongitude(results.getDouble("startingLongitude"));

		return theItinerary;
	}	

	private Long getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('itinerary_itinerary_id_seq')";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		if(result.next()) {
			return result.getLong(1);
		} else {
			throw new RuntimeException("Something went wrong while getting the next user id");
		}
	}
}
