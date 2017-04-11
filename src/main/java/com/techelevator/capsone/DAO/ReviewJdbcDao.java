package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.Review;

public class ReviewJdbcDao implements ReviewDAO{

	@Override
	public void createReview(Review review) {
		String sqlCreateReview = "INSERT INTO review (landmark_id, user_id, review, rating) VALUES ( ?, ?, ?, ?)";
		
	}

	@Override
	public Review getReviewById(long reviewId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> allLandmarksReviews(long landmarkId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateReview(Review review) {
		
	}

	@Override
	public boolean deleteReview(long reviewId) {
		return false;
	}

}
