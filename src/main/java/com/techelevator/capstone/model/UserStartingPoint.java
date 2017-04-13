package com.techelevator.capstone.model;

public class UserStartingPoint {
	private long startingId;
	private long itineraryId;
	private String fullAddress;
	private double latitude;
	private double longitude;

	public long getStartingId() {
		return startingId;
	}

	public void setStartingId(long startingId) {
		this.startingId = startingId;
	}
	
	public long getItineraryId() {
		return itineraryId;
	}

	public void setItineraryId(long itineraryId) {
		this.itineraryId = itineraryId;
	}

	public String getFullAddress() {
		return fullAddress;
	}

	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

}
