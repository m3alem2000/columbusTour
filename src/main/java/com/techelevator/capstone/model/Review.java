package com.techelevator.capstone.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Review {

	private long reviewId;
	private long landmarkId;
	private long userId;
	private String username;
	private String review;
	private double rating;
	private LocalDateTime dateCreated;
	private String formattedDateTime;


	public long getReviewId() {
		return reviewId;
	}

	public void setReviewId(long reviewId) {
		this.reviewId = reviewId;
	}

	public long getLandmarkId() {
		return landmarkId;
	}

	public void setLandmarkId(long landmarkId) {
		this.landmarkId = landmarkId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double d) {
		this.rating = d;
	}

	public LocalDateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getFormattedDateTime() {
		return dateCreated.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
	}

	public void setFormattedDateTime(String formattedDateTime) {
		this.formattedDateTime = formattedDateTime;
	}
}
