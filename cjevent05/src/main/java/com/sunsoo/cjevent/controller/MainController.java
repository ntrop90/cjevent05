package com.sunsoo.cjevent.controller;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import java.util.Calendar;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sunsoo.cjevent.domain.*;
import com.sunsoo.cjevent.service.EventService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	//private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired
	private EventService eventService;
	
	// web Main
	@RequestMapping("/web/main")
	public String webMain() {
		return "web/main";
	}
	
	// 웹에서의 문자 전송 로직
	@RequestMapping(value = "/web/result", method = RequestMethod.POST)
	public String webResult(@ModelAttribute EventModel eventModel) {
		// 사용자의 휴대폰 번호를 SHA-256으로 암호화
		String remote_phone = encryptPhone(eventModel.getRemote_phone());
		
		// 이벤트 응모자의 사전 응모 여부 검사 후 트래킹까지 완료하는 로직
		if(eventService.checkExistingUser(remote_phone)) {
			// 이미 응모한 사용자의 경우
			eventService.entryWebEvent1Again(remote_phone);
		}
		else {
			// 처음 응모하는 사용자의 경우
			eventService.entryWebEvent1Newly(remote_phone);
		}
		
		// 경품 추첨 후 문자 발송을 위함
		// submit 전에 remote_msg의 내용을 Controller에서 조작해준다.
		// 이벤트가 총 23일동안 진행되므로 경품의 갯수를 조절해야함
		// VIPS(10), CGV(30), 기프티콘(50)
		Calendar cal = Calendar.getInstance();
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int vips_max = 10; int cgv_max = 30; int gift_max = 50;
		// 첫 시작 날짜가 8일이기 때문에 해당 날짜에서 7을 뺀 뒤에 해당 인자만큼 곱하고
		// 각 숫자를 23으로 나눈 뒤 해당 숫자만큼 곱해서 그 날짜에 풀면 된다.
		int vips_cnt = (int)(day - 7) * vips_max / 23;
		int cgv_cnt = (int)(day - 7) * cgv_max / 23;
		int gift_cnt = (int)(day - 7) * gift_max / 23;
		/* 당첨 인공지능 상세 설명
		 * 즉 VIPS는 3일 째(10일)가 되어야 30/23이 되므로 1개가 풀리는데
		 * 이렇게 버림한 숫자인 1이 DB에서 당첨된 사람의 수와 동등할 경우 당첨되지 않는다.
		 * 마지막 날은 이 수치가 10, 30, 50이 되는데 DB에서 값이 같아질 때까지 당첨 확률이 존재한다.
		 * 지난 이벤트에 몇 천명 단위로 이벤트를 참여했기 때문에 당첨 확률은 1/1000, 3/1000, 5/1000으로 해야 적합해보인다.
		 */
		// 먼저 Database에서 당첨된 사람의 수를 가져온다.
		int vips_done = eventService.getCashCount(0);
		int cgv_done = eventService.getCashCount(1);
		int gift_done = eventService.getCashCount(2);
		// 어차피 중복 당첨은 안되게 처리할 것이기 때문에 if문을 3개 쓸 것이다.(하드코딩)
		// 남은게 없거나 내가 이미 당첨이 된 경우 여기로 분기한다.
		if((vips_done == vips_cnt && cgv_done == cgv_cnt && gift_done == gift_cnt)
				|| eventService.checkUserCash(remote_phone)) {
			// 더 이상 할당된 쿠폰이 없다면 100% 무조건 당첨 쿠폰만 갖게된다. 일단 3으로 표기.
			// 더 이상 MMS를 받지 않아도 되는지 done_mms를 검사 후 보내야 한다면
			// if문 들어가야함
			eventModel.setRemote_msg("3");
			// 만약 이미 문자가 전송되었다면 remote_flag를 false로 두어 문자가 발송되지 않도록
			// 최초로 보낸 1회의 문자라면 문자 보낸 것에 대한 트래킹을 한다.
		}
		else {
			// userRandomNum은 0 ~ 999 사이의 수를 갖는다.
			// (0) : VIPS, (1, 2, 3) : CGV,(4, 5, 6, 7, 8) : GIFT
			int userRandomNum = (int)(Math.random() * 1000);
			if(vips_done < vips_cnt || eventService.checkUserCash(remote_phone)) {
				if(userRandomNum == 0) {
					eventService.assignUserCash(remote_phone, 0);
					eventModel.setRemote_msg("0");
					// 트래킹 꼭 해야함 
				}
			}
			if(cgv_done < cgv_cnt || eventService.checkUserCash(remote_phone)) {
				if(userRandomNum >= 1 && userRandomNum <= 3) {
					eventService.assignUserCash(remote_phone, 1);
					eventModel.setRemote_msg("1");
					// 트래킹 꼭 해야함 
				}
			}
			if(gift_done < gift_cnt || eventService.checkUserCash(remote_phone)) {
				if(userRandomNum >= 4 && userRandomNum <= 8) {
					eventService.assignUserCash(remote_phone, 2);
					eventModel.setRemote_msg("2");
					// 트래킹 꼭 해야함 
				}
			}
			// 결국 당첨되지 않았을 경우
			if(eventService.checkUserCash(remote_phone)) {
				// if문 들어가야함(done_mms 검사 필요)
				eventModel.setRemote_msg("3");
				// 만약 이미 문자가 전송되었다면 remote_flag를 false로 두어 문자가 발송되지 않도록
				// 최초로 보낸 1회의 문자라면 문자 보낸 것에 대한 트래킹을 한다.
			}
		}
		return "web/result";
	}
	
	@RequestMapping(value = "/web/shareWebFb", method = RequestMethod.POST)
	public String shareWebFb(@ModelAttribute EventTracking eventTracking) {
		// 트래킹이 들어가는 부분(2개 table의 fb_web_cnt가 올라감)
		return "redirect:(facebook share url)";
	}

	@RequestMapping(value = "/web/shareMobileFb", method = RequestMethod.POST)
	public String shareMobileFb(@ModelAttribute EventTracking eventTracking) {
		// 트래킹이 들어가는 부분(2개 table의 fb_m_cnt가 올라감)
		return "redirect:(facebook share url)";
	}

	@RequestMapping(value = "/web/shareWebTw", method = RequestMethod.POST)
	public String shareWebTw(@ModelAttribute EventTracking eventTracking) {
		// 트래킹이 들어가는 부분(2개 table의 tw_web_cnt가 올라감)
		return "redirect:(twitter share url)";
	}

	@RequestMapping(value = "/web/shareMobileTw", method = RequestMethod.POST)
	public String shareMobileTw(@ModelAttribute EventTracking eventTracking) {
		// 트래킹이 들어가는 부분(2개 table의 tw_m_cnt가 올라감)
		return "redirect:(twitter share url)";
	}

	@RequestMapping(value = "/web/shareWebKs", method = RequestMethod.POST)
	public String shareWebKs(@ModelAttribute EventTracking eventTracking) {
		// 트래킹이 들어가는 부분(2개 table의 ks_web_cnt가 올라감)
		return "redirect:(KakaoStory share url)";
	}

	@RequestMapping(value = "/web/shareMobileKs", method = RequestMethod.POST)
	public String shareMobileKs(@ModelAttribute EventTracking eventTracking) {
		// 트래킹이 들어가는 부분(2개 table의 ks_m_cnt가 올라감)
		return "redirect:(KakaoStory share url)";
	}

	@RequestMapping(value = "/web/goWebBuy", method = RequestMethod.POST)
	public String goWebBuy(@ModelAttribute EventTracking eventTracking) {
		// 트래킹이 들어가는 부분(2개 table의 buy_web_cnt가 올라감)
		return "redirect:(요거트 파우더 구매 url)";
	}

	@RequestMapping(value = "/web/goMobileBuy", method = RequestMethod.POST)
	public String goMobileBuy(@ModelAttribute EventTracking eventTracking) {
		// 트래킹이 들어가는 부분(2개 table의 buy_m_cnt가 올라감)
		return "redirect:(요거트 파우더 구매 모바일 url)";
	}

	@RequestMapping(value = "/web/shareKt", method = RequestMethod.POST)
	public String shareKt(@ModelAttribute EventTracking eventTracking) {
		// 트래킹이 들어가는 부분(2개 table의 kt_cnt가 올라감)
		return "redirect:(카카오톡 프로토콜에 따른 url)";
	}

	// web Result
	@RequestMapping(value = "/web/resulttest", method = RequestMethod.POST)
	public String webResultTest(@ModelAttribute EventModel eventModel) {
		/*  tracking logic 필요, confirm  필요한 부분이라 코드에서 모두 제외 */
		// CJ랑 이야기해야하는 부분이라 제외
		// 몇 개까지 허용할 것인지, 중복을 허용하지 않을 것인지 여부를 이야기해야함.
		// 그리고 지금 디자인에는 이름을 쓰는 폼이 없는데 이 부분 어떻게 처리해야하는지 논의해야함.
		// DB 에는 사람 이름을 넣기로 되어있는데...( user_name > remote_name )
		/* 이상이 없다면 DB 에 등록 */
		//eventService.insertUser1(eventUserDone);
		return "web/resulttest";
	}
	// web Result check(문자발송 성공여부 임시페이지)
	@RequestMapping(value = "/web/resultcheck")
	public String Resultcheck(@ModelAttribute EventUserDone eventUserDone) {
		return "web/resultcheck";
	}
	// mobile Main
	@RequestMapping("/m/main")
	public String mMain() {
		return "m/main";
	}
	
	// 모바일에서의 문자 전송 로직
	@RequestMapping(value = "/m/result", method = RequestMethod.POST)
	public String mResult(@ModelAttribute EventModel eventModel) {
		// 사용자의 휴대폰 번호를 SHA-256으로 암호화
		String remote_phone = encryptPhone(eventModel.getRemote_phone());
		
		// 이벤트 응모자의 사전 응모 여부 검사 후 트래킹까지 완료하는 로직
		if(eventService.checkExistingUser(remote_phone)) {
			// 이미 응모한 사용자의 경우
			eventService.entryMobileEvent1Again(remote_phone);
		}
		else {
			// 처음 응모하는 사용자의 경우
			eventService.entryMobileEvent1Newly(remote_phone);
		}
		
		// 경품 추첨 후 문자 발송을 위함
		// submit 전에 remote_msg의 내용을 Controller에서 조작해준다.
		// 이벤트가 총 23일동안 진행되므로 경품의 갯수를 조절해야함
		// VIPS(10), CGV(30), 기프티콘(50)
		Calendar cal = Calendar.getInstance();
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int vips_max = 10; int cgv_max = 30; int gift_max = 50;
		// 첫 시작 날짜가 8일이기 때문에 해당 날짜에서 7을 뺀 뒤에 해당 인자만큼 곱하고
		// 각 숫자를 23으로 나눈 뒤 해당 숫자만큼 곱해서 그 날짜에 풀면 된다.
		int vips_cnt = (int)(day - 7) * vips_max / 23;
		int cgv_cnt = (int)(day - 7) * cgv_max / 23;
		int gift_cnt = (int)(day - 7) * gift_max / 23;
		/* 당첨 인공지능 상세 설명
		 * 즉 VIPS는 3일 째(10일)가 되어야 30/23이 되므로 1개가 풀리는데
		 * 이렇게 버림한 숫자인 1이 DB에서 당첨된 사람의 수와 동등할 경우 당첨되지 않는다.
		 * 마지막 날은 이 수치가 10, 30, 50이 되는데 DB에서 값이 같아질 때까지 당첨 확률이 존재한다.
		 * 지난 이벤트에 몇 천명 단위로 이벤트를 참여했기 때문에 당첨 확률은 1/1000, 3/1000, 5/1000으로 해야 적합해보인다.
		 */
		// 먼저 Database에서 당첨된 사람의 수를 가져온다.
		int vips_done = eventService.getCashCount(0);
		int cgv_done = eventService.getCashCount(1);
		int gift_done = eventService.getCashCount(2);
		// 어차피 중복 당첨은 안되게 처리할 것이기 때문에 if문을 3개 쓸 것이다.(하드코딩)
		// 남은게 없거나 내가 이미 당첨이 된 경우 여기로 분기한다.
		if((vips_done == vips_cnt && cgv_done == cgv_cnt && gift_done == gift_cnt)
				|| eventService.checkUserCash(remote_phone)) {
			// 더 이상 할당된 쿠폰이 없다면 100% 무조건 당첨 쿠폰만 갖게된다. 일단 3으로 표기.
			// 더 이상 MMS를 받지 않아도 되는지 done_mms를 검사 후 보내야 한다면
			// if문 들어가야함
			eventModel.setRemote_msg("3");
			// 만약 이미 문자가 전송되었다면 remote_flag를 false로 두어 문자가 발송되지 않도록
			// 최초로 보낸 1회의 문자라면 문자 보낸 것에 대한 트래킹을 한다.
		}
		else {
			// userRandomNum은 0 ~ 999 사이의 수를 갖는다.
			// (0) : VIPS, (1, 2, 3) : CGV,(4, 5, 6, 7, 8) : GIFT
			int userRandomNum = (int)(Math.random() * 1000);
			if(vips_done < vips_cnt || eventService.checkUserCash(remote_phone)) {
				if(userRandomNum == 0) {
					eventService.assignUserCash(remote_phone, 0);
					eventModel.setRemote_msg("0");
					// 트래킹 꼭 해야함 
				}
			}
			if(cgv_done < cgv_cnt || eventService.checkUserCash(remote_phone)) {
				if(userRandomNum >= 1 && userRandomNum <= 3) {
					eventService.assignUserCash(remote_phone, 1);
					eventModel.setRemote_msg("1");
					// 트래킹 꼭 해야함 
				}
			}
			if(gift_done < gift_cnt || eventService.checkUserCash(remote_phone)) {
				if(userRandomNum >= 4 && userRandomNum <= 8) {
					eventService.assignUserCash(remote_phone, 2);
					eventModel.setRemote_msg("2");
					// 트래킹 꼭 해야함 
				}
			}
			// 결국 당첨되지 않았을 경우
			if(eventService.checkUserCash(remote_phone)) {
				// if문 들어가야함(done_mms 검사 필요)
				eventModel.setRemote_msg("3");
				// 만약 이미 문자가 전송되었다면 remote_flag를 false로 두어 문자가 발송되지 않도록
				// 최초로 보낸 1회의 문자라면 문자 보낸 것에 대한 트래킹을 한다.
			}
		}
		
		return "m/result";
	}
	
	public String encryptPhone(String remote_phone) {
		String encryptedPhone = "";
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(remote_phone.getBytes());
			byte[] mb = md.digest();
            for (int i = 0; i < mb.length; i++) {
                byte temp = mb[i];
                String s = Integer.toHexString(new Byte(temp));
                while (s.length() < 2) {
                    s = "0" + s;
                }
                s = s.substring(s.length() - 2);
                encryptedPhone += s;
            }
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return encryptedPhone;
	}
}
