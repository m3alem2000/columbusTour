package com.techelevator.capsone.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.capstone.model.Itinerary;
import com.techelevator.capstone.model.Landmark;

@Component
public class ItineraryJdbcDao implements ItineraryDAO{

	private JdbcTemplate jdbcTemplate;


	@Autowired
	public ItineraryJdbcDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void createItinerary(Itinerary itinerary) {
		Long itineraryId = getNextId();
		String sqlCreateItinerary = "INSERT INTO itinerary"
				+ "(itinerary_id, user_id, starting_latitude, starting_longitude) "
				+ "VALUES (?,?,?,?,?,?)";
		jdbcTemplate.update(sqlCreateItinerary, itineraryId, itinerary.getUserId(), itinerary.getStartingLatitude(), itinerary.getStartingLongitude());

	}

	@Override
	public List<Itinerary> getItinerariesListByUserId(int userId) {
		String sqlgetItineraryById = "select * from itinerary where  user_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlgetItineraryById, userId);
		List<Itinerary> userItineraries = new ArrayList<>();
		while(results.next()){
			Itinerary theItinerary  = mapRowToItinerary(results);
			userItineraries.add(theItinerary);
		}
		return userItineraries;
	}

	@Override
	public List<Itinerary> getItinerariesDetailByUserId(int userId, int itineraryId) {
		String sqlSelectItineraryByUser = "select * from itinerary "+
		"join itinerary_landmark on itinerary_landmark.itinerary_id = itinerary.itinerary_id "+
		"join landmark on itinerary_landmark.landmark_id = landmark.landmark_id "+
		"join user_starting_point on user_starting_point.starting_id = itinerary.user_starting_point_id "+
		"where itinerary.user_id = ? and itinerary.itinerary_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectItineraryByUser, userId, itineraryId);
		List<Itinerary> userItineraries = new ArrayList<>();
		while(results.next()){
			Itinerary theItinerary  = mapRowToItineraryDetail(results);
			userItineraries.add(theItinerary);
		}
		return userItineraries;
	}
		private Itinerary mapRowToItinerary(SqlRowSet results) {
			Itinerary theItinerary = new Itinerary();
			theItinerary.setItineraryId(results.getInt("itinerary_id"));
			theItinerary.setUserId(results.getInt("user_id"));
			theItinerary.setUserStartingPointId(results.getInt("user_starting_point_id"));
			theItinerary.setDateCreated(results.getTimestamp("date_created").toLocalDateTime());
		return theItinerary;
	}
		
		private Itinerary mapRowToItineraryDetail(SqlRowSet results) {
			Itinerary theItinerary = new Itinerary();
			theItinerary.setItineraryId(results.getInt("itinerary_id"));
			theItinerary.setUserId(results.getInt("user_id"));
			theItinerary.setUserStartingPointId(results.getInt("user_starting_point_id"));
			theItinerary.setStartingLatitude(results.getDouble("starting_Latitude"));
			theItinerary.setStartingLongitude(results.getDouble("starting_Longitude"));
			theItinerary.setDestinationLatitude(results.getDouble("latitude"));
			theItinerary.setDestinationLongitude(results.getDouble("longitude"));
			theItinerary.setDateCreated(results.getTimestamp("date_created").toLocalDateTime());
		return theItinerary;
	}

	@Override
	public void deleteItineraryByItineraryId(long itineraryId) {
		String sqlDeleteItinerary = "DELETE FROM itinerary "+
				"WHERE itinerary_id = ?";
		jdbcTemplate.update(sqlDeleteItinerary, itineraryId);
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
