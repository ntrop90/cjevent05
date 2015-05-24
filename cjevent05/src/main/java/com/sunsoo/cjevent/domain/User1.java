package com.sunsoo.cjevent.domain;

import java.util.Date;

public class User1 {
	private int user_id;
	private String user_name;
	private String phone1;
	private String phone2;
	private String phone3;
	private Date reg_date;
	
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
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public boolean equals(Object o) {
		User1 u = (User1) o;
		if(phone1.equals(u.getPhone1()) && phone2.equals(u.getPhone2()) && phone3.equals(u.getPhone3())) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public int hashCode() {
		String s = "" + phone1 + phone2 + phone3;
		return s.hashCode();
	}
	
}
