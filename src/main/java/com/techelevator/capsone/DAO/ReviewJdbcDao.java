package com.techelevator.capsone.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.capstone.model.AppUser;
import com.techelevator.capstone.model.Landmark;
import com.techelevator.capstone.model.Review;

public class ReviewJdbcDao implements ReviewDAO{

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public ReviewJdbcDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public boolean createReview(Review review) {
		String sqlCreateReview = "INSERT INTO review (landmark_id, user_id, review, rating) VALUES ( ?, ?, ?, ?)";
		int result = jdbcTemplate.update(sqlCreateReview, review.getLandmarkId(), review.getUserId(), review.getReview(), review.getRating());
		return result==1;
	}

	@Override
	public Review getReviewById(Review review) {
		String sqlReviewById = "SELECT * FROM review WHERE landmark_id = ? AND user_id = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlReviewById, review.getLandmarkId(), review.getUserId());
		Review requested = mapRowToReview(result);
		return requested;
	}

	@Override
	public List<Review> allLandmarksReviews(long landmarkId) {
		List<Review> reviews = new ArrayList<>();
		String sqlReviewById = "SELECT * FROM review";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlReviewById);
		while(results.next()) {
			reviews.add(mapRowToReview(results));
		}
		return reviews;
	}

	@Override
	public boolean updateReview(Review review) {
		String sqlUpdateReview = "UPDATE users SET landmark_id = ?, user_id = ?, review = ?, rating = ?";
		int result = jdbcTemplate.update(sqlUpdateReview, review.getLandmarkId(), review.getUserId(), review.getReview(), review.getRating());
		return result==1;
	}

	@Override
	public boolean deleteReview(Review review) {
		String sqlDeleteUser = "DELETE FROM review WHERE user_id = ? OR landmark_id = ?";
		int result = jdbcTemplate.update(sqlDeleteUser, review.getUserId(), review.getLandmarkId());
		return result==1;
	}
	
	private Review mapRowToReview(SqlRowSet row) {
		Review review = new Review();
		review.setLandmarkId(row.getLong("landmark_id"));
		review.setUserId(row.getLong("user_id"));
		review.setReview(row.getString("review"));
		review.setRating(row.getLong("rating"));
		return review;
	}
	

}
