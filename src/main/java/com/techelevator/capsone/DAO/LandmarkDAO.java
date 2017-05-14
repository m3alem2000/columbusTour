package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.Landmark;

public interface LandmarkDAO {
	//CRUD
	public boolean createLandmark(Landmark landmark);
	
	public Landmark readLandmarkById(long landmarkId);
	//get the top x=however many landmarks with highest rating
	public List<Landmark> getTopXLandmarks(int X);
	public List<Landmark> getTopPickLandMarksByFlag();
	public List<Landmark> getAllLandmarks();

	public boolean updateLandmarkById(Landmark landmark);
	
	public boolean inactivateLandmarkById(long landmarkId);

}
