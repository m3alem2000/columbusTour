package com.techelevator.capstone.model;

import java.util.List;

public class Itinerary {

	private Long userId;
	private List<Long> landmarkIds;
	private double startingLatitude;
	private double startingLongitude;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public List<Long> getLandmarkId() {
		return landmarkIds;
	}

	public void setLandmarkId(List<Long> landmarkIds) {
		this.landmarkIds = landmarkIds;
	}

	public double getStartingLatitude() {
		return startingLatitude;
	}

	public void setStartingLatitude(double startingLatitude) {
		this.startingLatitude = startingLatitude;
	}

	public double getStartingLongitude() {
		return startingLongitude;
	}

	public void setStartingLongitude(double startingLongitude) {
		this.startingLongitude = startingLongitude;
	}

}
