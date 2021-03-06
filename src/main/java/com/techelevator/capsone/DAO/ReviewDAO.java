package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.Review;

public interface ReviewDAO {
	public Review createReview(Review review);
	// takes a model review and creates that in db
	public Review getReviewById(long reviewId);
	// retrieves a specific review by its ID from db

	public List<Review> getAllLandmarksReviews();
	public List<Review> getAllLandmarksReviewsByUserId(long userId);
	public List<Review> getAllLandmarkReviews(long landmarkId);
	//returns a list of all reviews for a specific landmark


	public boolean updateReview(Review review);
	//will take a review model and update db
	public boolean deleteReviewById(long reviewId);

}
