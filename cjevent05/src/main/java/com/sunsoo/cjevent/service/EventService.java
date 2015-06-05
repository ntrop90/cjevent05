package com.sunsoo.cjevent.service;

public interface EventService {
	public boolean checkExistingUser(String remote_phone);
	public void entryWebEvent1Again(String remote_phone, String remote_name);
	public void entryWebEvent1Newly(String remote_phone, String remote_name);
	public void entryMobileEvent1Again(String remote_phone, String remote_name);
	public void entryMobileEvent1Newly(String remote_phone, String remote_name);
	public int getCashCount(int cash_type);
	public boolean checkUserCash(String remote_phone);
	public void assignUserCash(String remote_phone, int cash_type);
	public void updateMmsCount();
	public void updateMmsCountAndFlaging(String remote_phone);
	public boolean getDoneMmsFlag(String remote_phone);
	public void updateFbWebCntTracking();
	public void updateFbMobileCntTracking();
	public void updateTwWebCntTracking();
	public void updateTwMobileCntTracking();
	public void updateKsWebCntTracking();
	public void updateKsMobileCntTracking();
	public void updateBuyWebCntTracking();
	public void updateBuyMobileCntTracking();
	public void updateKtCntTracking(String remote_phone);
}
