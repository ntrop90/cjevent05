package com.sunsoo.cjevent.service;

import com.sunsoo.cjevent.domain.EventUserDone;

public interface EventService {
	public boolean checkExistingUser(String remote_phone);
	public void entryWebEvent1Again(String remote_phone);
	public void entryWebEvent1Newly(String remote_phone);
	public void entryMobileEvent1Again(String remote_phone);
	public void entryMobileEvent1Newly(String remote_phone);
	public int getCashCount(int cash_type);
	public boolean checkUserCash(String remote_phone);
	public void assignUserCash(String remote_phone, int cash_type);
	public void updateMmsCount();
	public void updateMmsCountAndFlaging(String remote_phone);
	public boolean getDoneMmsFlag(String remote_phone);
}
