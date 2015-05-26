package com.sunsoo.cjevent.controller;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sunsoo.cjevent.domain.User1;
import com.sunsoo.cjevent.service.User1Service;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	//private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired
	private User1Service user1Service;
	
	// web Main
	@RequestMapping("/web/main")
	public String webMain() {
		/*
		User1 user = new User1();
		user.setUser_id(1);
		user.setUser_name("전선수");
		user.setReg_date(new Date());
		user.setPhone1("010");
		user.setPhone2("7172");
		user.setPhone3("7257");
		user1Service.insertUser1(user);
		*/
		return "web/main";
	}
	// web Result
	@RequestMapping(value = "/web/result", method = RequestMethod.POST)
	public String webResult(@ModelAttribute User1 user) {
		return "web/result";
	}
	
	// mobile Main
	@RequestMapping("/m/main")
	public String mMain() {
		return "m/main";
	}
	// mobile Result
	@RequestMapping(value = "/m/result", method = RequestMethod.POST)
	public String mResult(@ModelAttribute User1 user) {
		return "m/result";
	}
}
