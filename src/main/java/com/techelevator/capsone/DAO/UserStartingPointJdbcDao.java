package com.techelevator.capsone.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.capstone.model.UserStartingPoint;

@Component
public class UserStartingPointJdbcDao implements UserStartingPointDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public UserStartingPointJdbcDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public UserStartingPoint createStartingPoint(UserStartingPoint usp) {
		String sqlNewSP = "INSERT INTO user_starting_point "
				+ "(starting_id, itinerary_id, full_address, starting_latitude, starting_longitude) " + "VALUES (?,?,?,?,?)";
		Long id = getNextId();
		int rowsAffected = jdbcTemplate.update(sqlNewSP, 
				id, usp.getItineraryId(), usp.getFullAddress(), 
				usp.getLatitude(), usp.getLongitude());
		if (rowsAffected == 1) {
			return usp;
		} else {
			return null;
		}
	}

	@Override
	public List<UserStartingPoint> getListStartingPoingByUserId(long userId) {
		List<UserStartingPoint> usps = new ArrayList<UserStartingPoint>();
		String sqlSPbyUser = "SELECT * FROM user_starting_point WHERE itinerary_id = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSPbyUser, userId);
		while (result.next()) {
			usps.add(mapRowToUser(result));
		}
		return usps;
	}

	private UserStartingPoint mapRowToUser(SqlRowSet row) {
		UserStartingPoint usp = new UserStartingPoint();
		usp.setStartingId(getNextId());
		usp.setItineraryId(row.getLong("itinerary_id"));
		usp.setFullAddress(row.getString("full_address"));
		usp.setLatitude(row.getDouble("starting_latitude"));
		usp.setLongitude(row.getDouble("starting_longitude"));
		return usp;
	}

	private Long getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('user_starting_point_starting_id_seq')";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		if (result.next()) {
			return result.getLong(1);
		} else {
			throw new RuntimeException("Something went wrong while getting the next user id");
		}
	}

	@Override
	public boolean updateStartingPointByIds(double longitude, double latitude, long itineraryId, long startingId) {
		String sqlUpdateUserSP = "UPDATE user_starting_point SET latitude = ?, longitude = ? WHERE itinerary_id = ? AND starting_id = ?";
		int result = jdbcTemplate.update(sqlUpdateUserSP, latitude, longitude, itineraryId, startingId);
		return result == 1;
	}

	@Override
	public boolean deletStartingPointByIds(long itineraryId, long startingId) {
		String sqlDeleteUser = "DELETE FROM user_starting_point WHERE itinerary_id = ? AND starting_id = ?";
		int result = jdbcTemplate.update(sqlDeleteUser, itineraryId, startingId);
		return result == 1;
	}

}
