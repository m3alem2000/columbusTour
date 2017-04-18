package com.techelevator.capsone.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.capstone.model.Review;

@Component
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
				+ "(review_id, landmark_id, user_id, review, rating, date_created) VALUES "
				+ "(?, ?, ?, ?, ?,?)";
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
	public List<Review> getAllLandmarksReviews() {
		List<Review> reviews = new ArrayList<>();
		String sqlReviews = "SELECT r.*, u.username FROM review r JOIN users u ON r.user_id = u.user_id ORDER BY r.date_created DESC";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlReviews);
		while(results.next()) {
			reviews.add(mapRowToReviewWithUsername(results));
		}
		return reviews;
	}

	@Override
	public List<Review> getAllLandmarksReviewsByUserId(long userId) {
		List<Review> reviews = new ArrayList<>();
		String sqlReviewById = "SELECT * FROM review WHERE user_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlReviewById, userId);
		while(results.next()) {
			reviews.add(mapRowToReviewWithUsername(results));
		}
		return reviews;
	}

	@Override
	public List<Review> getAllLandmarkReviews(long landmarkId) {
		List<Review> reviews = new ArrayList<>();
		String sqlReviews = "SELECT * FROM review "
				+ "WHERE landmark_id =? "
				+ "ORDER by review.date_created DESC";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlReviews, landmarkId);
		while(results.next()) {
			reviews.add(mapRowToReview(results));
		}
		return reviews;
	}

	@Override
	public boolean updateReview(Review review) {//look into dateCreated here
		String sqlUpdateReview = "UPDATE users SET landmark_id = ?, user_id = ?, review = ?, rating = ?";
		int result = jdbcTemplate.update(sqlUpdateReview, review.getLandmarkId(), review.getUserId(), review.getReview(), review.getRating());
		return result==1;
	}

	@Override
	public boolean deleteReviewById(long reviewId) {
		String sqlDeleteUser = "DELETE FROM review WHERE review_id = ?";
		int result = jdbcTemplate.update(sqlDeleteUser, reviewId);
		return result==1;
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

	private Review mapRowToReview(SqlRowSet row) {
		Review review = new Review();
		review.setReviewId(row.getLong("review_id"));
		review.setLandmarkId(row.getLong("landmark_id"));
		review.setUserId(row.getLong("user_id"));
		review.setReview(row.getString("review"));
		review.setRating(row.getLong("rating"));
		review.setDateCreated(row.getTimestamp("date_created").toLocalDateTime());
		return review;
	}

	private Review mapRowToReviewWithUsername(SqlRowSet row) {
		Review review = new Review();
		review.setReviewId(row.getLong("review_id"));
		review.setLandmarkId(row.getLong("landmark_id"));
		review.setUserId(row.getLong("user_id"));
		review.setUsername(row.getString("username"));
		review.setReview(row.getString("review"));
		review.setRating(row.getLong("rating"));
		review.setDateCreated(row.getTimestamp("date_created").toLocalDateTime());
		return review;
	}


}
