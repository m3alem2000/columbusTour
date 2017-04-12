package com.techelevator.capsone.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.capstone.model.Landmark;

public class LandmarkJdbcDao implements LandmarkDAO{
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public LandmarkJdbcDao(DataSource dataSource) {
	    this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	@Override
	public void createLandmark(Landmark landmark) {
		Long id = getNextId();
		String sqlAddLandmark = "Insert into landmark(landmark_id, landmark_name, landmark_picture, landmark_rating, latitude, longitude, state, city, zipcode, address, description) VALUES (?,?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sqlAddLandmark, landmark.getLandmarkId(), landmark.getLandmarkName(), landmark.getLandmarkPicture(), landmark.getLandmarkRating(), landmark.getLatitude(), landmark.getLongitude(), landmark.getState(), landmark.getCity(), landmark.getZipCode(), landmark.getAddress(), landmark.getDescription());
		landmark.setLandmarkId(id);
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
	public void updateLandmarkById(Landmark landmark) {
		String sqlUpdateLandmarkById = "Update * from landmark where landmark_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlUpdateLandmarkById, landmark);
		if(results.next()){
			landmark = mapRowToLandmarks(results);
		}
	}

	@Override
	public void deleteLandmarkById(int landmarkId) {
		String sqlDeleteLandmarkById = "Delete from landmark where landmark_id = ?";
		jdbcTemplate.update(sqlDeleteLandmarkById);
	}

	@Override
	public List<Landmark> getTopXLandmarks(int x) {
		String limitToX="";
		if (x >0){
			limitToX= "limit "+ Integer.toString(x);
		}
		String sqlGetTopXLandmarks = "select * from landmark l " +
		"join review r on l.landmark_id = r.landmark_id" +
		"order by rating desc" + limitToX;
		ArrayList<Landmark> landmarkTopX = new ArrayList<Landmark>();
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetTopXLandmarks);
		while(results.next()) {
			Landmark landmark = mapRowToLandmarks(results);
			landmarkTopX.add(landmark);
		}
		return landmarkTopX;
	}
	
	private Long getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_landmark_id')";
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
		theLandmark.setLandmarkName(results.getString("landmark_Name"));
		theLandmark.setLandmarkPicture(results.getString("landmark_picture"));
		theLandmark.setLatitude(results.getDouble("latitude"));
		theLandmark.setLongitude(results.getDouble("longitude"));
		theLandmark.setState(results.getString("state"));
		theLandmark.setCity(results.getString("city"));
		theLandmark.setZipCode(results.getLong("zipCode"));
		theLandmark.setAddress(results.getString("address"));
		theLandmark.setDescription(results.getString("description"));

		return theLandmark;
	}

}
