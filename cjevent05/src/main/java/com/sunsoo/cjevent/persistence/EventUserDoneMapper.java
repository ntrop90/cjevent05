package com.sunsoo.cjevent.persistence;

import com.sunsoo.cjevent.domain.EventUserDone;

public interface EventUserDoneMapper {
	int getUserCount(EventUserDone eventUserDone);
	void insertEvent1UserDone(EventUserDone eventUserDone);
	void updateEvent1UserDone(EventUserDone eventUserDone);
	int getEvent1Count(EventUserDone eventUserDone);
	void updateDoneMmsFlag(EventUserDone eventUserDone);
	boolean getDoneMmsFlag(EventUserDone eventUserDone);
	void updateFbWebCount(EventUserDone eventUserDone);
	void updateFbMobileCount(EventUserDone eventUserDone);
	void updateTwWebCount(EventUserDone eventUserDone);
	void updateTwMobileCount(EventUserDone eventUserDone);
	void updateKsWebCount(EventUserDone eventUserDone);
	void updateKsMobileCount(EventUserDone eventUserDone);
	void updateBuyWebCount(EventUserDone eventUserDone);
	void updateBuyMobileCount(EventUserDone eventUserDone);
	void updateKtCount(EventUserDone eventUserDone);
}
