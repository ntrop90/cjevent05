package com.sunsoo.cjevent.persistence;

import com.sunsoo.cjevent.domain.EventUserDone;

public interface EventUserDoneMapper {
	int getUserCount(EventUserDone eventUserDone);
	void insertEvent1UserDone(EventUserDone eventUserDone);
	void updateEvent1UserDone(EventUserDone eventUserDone);
	int getEvent1Count(EventUserDone eventUserDone);
}
