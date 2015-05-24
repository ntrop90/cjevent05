package com.sunsoo.cjevent.service;

import com.sunsoo.cjevent.domain.User1;
import com.sunsoo.cjevent.service.User1Service;
import com.sunsoo.cjevent.persistence.User1Mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class User1ServiceImpl implements User1Service {
	
	@Autowired
	private User1Mapper user1Mapper;
	
	@Transactional
	public void insertUser1(User1 user) {
		user1Mapper.insertUser1(user);
	}

	@Transactional
	public User1 getUser1(User1 user) {
		return user1Mapper.getUser1(user);
	}
	
	@Transactional
	public int getUser1Count(User1 user) {
		return user1Mapper.getUser1Count(user);
	}
}
