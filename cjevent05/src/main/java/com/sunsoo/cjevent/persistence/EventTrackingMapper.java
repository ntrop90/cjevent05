package com.sunsoo.cjevent.persistence;

public interface EventTrackingMapper {
	void updateTrackingEvent1Count();
	void updateTrackingEvent1CountAndDist();
	void updateMmsCount();
	void updateFbWebCount();
	void updateFbMobileCount();
	void updateTwWebCount();
	void updateTwMobileCount();
	void updateKsWebCount();
	void updateKsMobileCount();
	void updateBuyWebCount();
	void updateBuyMobileCount();
	void updateKtCount();
}
