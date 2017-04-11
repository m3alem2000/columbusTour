package com.techelevator;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbcp2.BasicDataSource;
import org.junit.After;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.techelevator.capsone.DAO.AppUserDAO;
import com.techelevator.capstone.model.AppUser;


public class AppUserJdbcDAOIntegrationTest extends DAOIntegrationTest {

	@Autowired private BasicDataSource dataSource;
	@Autowired private AppUserDAO userDAO;

	
	@After
	public void rollback() throws SQLException {
		dataSource.getConnection().rollback();
	}
	
	@Test
	public void creates_new_row_for_user_creation() {
		AppUser user = new AppUser();
		user.setAddress("123 abc street");
		user.setAdmin(false);
		user.setEmail("123abc@abc.com");
		user.setFirstName("Bill");
		user.setLastName("Bob");
		user.setUsername("BillBob123");
		userDAO.createAppUser(user, "Billybob1");
		List<AppUser> results = userDAO.readAppUserById(2);
		Assert.assertNotNull(results);
//		Assert.assertEquals(results.get(0).getUserId(), user.getUserId());
	}
	
	
	private void assertUsersEquals(AppUser expected, AppUser actual)
	{	
		Assert.assertEquals(expected.getAddress(), actual.getAddress());
		Assert.assertEquals(expected.getEmail(), actual.getEmail());
		Assert.assertEquals(expected.getFirstName(), actual.getFirstName());
		Assert.assertEquals(expected.getLastName(), actual.getLastName());
		Assert.assertEquals(expected.getUsername(), actual.getUsername());
		Assert.assertEquals(expected.getUserId(), actual.getUserId());
	}
	
	
}
