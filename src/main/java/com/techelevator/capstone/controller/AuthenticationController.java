package com.techelevator.capstone.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.capsone.DAO.AppUserDAO;
import com.techelevator.capsone.DAO.AppUserJdbcDao;
import com.techelevator.capstone.model.AppUser;

@Controller
@SessionAttributes("currentUser")
public class AuthenticationController {

	private AppUserDAO appUserDao;

	@Autowired
	public AuthenticationController(AppUserDAO appUserDao) {
		this.appUserDao = appUserDao;
	}

	//	String sqlSearchForUser = "SELECT * "+
	//			"FROM app_user "+
	//			"WHERE UPPER(user_name) = ?";
	//
	//	SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, userName.toUpperCase());
	//	if(results.next()) {
	//		String storedSalt = results.getString("salt");
	//		String storedPassword = results.getString("password");
	//		String hashedPassword = passwordHasher.computeHash(password, Base64.decode(storedSalt));
	//		return storedPassword.equals(hashedPassword);
	//	} else {
	//		return false;
	//	}

	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String login(Map<String, Object> model, 
			@RequestParam String email, 
			@RequestParam String password,
			@RequestParam(required=false) String destination,
			HttpSession session) {
		if(appUserDao.matchUsernameAndPassword(email, password)) {
			session.invalidate();
			AppUser user = appUserDao.readUserByEmail(email);
			model.put("currentUser", user);
			if(isValidRedirect(destination)) {
				//TODO: get the secure version if the redirect
				return "redirect:"+destination;
			} else {
				return "redirect:/"+email;
			}
		} else {
			return "redirect:/";
		}
	}
	//	@RequestMapping(path="/login", method=RequestMethod.POST)
	//	public String logUser(@RequestParam String email, @RequestParam String password, ModelMap model) {
	//		if (appUserDao.matchUsernameAndPassword(email, password)) {
	//			
	//			model.put("currentUser", user);
	//		}
	//		return "redirect:/user-profile";
	//	}
	private boolean isValidRedirect(String destination) {
		return destination != null && destination.startsWith("http://localhost");
	}

	@RequestMapping(path="/logout", method=RequestMethod.POST)
	public String logout(Map<String, Object> model, HttpSession session) {
		model.remove("currentUser");
		session.removeAttribute("currentUser");
		return "redirect:/";
	}
}
