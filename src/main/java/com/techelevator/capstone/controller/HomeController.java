package com.techelevator.capstone.controller;

import java.util.Map;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


	@Controller
	public class HomeController {
		
		@RequestMapping(path="/", method=RequestMethod.GET)
//		public String showHomePage(Map<String, Object> model) {
			public String showHomePage() {

			//model.put("messages", messageDAO.getPublicMessages(10));
			return "home";
		}
}
