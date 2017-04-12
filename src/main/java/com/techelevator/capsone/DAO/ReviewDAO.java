package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.Review;

public interface ReviewDAO {
	public boolean createReview(Review review);

	public Review getReviewById(Long reviewId);
	public List<Review> allLandmarksReviews(long landmarkId);

	public boolean updateReview(Review review);//?????

	public boolean deleteReview(Review review);
}
