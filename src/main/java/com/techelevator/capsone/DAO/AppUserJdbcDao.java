package com.techelevator.capsone.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.capstone.model.AppUser;
import com.techelevator.security.PasswordHasher;

@Component
public class AppUserJdbcDao implements AppUserDAO{

	private PasswordHasher passwordHasher;
	private JdbcTemplate jdbcTemplate;



	@Autowired
	public AppUserJdbcDao(DataSource dataSource, PasswordHasher passwordHasher) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.passwordHasher = passwordHasher;
	}


	@Override
	public AppUser createAppUser(String userName, String email, String password) {
		String sqlSaveUser = "INSERT INTO users (user_id, email_address, username, salt, hash, is_admin) VALUES (?, ?, ?, ?, ?, ?)";
		Long id = getNextId();
		byte[] salt = passwordHasher.generateRandomSalt();
		String hashedPassword = passwordHasher.computeHash(password, salt);
		String saltString = new String(Base64.encode(salt));
		int rowsAffected = jdbcTemplate.update(sqlSaveUser, id, email, userName, saltString, hashedPassword, false);
		if(rowsAffected != 1) {
			return null;
		} else {
			AppUser user = new AppUser();
			user.setUserId(id);
			user.setUsername(userName);
			user.setEmail(email);
			user.setAdmin(false);
			return user;
		}
	}

	@Override
	public AppUser createAdmin(String userName, String email, String password) {
		String sqlSaveUser = "INSERT INTO users (user_id, username, hash, salt, is_admin) VALUES (?, ?, ?, ?, ?)";
		Long id = getNextId();
		byte[] salt = passwordHasher.generateRandomSalt();
		String hashedPassword = passwordHasher.computeHash(password, salt);
		String saltString = new String(Base64.encode(salt));
		int rowsAffected = jdbcTemplate.update(sqlSaveUser, id, userName, hashedPassword, saltString, true);
		if(rowsAffected != 1) {
			return null;
		} else {
			AppUser user = new AppUser();
			user.setUserId(id);
			user.setUsername(userName);
			user.setEmail(email);
			user.setAdmin(false);
			return user;
		}
	}

	@Override
	public AppUser readUserById(long appUserId) {
		AppUser user = new AppUser();
		String sqlGetUserID = "SELECT * FROM users "+
				"WHERE user_id = ? ";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetUserID, appUserId);
		if(result.next()) {
			user = mapRowToUser(result);
		}
		return user;
	}

	@Override
	public AppUser readUserByEmail(String appUserEmail) {
		AppUser user = new AppUser();
		String sqlGetUserID = "SELECT * FROM users "+
				"WHERE email_address = ? ";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetUserID, appUserEmail);
		if(result.next()) {
			user = mapRowToUser(result);
			return user;
		}
		return null;
	}

	@Override
	public List<AppUser> readAllAppUsers() {
		List<AppUser> users = new ArrayList<AppUser>();
		String sqlGetUserID = "SELECT * FROM users";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetUserID);
		while(results.next()) {
			users.add(mapRowToUser(results));
		}
		return users;
	}

	@Override
	public boolean updateAppUserProfile(AppUser user) {
		String sqlUpdateUserInfo = "UPDATE users SET (email_address,state,city,zip_code,phone_number,username,first_name,last_name,home_address)=(?,?,?,?,?,?,?,?,?) WHERE user_id = ?";
		int result = jdbcTemplate.update(sqlUpdateUserInfo, user.getEmail(), user.getState(), user.getCity(), user.getZipCode(), user.getPhoneNumber(), user.getUsername(), user.getFirstName(), user.getLastName(), user.getAddress(), user.getUserId());
		return result == 1;
	}

	@Override
	public void deleteAppUser(long appUserId) {
		String sqlDeleteUser = "DELETE FROM users WHERE user_id = ?";
		jdbcTemplate.update(sqlDeleteUser, appUserId);
	}

	private AppUser mapRowToUser(SqlRowSet row) {
		AppUser user = new AppUser();
		user.setUserId(row.getInt("user_id"));
		user.setAddress(row.getString("home_address"));
		user.setEmail(row.getString("email_address"));
		user.setFirstName(row.getString("first_name"));
		user.setLastName(row.getString("last_name"));
		user.setUsername(row.getString("username"));
		user.setAdmin(row.getBoolean("is_admin"));
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

	@Override
	public boolean matchUsernameAndPassword(String email, String password) {
		String sqlSearchForUser = "SELECT * FROM users WHERE email_address = ? ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, email);
		if (results.next()){
			String storedSalt = results.getString("salt");
			String storedPassword = results.getString("hash");
			String hashedPassword = passwordHasher.computeHash(password, Base64.decode(storedSalt));
			return storedPassword.equals(hashedPassword);
		} else {
			return false;
		}
	}

}
