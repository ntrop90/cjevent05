package com.sunsoo.cjevent.domain;

import java.util.Date;

public class EventCashManage {

	private String remote_phone;
	private int cash_type;
	private Date reg_date;
	
	public String getRemote_phone() {
		return remote_phone;
	}
	public void setRemote_phone(String remote_phone) {
		this.remote_phone = remote_phone;
	}
	public int getCash_type() {
		return cash_type;
	}
	public void setCash_type(int cash_type) {
		this.cash_type = cash_type;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
