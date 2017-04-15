package com.techelevator.capsone.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.capstone.model.AppUser;
import com.techelevator.capstone.model.Landmark;

@Component
public class LandmarkJdbcDao implements LandmarkDAO{

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public LandmarkJdbcDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public boolean createLandmark(Landmark landmark) {
		Long id = getNextId();
		landmark.setLandmarkId(id);
		String sqlAddLandmark = "INSERT INTO landmark( " +
				"landmark_id, landmark_name, landmark_sub_name, " +
				"landmark_picture, landmark_rating, latitude, " +
				"longitude, state, city, " + 
				"zip_code, address, description, " + 
				"top_pick) " + 
				" VALUES ( ?,?,?,?,?,  ?,?,?,?,?, ?,?,? );";
		int result = jdbcTemplate.update(sqlAddLandmark, 
				landmark.getLandmarkId(), landmark.getLandmarkName(), landmark.getLandmarkSubName(),
				landmark.getLandmarkPicture(), landmark.getLandmarkRating(), landmark.getLatitude(), 
				landmark.getLongitude(), landmark.getState(), landmark.getCity(), 
				landmark.getZipCode(), landmark.getAddress(), landmark.getDescription(),
				landmark.isTopPick());
		return result==1;
	}

	@Override
	public Landmark readLandmarkById(long landmarkId) {
		Landmark landmark = null;
		String sqlFindLandmarkById = "select * from landmark where landmark_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlFindLandmarkById, landmarkId);
		if(results.next()){
			landmark = mapRowToLandmarks(results);
		}
		return landmark;
	}

	@Override
	public boolean updateLandmarkById(Landmark landmark) {
		String sqlUpdateLandmarkById = "Update landmark SET "+
				"(landmark_id, landmark_name, landmark_sub_name, " +
				"landmark_picture, landmark_rating, latitude, " +
				"longitude, state, city, " + 
				"zip_code, address, description, " + 
				"top_pick) " + 
				" = ( ?,?,?,?,?,  ?,?,?,?,?, ?,?,? ) " +
				"WHERE landmark_id = ?";
		int result = jdbcTemplate.update(sqlUpdateLandmarkById, 
				landmark.getLandmarkId(), landmark.getLandmarkName(), landmark.getLandmarkSubName(),
				landmark.getLandmarkPicture(), landmark.getLandmarkRating(), landmark.getLatitude(), 
				landmark.getLongitude(), landmark.getState(), landmark.getCity(), 
				landmark.getZipCode(), landmark.getAddress(), landmark.getDescription(),
				landmark.isTopPick());
		return result==1;
	}

	@Override
	public boolean deleteLandmarkById(long landmarkId) {
		String sqlDeleteLandmarkById = "DELETE FROM landmark WHERE landmark_id = ?";
		int result = jdbcTemplate.update(sqlDeleteLandmarkById, landmarkId);
		return result==1;
	}

	@Override
	public List<Landmark> getTopXLandmarks(int x) {
		String limitToX="";
		if (x >0){
			limitToX= "limit "+ Integer.toString(x);
		}
		String sqlGetTopXLandmarks = "SELECT * FROM landmark l " +
				"JOIN review r on l.landmark_id = r.landmark_id" +
				"ORDER BY rating DESC" + limitToX;
		ArrayList<Landmark> landmarkTopX = new ArrayList<Landmark>();
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetTopXLandmarks);
		while(results.next()) {
			Landmark landmark = mapRowToLandmarks(results);
			landmarkTopX.add(landmark);
		}
		return landmarkTopX;
	}

	@Override
	public List<Landmark> getTopPickLandMarksByFlag() {
		String sqlGetFlagedLandmarks = "SELECT * FROM landmark WHERE top_pick IS TRUE";
		List<Landmark> topLandmarkList = new ArrayList<Landmark>();
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetFlagedLandmarks);
		while(results.next()) {
			topLandmarkList.add(mapRowToLandmarks(results));
		}
		return topLandmarkList;
	}
	
	@Override
	public List<Landmark> getAllLandmarks() {
		String sqlGetAllLandmarks = "SELECT * FROM landmark";
		List<Landmark> allLandmarks = new ArrayList<Landmark>();
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllLandmarks);
		while(results.next()) {
			allLandmarks.add(mapRowToLandmarks(results));
		}
		return allLandmarks;
	}
	
	private Long getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('landmark_landmark_id_seq')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		Long id = null;
		if(results.next()) {
			id = results.getLong(1);
		} else {
			throw new RuntimeException("Unable to select next landmark id from sequence");
		}
		return id;
	}


	
	private Landmark mapRowToLandmarks(SqlRowSet results) {
		Landmark theLandmark;
		theLandmark = new Landmark();
		theLandmark.setLandmarkId(results.getLong("landmark_id"));
		theLandmark.setLandmarkName(results.getString("landmark_name"));
		theLandmark.setLandmarkSubName(results.getString("landmark_sub_name"));
		theLandmark.setLandmarkPicture(results.getString("landmark_picture"));
		theLandmark.setLandmarkRating(results.getInt("landmark_rating"));
		theLandmark.setLatitude(results.getDouble("latitude"));
		theLandmark.setLongitude(results.getDouble("longitude"));
		theLandmark.setState(results.getString("state"));
		theLandmark.setCity(results.getString("city"));
		theLandmark.setZipCode(results.getLong("zip_code"));
		theLandmark.setAddress(results.getString("address"));
		theLandmark.setDescription(results.getString("description"));
		theLandmark.setTopPick(results.getBoolean("top_pick"));
		return theLandmark;
	}

}
