package com.techelevator.capstone.model;

import java.time.LocalDateTime;
import java.util.List;

public class Itinerary {
	
	private Long userId;
	private Long landmarkId;
	private double startingLatitude;
	private double startingLongitude;
	private LocalDateTime dateCreated;


	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	public Long getlandmarkId() {
		return landmarkId;
	}

	public void setLandmarkId(Long landmarkId) {
		landmarkId = landmarkId;
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

	public LocalDateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}
}
