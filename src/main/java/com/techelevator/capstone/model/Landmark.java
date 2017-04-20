package com.techelevator.capstone.model;

public class Landmark {

	private Long landmarkId;
	private String landmarkName; // next val
	private String landmarkSubName; //*=Required
	private String landmarkPicture;
	private double landmarkRating;
	private double latitude;//*
	private double longitude;//*
	private String state;//*
	private String city;//*
	private Long zipCode;//*
	private String address;
	private String description;//*
	private boolean topPick;
	private boolean isActive;
	
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	public boolean isTopPick() {
		return topPick;
	}
	public void setTopPick(boolean topPick) {
		this.topPick = topPick;
	}
	public Long getLandmarkId() {
		return landmarkId;
	}
	public void setLandmarkId(Long landmarkId) {
		this.landmarkId = landmarkId;
	}
	public String getLandmarkName() {
		return landmarkName;
	}
	public void setLandmarkName(String landmarkName) {
		this.landmarkName = landmarkName;
	}

	public void setLandmarkSubName(String landmarkSubName) {
		this.landmarkSubName = landmarkSubName;
	}
	public String getLandmarkSubName() {
		if(landmarkName.length()>30){
			landmarkName = landmarkName.substring(0,26)+"...";
		}
		return landmarkName;
	}
	public String getLandmarkPicture() {
		return landmarkPicture;
	}
	public void setLandmarkPicture(String landmarkPicture) {
		this.landmarkPicture = landmarkPicture;
	}
	public double getLandmarkRating() {
		return landmarkRating;
	}
	public void setLandmarkRating(double d) {
		this.landmarkRating = d;
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
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Long getZipCode() {
		return zipCode;
	}
	public void setZipCode(Long zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
