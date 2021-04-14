package kr.or.ddit.calendar.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.model.CalendarVo;
import kr.or.ddit.model.MemberVo;

public interface CalendarService {

	//해당 프로젝트의 업무 불러오기
	Map<String, Object> callAllCalendar(String prjctno);
	
//	일정 참석자 리스트
	List<MemberVo> attendkeydown(MemberVo memVo);
	
//	일정 등록 
	int insertCl(CalendarVo calendarVo);
	
//	일정 등록 (참석자들)
	int insertCl_user(CalendarVo calendarVo);

}
