package com.techelevator.capstone.model;

import java.time.LocalDateTime;

public class Itinerary {

	private int itineraryId;
	private int userId;
	private double startingLatitude;
	private double startingLongitude;
	private double destinationLatitude;
	private double destinationLongitude;
	private int userStartingPointId;
	private LocalDateTime dateCreated;

	public int getUserStartingPointId() {
		return userStartingPointId;
	}
	public void setUserStartingPointId(int userStartingPointId) {
		this.userStartingPointId = userStartingPointId;
	}
	
	public double getDestinationLatitude() {
		return destinationLatitude;
	}
	public void setDestinationLatitude(double destinationLatitude) {
		this.destinationLatitude = destinationLatitude;
	}
	public double getDestinationLongitude() {
		return destinationLongitude;
	}
	public void setDestinationLongitude(double destinationLongitude) {
		this.destinationLongitude = destinationLongitude;
	}
	public int getItineraryId() {
		return itineraryId;
	}
	public void setItineraryId(int itineraryId) {
		this.itineraryId = itineraryId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
