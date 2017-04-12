package com.techelevator.capstone.model;

public class Review {

	private long reviewId;
	private long landmarkId;
	private long userId;
	private String review;
	private long rating;

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

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public long getRating() {
		return rating;
	}

	public void setRating(long rating) {
		this.rating = rating;
	}

}
