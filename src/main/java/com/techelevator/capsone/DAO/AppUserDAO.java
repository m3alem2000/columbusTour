package com.techelevator.capsone.DAO;

import com.techelevator.capstone.model.AppUser;

public interface AppUserDAO {
	//CRUD
	public AppUser createAppUser(String userName, String email, String password);
	public AppUser createAdmin(String userName, String password);

	//DONE
//	public AppUser readAppUserById(long appUserId, String password);
//	public List<AppUser> readAppUserById(long appUserId);
	//DONE
	public void updateAppUser(AppUser appUser);
	//DONE
	public void deleteAppUser(long appUserId);
	//DONE
	public boolean matchUsernameAndPassword(String email, String password);

	//NOTES: The reason I made these void was due to not actually 
	//returning any values, but simply creating them in the database
	//with the exception of readAppUserById
	
}
