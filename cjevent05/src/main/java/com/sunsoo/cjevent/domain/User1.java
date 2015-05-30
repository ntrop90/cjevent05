package com.sunsoo.cjevent.domain;

import java.util.Date;

public class User1 {
	private int user_id;
	private String user_name;
	private Date reg_date;
	private String remote_phone;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
	
	@Override
	public boolean equals(Object o) {
		User1 u = (User1) o;
		if(remote_phone.equals(u.getRemote_phone())) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public int hashCode() {
		String s = "" + remote_phone;
		return s.hashCode();
	}
	
}
