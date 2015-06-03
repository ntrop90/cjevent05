package com.sunsoo.cjevent.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

import com.sunsoo.cjevent.domain.*;
import com.sunsoo.cjevent.persistence.*;
import com.sunsoo.cjevent.service.EventService;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventUserMapper eventUserMapper;
	private EventUserDoneMapper eventUserDoneMapper;
	private EventTrackingMapper eventTrackingMapper;
	private EventCashManageMapper eventCashManageMapper;
	
	@Transactional
	public boolean checkExistingUser(String remote_phone) {
		EventUserDone eventUserDone = new EventUserDone();
		eventUserDone.setRemote_phone(remote_phone);
		// if the user's remote_phone exists, return 1
		if(eventUserDoneMapper.getUserCount(eventUserDone) >= 1) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@Transactional
	public void entryWebEvent1Again(String remote_phone) {
		EventUserDone eventUserDone = new EventUserDone();
		eventUserDone.setRemote_phone(remote_phone);
		EventUser eventUser = new EventUser();
		eventUser.setRemote_phone(remote_phone);
		eventUser.setEvent_num(1);
		eventUser.setWm_flag(false);
		// 기존의 유저이지만 이벤트1에 참가한 적이 있는지를 알아야한다.
		int event1cnt = eventUserDoneMapper.getEvent1Count(eventUserDone); 
		eventUserDoneMapper.updateEvent1UserDone(eventUserDone);
		eventUserMapper.insertUser(eventUser);
		if(event1cnt == 0) {
			// 기존에 있지만 이벤트1에 참가한 적이 없는 경우에는 트래킹을 달리 해야 한다.
			eventTrackingMapper.updateTrackingEvent1CountAndDist();
		}
		else {
			eventTrackingMapper.updateTrackingEvent1Count();
		}
	}
	
	@Transactional
	public void entryWebEvent1Newly(String remote_phone) {
		EventUser eventUser = new EventUser();
		EventUserDone eventUserDone = new EventUserDone();
		eventUser.setRemote_phone(remote_phone);
		eventUser.setEvent_num(1);
		eventUser.setWm_flag(true);
		eventUserDone.setRemote_phone(remote_phone);
		eventUserDone.setEvent1_cnt(1);
		eventUserDoneMapper.insertEvent1UserDone(eventUserDone);
		eventUserMapper.insertUser(eventUser);
		// tracking update도 동시에 해야 한다
		eventTrackingMapper.updateTrackingEvent1CountAndDist();
	}

	@Transactional
	public void entryMobileEvent1Again(String remote_phone) {
		EventUserDone eventUserDone = new EventUserDone();
		eventUserDone.setRemote_phone(remote_phone);
		EventUser eventUser = new EventUser();
		eventUser.setRemote_phone(remote_phone);
		eventUser.setEvent_num(1);
		eventUser.setWm_flag(true);
		// 기존의 유저이지만 이벤트1에 참가한 적이 있는지를 알아야한다.
		int event1cnt = eventUserDoneMapper.getEvent1Count(eventUserDone); 
		eventUserDoneMapper.updateEvent1UserDone(eventUserDone);
		eventUserMapper.insertUser(eventUser);
		if(event1cnt == 0) {
			// 기존에 있지만 이벤트1에 참가한 적이 없는 경우에는 트래킹을 달리 해야 한다.
			eventTrackingMapper.updateTrackingEvent1CountAndDist();
		}
		else {
			eventTrackingMapper.updateTrackingEvent1Count();
		}
	}
	
	@Transactional
	public void entryMobileEvent1Newly(String remote_phone) {
		EventUser eventUser = new EventUser();
		EventUserDone eventUserDone = new EventUserDone();
		eventUser.setRemote_phone(remote_phone);
		eventUser.setEvent_num(1);
		eventUser.setWm_flag(false);
		eventUserDone.setRemote_phone(remote_phone);
		eventUserDone.setEvent1_cnt(1);
		eventUserDoneMapper.insertEvent1UserDone(eventUserDone);
		eventUserMapper.insertUser(eventUser);
		// tracking update도 동시에 해야 한다
		eventTrackingMapper.updateTrackingEvent1CountAndDist();
	}
	
	@Transactional
	public int getCashCount(int cash_type) {
		EventCashManage eventCashManage = new EventCashManage();
		eventCashManage.setCash_type(cash_type);
		return eventCashManageMapper.getCashCount(eventCashManage);
	}

	@Transactional
	 public boolean checkUserCash(String remote_phone) {
		// 이 경우 존재하면 true이고 내가 받은 적이 없을 경우 false가 된다.
		 EventCashManage eventCashManage = new EventCashManage();
		 eventCashManage.setRemote_phone(remote_phone);
		 if(eventCashManageMapper.getUserCount(eventCashManage) == 0) {
			 return false;
		 }
		 else {
			 return true;
		 }
	}

	@Transactional
	public void assignUserCash(String remote_phone, int cash_type) {
		EventCashManage eventCashManage = new EventCashManage();
		eventCashManage.setRemote_phone(remote_phone);
		eventCashManage.setCash_type(cash_type);
		eventCashManageMapper.insertCashManage(eventCashManage);
	}
	
	@Transactional
	public void updateMmsCount() {
		eventTrackingMapper.updateMmsCount();
	}
	
	@Transactional
	public void updateMmsCountAndFlaging(String remote_phone) {
		EventUserDone eventUserDone = new EventUserDone();
		eventUserDone.setRemote_phone(remote_phone);
		eventUserDoneMapper.updateDoneMmsFlag(eventUserDone);
		eventTrackingMapper.updateMmsCount();
	}
	
	@Transactional
	public boolean getDoneMmsFlag(String remote_phone) {
		EventUserDone eventUserDone = new EventUserDone();
		eventUserDone.setRemote_phone(remote_phone);
		return eventUserDoneMapper.getDoneMmsFlag(eventUserDone);
	}
}
