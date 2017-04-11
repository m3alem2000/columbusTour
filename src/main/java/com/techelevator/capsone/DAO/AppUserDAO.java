package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.AppUser;

public interface AppUserDAO {
	//CRUD
	public void createAppUser(AppUser appUser, String password);
	//DONE
	public List<AppUser> readAppUserById(long appUserId);
	//DONE
	public void updateAppUser(AppUser appUser);
	//DONE
	public void deleteAppUser(long appUserId);
	//DONE

	//NOTES: The reason I made these void was due to not actually 
	//returning any values, but simply creating them in the database
	//with the exception of readAppUserById
	
}
