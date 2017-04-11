package com.techelevator.capstone.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.capsone.DAO.AppUserDAO;
import com.techelevator.capsone.DAO.AppUserJdbcDao;

@Controller
@SessionAttributes("currentUser")
public class AuthenticationController {

	private AppUserJdbcDao appUserJdbcDao;

	@Autowired
	public AuthenticationController(AppUserJdbcDao appUserJdbcDao) {
		this.appUserJdbcDao = appUserJdbcDao;
	}

	@RequestMapping(path="/login", method=RequestMethod.GET)
	public String displayLoginForm() {
		return "login";
	}
	
	@RequestMapping(path="/signup", method=RequestMethod.GET)
	public String displaySignupForm() {
		return "signup";
	}

	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String login(Map<String, Object> model, 
			@RequestParam String userName, 
			@RequestParam String password,
			@RequestParam(required=false) String destination,
			HttpSession session) {
		if(appUserJdbcDao.searchForUsernameAndPassword(userName, password)) {
			session.invalidate();

			model.put("currentUser", userName);
			if(isValidRedirect(destination)) {
				return "redirect:"+destination;
			} else {
				return "redirect:/users/"+userName;
			}
		} else {
			return "redirect:/login";
		}
	}

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
