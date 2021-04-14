package kr.or.ddit.calendar.repository;

import java.util.List;

import kr.or.ddit.model.CalendarVo;
import kr.or.ddit.model.MemberVo;
import kr.or.ddit.model.TaskVo;
import kr.or.ddit.model.TaskVo2;

public interface CalendarDao {
	
	//해당 프로젝트의 업무일정 불러오기
	List<TaskVo2> callTask(String prjctno);
	
	//해당 프로젝트의 일정관리 불러오기
	List<CalendarVo> callCalendar(String prjctno);
	
//	일정 참석자 리스트
	List<MemberVo> attendkeydown(MemberVo memVo);

//	일정 등록 
	int insertCl(CalendarVo calendarVo);
	
//	일정 등록 (참석자들)
	int insertCl_user(CalendarVo calendarVo);
	
}
