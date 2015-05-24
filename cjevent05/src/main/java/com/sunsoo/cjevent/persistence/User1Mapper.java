package com.sunsoo.cjevent.persistence;
import com.sunsoo.cjevent.domain.User1;

public interface User1Mapper {
	void insertUser1(User1 user);
	User1 getUser1(User1 user);
	int getUser1Count(User1 user);
}