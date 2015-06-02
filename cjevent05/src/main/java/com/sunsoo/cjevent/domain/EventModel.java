package com.sunsoo.cjevent.domain;

public class EventModel {
	
	private String remote_phone;
	private String remote_msg;
	private boolean remote_flag;
	
	public String getRemote_phone() {
		return remote_phone;
	}
	public void setRemote_phone(String remote_phone) {
		this.remote_phone = remote_phone;
	}
	public String getRemote_msg() {
		return remote_msg;
	}
	public void setRemote_msg(String remote_msg) {
		this.remote_msg = remote_msg;
	}
	public boolean isRemote_flag() {
		return remote_flag;
	}
	public void setRemote_flag(boolean remote_flag) {
		this.remote_flag = remote_flag;
	}
	
}
