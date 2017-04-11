package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.Landmark;

public interface LandmarkDAO {
	//CRUD
	public boolean createLandMark(Landmark landmark);
	
	public Landmark readLandmarkById(long landmarkId);
	//get the top x=however many landmarks with highest rating
	public List<Landmark> getTopXLandmarks(int X);
	
	public boolean updateLmandmarkById(int landmarkId, Landmark landmark);
	
	public boolean deleteLandmarkById(int landmarkId);
}
