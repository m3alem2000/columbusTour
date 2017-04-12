package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.UserStartingPoint;

public interface UserStartingPointDAO {

	public UserStartingPoint createStartingPoint(Long userId, String address, double latitude, double longitude);
	
	public List<UserStartingPoint> getListStartingPoingByUserId(long userId);
	
	public boolean updateStartingPointByIds(double longitude, double latitude, long userId, long startingId);
	
	public boolean deletStartingPointByIds(long userId, long startingId);
	
}
