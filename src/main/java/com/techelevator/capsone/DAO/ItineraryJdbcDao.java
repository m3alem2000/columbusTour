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
	public List<Itinerary> getItinerariesListByUserId(long userId) {
		String sqlgetItineraryById = "select * from itinerary where  user_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlgetItineraryById, userId);
		List<Itinerary> userItineraries = new ArrayList<>();
		while(results.next()){
			userItineraries.add(mapRowToItinerary(results));
		}
		return userItineraries;
	}

	@Override
	public List<Itinerary> getItinerariesDetailByUserId(long userId) {
		String sqlSelectItineraryByUser = "select * from itinerary"+
		"join itinerary_landmark on itinerary_landmark.itinerary_id = itinerary.itinerary_id"+
		"join landmark on itinerary_landmark.landmark_id = landmark.landmark_id"+
		"join user_starting_point on user_starting_point.starting_id = itinerary.user_starting_point_id"+
		"where itinerary.user_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectItineraryByUser, userId);
		List<Itinerary> userItineraries = new ArrayList<>();
		while(results.next()){
			userItineraries.add(mapRowToItinerary(results));
		}
		return userItineraries;
	}
		private Itinerary mapRowToItinerary(SqlRowSet results) {
			Itinerary theItinerary = new Itinerary();
			theItinerary.setItineraryId(results.getLong("itinerary_id"));
			theItinerary.setUserId(results.getLong("user_id"));
			theItinerary.setStartingLatitude(results.getDouble("starting_Latitude"));
			theItinerary.setStartingLongitude(results.getDouble("starting_Longitude"));
			theItinerary.setDestinationLatitude(results.getDouble("Longitude"));
			theItinerary.setDestinationLatitude(results.getDouble("Latitude"));
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
