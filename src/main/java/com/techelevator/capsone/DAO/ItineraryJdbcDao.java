package com.techelevator.capsone.DAO;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.capstone.model.Itinerary;

@Component
public class ItineraryJdbcDao implements ItineraryDAO{

	private JdbcTemplate jdbcTemplate;



	@Autowired
	public ItineraryJdbcDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public void createItinerary(Itinerary itinerary) {
		Long itineraryId = getNextId();
		String sqlCreateItinerary = "INSERT INTO itinerary"
				+ "(user_id, landmark_id, starting_latitude, starting_longitude, date_created) "
				+ "VALUES (?,?,?,?,?,?)";
		jdbcTemplate.update(sqlCreateItinerary, itineraryId, itinerary.getUserId(), itinerary.getLandmarkIds(), itinerary.getStartingLatitude(), itinerary.getStartingLongitude());
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
			List<Long> landmarksList = new ArrayList<Long>();
			landmarksList = getLandmarksIdsByItinerary(results.getLong("landmark_id"));
			itinerary.setLandmarkIds(landmarksList);
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

	private List<Long> getLandmarksIdsByItinerary(long itineraryId){
		List<Long> landmarksList = new ArrayList<Long>();
		String sqlGetAllLandmarks = "SELECT landmark_id FROM itinerary_landmark" +
				"itinerary_id = ? ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllLandmarks, itineraryId);
		while(results.next()){
			landmarksList.add(results.getLong("landmark_id"));
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
