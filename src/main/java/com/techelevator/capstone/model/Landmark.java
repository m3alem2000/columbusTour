package com.techelevator.capstone.model;

public class Landmark {

	private Long landmarkId;
	private String landmarkName;
	private String landmarkSubName;
	private String landmarkPicture;
	private int landmarkRating;
	private double latitude;
	private double longitude;
	private String state;
	private String city;
	private Long zipCode;
	private String address;
	private String description;
	
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
	public String getLandmarkSubName() {
		return landmarkSubName;
	}
	public void setLandmarkSubName(String landmarkSubName) {
		this.landmarkSubName = landmarkSubName;
	}
	public String getLandmarkSubName(String landmarkName) {
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
	public int getLandmarkRating() {
		return landmarkRating;
	}
	public void setLandmarkRating(int landmarkRating) {
		this.landmarkRating = landmarkRating;
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
