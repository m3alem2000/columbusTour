package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.Landmark;

public interface LandmarkDAO {
	//CRUD
	public void createLandmark(Landmark landmark);
	
	public Landmark readLandmarkById(long landmarkId);
	//get the top x=however many landmarks with highest rating
	public List<Landmark> getTopXLandmarks(int X);
	
	public void updateLandmarkById(Landmark landmark);
	public List<Landmark> getTopFiveLandMarks();
	public void deleteLandmarkById(long landmarkId);

}
