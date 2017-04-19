package com.techelevator.capstone.model;

import java.time.LocalDateTime;

public class Itinerary {

	private int itineraryId;
	private int landmarkId;
	private String itineraryName;
	private String landmarkName;
	private String description;
	private String landmarkPicture;
	private String landmarkRating;
	private int userId;
	private double startingLatitude;
	private double startingLongitude;
	private String startAddress;
	private double destinationLatitude;
	private double destinationLongitude;
	private LocalDateTime dateCreated;

	public int getLandmarkId() {
		return landmarkId;
	}
	public void setLandmarkId(int landmarkId) {
		this.landmarkId = landmarkId;
	}
	public String getLandmarkName() {
		return landmarkName;
	}
	public void setLandmarkName(String landmarkName) {
		this.landmarkName = landmarkName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLandmarkPicture() {
		return landmarkPicture;
	}
	public void setLandmarkPicture(String landmarkPicture) {
		this.landmarkPicture = landmarkPicture;
	}
	public String getLandmarkRating() {
		return landmarkRating;
	}
	public void setLandmarkRating(String landmarkRating) {
		this.landmarkRating = landmarkRating;
	}
	public String getStartAddress() {
		return startAddress;
	}
	public void setStartAddress(String startAddress) {
		this.startAddress = startAddress;
	}
	
	public String getItineraryName() {
		return itineraryName;
	}
	public void setItineraryName(String itineraryName) {
		this.itineraryName = itineraryName;
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
