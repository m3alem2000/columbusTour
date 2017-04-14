package com.techelevator.capsone.DAO;

import java.util.List;

import com.techelevator.capstone.model.AppUser;

public interface AppUserDAO {
	//CRUD
	public AppUser createAppUser(String userName, String email, String password);
	public AppUser createAdmin(AppUser admin, String password);

	//DONE
	public AppUser readUserById(long appUserId);
	public AppUser readUserByEmail(String appUserEmail);
	public List<AppUser> readAllAppUsers();
	//DONE
	public void deleteAppUser(long appUserId);
	//DONE
	public boolean matchUsernameAndPassword(String email, String password);
	public boolean updateAppUserProfile(AppUser user);

}
