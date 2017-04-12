package com.techelevator.capstone.model;

import java.util.List;
import java.time.LocalDateTime;

public class Itinerary {

	private Long itineraryId;
	private Long userId;
	private List<Long> landmarkIds;
	private double startingLatitude;
	private double startingLongitude;
	private LocalDateTime dateCreated;

	public Long getItineraryId() {
		return itineraryId;
	}
	public void setItineraryId(Long itineraryId) {
		this.itineraryId = itineraryId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public List<Long> getLandmarkIds() {
		return landmarkIds;
	}
	public void setLandmarkIds(List<Long> landmarkIds) {
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
	public LocalDateTime getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

}
