package com.techelevator.capsone.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import com.techelevator.capstone.model.Review;

public class ReviewJdbcDao implements ReviewDAO{

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public ReviewJdbcDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public boolean createReview(Review review) {
		Long reviewId = getNextId();
		String sqlCreateReview = "INSERT INTO review "
				+ "(review_id, landmark_id, user_id, review, rating) VALUES "
				+ "(?, ?, ?, ?, ?)";
		int result = jdbcTemplate.update(sqlCreateReview, 
				reviewId, review.getLandmarkId(), review.getUserId(), review.getReview(), review.getRating());
		return result==1;
	}

	@Override
	public Review getReviewById(Long reviewId) {
		String sqlReviewById = "SELECT * FROM review WHERE review_id = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlReviewById, reviewId);
		Review requested = mapRowToReview(result);
		return requested;
	}

	@Override
	public List<Review> allLandmarksReviews(long landmarkId) {
		List<Review> reviews = new ArrayList<>();
		String sqlReviewById = "SELECT * FROM review "+
				"WHERE landmark_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlReviewById, landmarkId);
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
	public boolean deleteReview(Review review) {//should CTUAALLY BE THE ID ALONE
		String sqlDeleteUser = "DELETE FROM review WHERE review_id = ?";
		int result = jdbcTemplate.update(sqlDeleteUser, review.getReviewId());
		return result==1;
	}

	private Review mapRowToReview(SqlRowSet row) {
		Review review = new Review();
		review.setReviewId(row.getLong("review_id"));
		review.setLandmarkId(row.getLong("landmark_id"));
		review.setUserId(row.getLong("user_id"));
		review.setReview(row.getString("review"));
		review.setRating(row.getLong("rating"));
		return review;
	}

	private Long getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_review_id')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		Long id = null;
		if(results.next()) {
			id = results.getLong(1);
		} else {
			throw new RuntimeException("Unable to select next landmark id from sequence");
		}
		return id;
	}


}
