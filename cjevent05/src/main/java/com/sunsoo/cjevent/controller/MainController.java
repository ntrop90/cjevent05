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
		/*  tracking logic 필요, confirm  필요한 부분이라 코드에서 모두 제외 */
		// CJ랑 이야기해야하는 부분이라 제외
		// 몇 개까지 허용할 것인지, 중복을 허용하지 않을 것인지 여부를 이야기해야함.
		// 그리고 지금 디자인에는 이름을 쓰는 폼이 없는데 이 부분 어떻게 처리해야하는지 논의해야함.
		// DB 에는 사람 이름을 넣기로 되어있는데...( user_name > remote_name )
		/* 이상이 없다면 DB 에 등록 */
		user1Service.insertUser1(user);
		return "web/result";
	}
	// web Result check(문자발송 성공여부 임시페이지)
	@RequestMapping(value = "/web/resultcheck")
	public String Resultcheck(@ModelAttribute User1 user) {
		return "web/resultcheck";
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
