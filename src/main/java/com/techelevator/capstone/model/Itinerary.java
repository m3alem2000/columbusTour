package com.techelevator.capstone.model;

public class Itinerary {

	private Long userId;
	private Long landmarkId;
	private double startingLatitude;
	private double startingLongitude;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getLandmarkId() {
		return landmarkId;
	}

	public void setLandmarkId(Long landmarkId) {
		this.landmarkId = landmarkId;
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
