package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.Review;

public interface ReviewDAO {
	public void createReview(Review review);
	
	public Review getReviewById(long reviewId);
	public List<Review> allLandmarksReviews(long landmarkId);
	
	public void updateReview(Review review);//?????
	
	public boolean deleteReview(long reviewId);
}
