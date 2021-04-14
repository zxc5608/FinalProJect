package kr.or.ddit.calendar.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.stereotype.Service;

import kr.or.ddit.calendar.repository.CalendarDao;
import kr.or.ddit.model.CalendarVo;
import kr.or.ddit.model.MemberVo;

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService{

	@Resource(name = "calendarDao")
	public CalendarDao calendarDao;

	@Override
	public Map<String, Object> callAllCalendar(String prjctno) {
		Map<String, Object> map = new HashedMap<>();
		
		map.put("callTask", calendarDao.callTask(prjctno));
		map.put("callCalendar", calendarDao.callCalendar(prjctno));
		return map;
	}

//	일정 참석자 리스트

	@Override
	public List<MemberVo> attendkeydown(MemberVo memVo) {
		return calendarDao.attendkeydown(memVo);
	}

	@Override
	public int insertCl(CalendarVo calendarVo) {
		return calendarDao.insertCl(calendarVo);
	}

	@Override
	public int insertCl_user(CalendarVo calendarVo) {
		return calendarDao.insertCl_user(calendarVo);
	}
}
