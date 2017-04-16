package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.UserStartingPoint;

public interface UserStartingPointDAO {

	public	UserStartingPoint createStartingPoint(UserStartingPoint usp);
	
	public List<UserStartingPoint> getListStartingPoingByUserId(long userId);
	
	public boolean updateStartingPointByIds(double longitude, double latitude, long itineraryId, long startingId);
	
	public boolean deletStartingPointByIds(long itineraryId, long startingId);

	

	
}
