package com.techelevator.capsone.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.capstone.model.Itinerary;

@Component
public class ItineraryJdbcDao implements ItineraryDAO{

	private JdbcTemplate jdbcTemplate;


	@Autowired
	public ItineraryJdbcDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public Long createItinerary(Itinerary itinerary) {
		Long itineraryId = getNextId();
		String sqlCreateItinerary = "INSERT INTO itinerary"
				+ "(itinerary_id, "
				+ "itinerary_name, "
				+ "user_id, "
				+ "start_lat, "
				+ "start_lon ) "
				+ "VALUES (?,?,?,?,?)";
		int result = jdbcTemplate.update(sqlCreateItinerary, 
				itineraryId, 
				itinerary.getItineraryName(), 
				itinerary.getUserId(), 
				itinerary.getStartingLatitude(),
				itinerary.getStartingLongitude());
		if (result==1){
			return itineraryId;
		}

		return null;
	}

	@Override
	public Itinerary getItineraryById(long itineraryId) {
		String sqlgetItineraryById = "SELECT * FROM itinerary WHERE itinerary_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlgetItineraryById, itineraryId);
		if (results.next()){
			return mapRowToItinerary(results);
		}
		return null;
	}

	@Override
	public List<Itinerary> getItinerariesListByUserId(long userId) {
		String sqlgetItineraryById = "select * from itinerary where user_id = ?";
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
		String sqlSelectItineraryByUser = "SELECT * FROM itinerary "+
				"JOIN itinerary_landmark ON itinerary_landmark.itinerary_id = itinerary.itinerary_id "+
				"JOIN landmark ON itinerary_landmark.landmark_id = landmark.landmark_id "+
				"WHERE itinerary.user_id = ? AND itinerary.itinerary_id = ?";
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
		theItinerary.setItineraryName(results.getString("itinerary_name"));
		theItinerary.setUserId(results.getInt("user_id"));
		theItinerary.setStartingLatitude(results.getDouble("start_lat"));
		theItinerary.setStartingLongitude(results.getDouble("start_lon"));
		theItinerary.setDateCreated(results.getTimestamp("date_created").toLocalDateTime());
		return theItinerary;
	}

	private Itinerary mapRowToItineraryDetail(SqlRowSet results) {
		Itinerary theItinerary = new Itinerary();
		theItinerary.setItineraryId(results.getInt("itinerary_id"));
		theItinerary.setItineraryName(results.getString("itinerary_name"));
		theItinerary.setUserId(results.getInt("user_id"));
		theItinerary.setStartingLatitude(results.getDouble("start_lat"));
		theItinerary.setStartingLongitude(results.getDouble("start_lon"));
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

	@Override
	public boolean addLandmark2Itin(long itinId, long landId) {
		String sqlAdd2Itin = "INSERT INTO  itinerary_landmark "+
				"( landmark_id, itinerary_id)"
				+ "VALUES (?,?)";
		int result = jdbcTemplate.update(sqlAdd2Itin, landId, itinId);
		return result==1;
	}

}
