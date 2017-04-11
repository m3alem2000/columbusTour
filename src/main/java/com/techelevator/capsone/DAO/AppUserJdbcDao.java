package com.techelevator.capsone.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.capstone.model.AppUser;
import com.techelevator.security.PasswordHasher;

public class AppUserJdbcDao implements AppUserDAO{
	
	
	private PasswordHasher passwordHasher;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public AppUserJdbcDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	

	@Override
	public void createAppUser(AppUser appUser, String password) {
	String sqlSaveUser = "INSERT INTO users (user_id, email_address, username, first_name, last_name, home_address, salt, hash, isAdmin) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	Long id = getNextId();
	   //ALTER TABLE user ADD salt text;
    byte[] salt = passwordHasher.generateRandomSalt();
    String hashedPassword = passwordHasher.computeHash(password, salt);
    String saltString = new String(Base64.encode(salt));
	jdbcTemplate.update(sqlSaveUser, id, appUser.getEmail(), appUser.getUsername(), appUser.getFirstName(), appUser.getLastName(), appUser.getAddress(), hashedPassword, saltString, appUser.isAdmin());
	}

	@Override
	public List<AppUser> readAppUserById(long appUserId) {
		List<AppUser> users = new ArrayList<>();
		String sqlGetUserID = "SELECT * FROM users WHERE user_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetUserID, appUserId);
		while(results.next()) {
			users.add(mapRowToUser(results));
		}
		return users;
	}

	@Override
	public void updateAppUser(AppUser appUser) {
		String sqlUpdateUserInfo = "UPDATE users SET email_address = ?, username = ?, first_name = ?, last_name = ?, home_address = ? WHERE user_id = ?";
		jdbcTemplate.update(sqlUpdateUserInfo, appUser.getEmail(), appUser.getUsername(), appUser.getFirstName(), appUser.getLastName(), appUser.getAddress(), appUser.getUserId());
	}

	@Override
	public void deleteAppUser(long appUserId) {
		String sqlDeleteUser = "DELETE FROM users WHERE user_id = ?";
		jdbcTemplate.update(sqlDeleteUser, appUserId);
	}
	
	private AppUser mapRowToUser(SqlRowSet row) {
		AppUser user = new AppUser();
		user.setAddress(row.getString("home_address"));
		user.setEmail(row.getString("email_address"));
		user.setFirstName(row.getString("first_name"));
		user.setLastName(row.getString("last_name"));
		user.setUsername(row.getString("username"));
		user.setAdmin(row.getBoolean("isAdmin"));
		return user;
	}
	
	private Long getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('user_user_id_seq')";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		if(result.next()) {
			return result.getLong(1);
		} else {
			throw new RuntimeException("Something went wrong while getting the next user id");
		}
	}

}
