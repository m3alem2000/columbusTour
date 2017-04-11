package com.techelevator.capsone.DAO;

import com.techelevator.capstone.model.Landmark;

public interface LandmarkDAO {
	//CRUD
	public boolean createLandMark(Landmark landmark);
	
	public Landmark readLandmarkById(long landmarkId);
	
	public boolean updateLmandmarkById(int landmarkId, Landmark landmark);
	
	public boolean deleteLandmarkById(int landmarkId);
}
