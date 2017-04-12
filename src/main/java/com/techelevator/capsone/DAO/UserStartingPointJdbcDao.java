package com.techelevator.capsone.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import com.techelevator.capstone.model.UserStartingPoint;

public class UserStartingPointJdbcDao implements UserStartingPointDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public UserStartingPointJdbcDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public UserStartingPoint createStartingPoint(Long userId, String address, double latitude, double longitude) {
		String sqlNewSP = "INSERT INTO user_starting_point "
				+ "(starting_id, user_id, full_address, starting_latitude, starting_longitude) " + "VALUES (?,?,?,?,?)";
		Long id = getNextId();
		int rowsAffected = jdbcTemplate.update(sqlNewSP, id, address, latitude, longitude);
		if (rowsAffected == 1) {
			UserStartingPoint usp = new UserStartingPoint();
			usp.setStartingId(id);
			usp.setUserId(userId);
			usp.setFullAddress(address);
			usp.setLatitude(latitude);
			usp.setLongitude(longitude);
			return usp;
		} else {
			return null;
		}
	}

	@Override
	public List<UserStartingPoint> getListStartingPoingByUserId(long userId) {
		List<UserStartingPoint> usps = new ArrayList<UserStartingPoint>();
		String sqlSPbyUser = "SELECT * FROM user_starting_point WHERE userId = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSPbyUser, userId);
		while (result.next()) {
			usps.add(mapRowToUser(result));
		}
		return usps;
	}

	private UserStartingPoint mapRowToUser(SqlRowSet row) {
		UserStartingPoint usp = new UserStartingPoint();
		usp.setUserId(row.getLong("user_id"));
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
	public boolean updateStartingPointByIds(double longitude, double latitude, long userId, long startingId) {
		String sqlUpdateUserSP = "UPDATE user_starting_point SET latitude = ?, longitude = ? WHERE user_id = ? AND starting_id = ?";
		int result = jdbcTemplate.update(sqlUpdateUserSP, latitude, longitude, userId, startingId);
		return result == 1;
	}

	@Override
	public boolean deletStartingPointByIds(long userId, long startingId) {
		String sqlDeleteUser = "DELETE FROM user_starting_point WHERE user_id = ? AND starting_id = ?";
		int result = jdbcTemplate.update(sqlDeleteUser, userId, startingId);
		return result == 1;
	}

}
