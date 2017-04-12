package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.AppUser;

public interface AppUserDAO {
	//CRUD
	public AppUser createAppUser(String userName, String email, String password);
	public AppUser createAdmin(String userName, String password);

	//DONE
	public AppUser readUserById(long appUserId);
	public AppUser readUserByEmail(String appUserEmail);
	public List<AppUser> readAllAppUsers();
	//DONE
	public void deleteAppUser(long appUserId);
	//DONE
	public boolean matchUsernameAndPassword(String email, String password);
	public void updateAppUserProfile(String email, String state, String city, String zipCode, String phoneNumber,
			String username, String firstName, String lastName, String address);
	

	//NOTES: The reason I made these void was due to not actually 
	//returning any values, but simply creating them in the database
	//with the exception of readAppUserById

}
