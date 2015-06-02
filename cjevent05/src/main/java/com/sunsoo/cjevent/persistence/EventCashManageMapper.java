package com.sunsoo.cjevent.persistence;

import com.sunsoo.cjevent.domain.EventCashManage;

public interface EventCashManageMapper {
	 int getCashCount(EventCashManage eventCashManage);
	 int getUserCount(EventCashManage eventCashManage);
	 void insertCashManage(EventCashManage eventCashManage);
}
