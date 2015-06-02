package com.sunsoo.cjevent.domain;

import java.util.Date;

public class EventUser {
	
	private int user_id;
	private Date reg_date;
	private String remote_phone;
	private int event_num;
	private boolean wm_flag;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getRemote_phone() {
		return remote_phone;
	}
	public void setRemote_phone(String remote_phone) {
		this.remote_phone = remote_phone;
	}
	public int getEvent_num() {
		return event_num;
	}
	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}
	public boolean isWm_flag() {
		return wm_flag;
	}
	public void setWm_flag(boolean wm_flag) {
		this.wm_flag = wm_flag;
	}
	
}
