package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.UserStartingPoint;

public interface UserStartingPointDAO {

	public	UserStartingPoint createStartingPoint(Long itineraryId, String address, double latitude,
			double longitude);
	
	public List<UserStartingPoint> getListStartingPoingByUserId(long userId);
	
	public boolean updateStartingPointByIds(double longitude, double latitude, long itineraryId, long startingId);
	
	public boolean deletStartingPointByIds(long itineraryId, long startingId);

	

	
}
