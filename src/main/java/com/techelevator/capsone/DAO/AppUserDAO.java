package com.techelevator.capsone.DAO;

import com.techelevator.capstone.model.AppUser;

public interface AppUserDAO {
	//CRUD
	public boolean createAppUser(AppUser appUser);
	
	public AppUser readAppUserById(long appUserId);
	
	public boolean updateAppUser(AppUser appuser);
	
	public boolean deleteAppUser(long appUserId);
}
