package kr.or.ddit.calendar.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.calendar.model.CalendarVo2;
import kr.or.ddit.calendar.service.CalendarService;
import kr.or.ddit.model.CalendarVo;
import kr.or.ddit.model.MemberVo;
import kr.or.ddit.model.TaskVo;
import kr.or.ddit.model.TaskVo2;
import kr.or.ddit.user.model.UsersVo;

@RequestMapping("calendar")
@Controller
public class CalendarController {
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Resource(name = "calendarService")
	public CalendarService calendarService; 
	
	@RequestMapping("view")
	public String calendarView() {
		return "tiles.pms_col.calendar";
	}
	
	@RequestMapping("callAllCalendar")
	public String callDB(Model model, HttpSession session) {
		
		String prjctno = (String)session.getAttribute("prjctno");
		
		Map<String, Object> map = calendarService.callAllCalendar(prjctno);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
		List<CalendarVo2> list = new ArrayList<CalendarVo2>();
		
		for(TaskVo2 vo : (List<TaskVo2>)map.get("callTask")) {
			CalendarVo2 vo1 = new CalendarVo2();
			vo1.setTitle(vo.getJobnm());
			vo1.setPrjctnm(vo.getPrjctnm());
			
			vo1.setStart(sdf.format(vo.getJobbgnde()));
			if(vo.getJobclosde() != null) {				
				vo1.setEnd(sdf.format(vo.getJobclosde()));
			}else {
				vo1.setEnd(vo.getJobbgnde().toString());
			}
			
			logger.debug("taskvo : {}", vo);
			logger.debug("calendarvo : {}", vo1.getTitle());
			list.add(vo1);
		}
		
		for(CalendarVo vo : (List<CalendarVo>)map.get("callCalendar")) {
			CalendarVo2 vo2 = new CalendarVo2();
			vo2.setTitle(vo.getFxsj());
			vo2.setColor("lightblue");
			vo2.setStart(sdf.format(vo.getFxbgnde()));
			vo2.setEnd(sdf.format(vo.getFxendde()));
			list.add(vo2);
		}
		
		model.addAttribute("AllList", list);

		return "jsonView";
	}
	
	@RequestMapping("uiview")
	public String uiview() {
		return "pms_col/ysl";
	}
	
//	일정 참석자 리스트
	@RequestMapping("attendkeydown")
	public String attendKD(String usernm, Model model) {
		
		MemberVo memVo = new MemberVo();
		
		memVo.setPrjctno("PJ2103004");
		memVo.setUsernm(usernm);
		
		List<MemberVo>memvo = calendarService.attendkeydown(memVo);
		
		model.addAttribute("memvo", memvo );
		logger.debug("memvo:{}", memvo);
		
		return "jsonView";
	}
	
	//일정 등록
	@RequestMapping(path="insertCalendar", method= {RequestMethod.POST})
	public String insertCL(CalendarVo calenVo, HttpSession session) {
		String prjctno = (String)session.getAttribute("prjctno");
		UsersVo user = (UsersVo) session.getAttribute("S_USER");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH:mm");
		
		java.util.Date date = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		String day = sdf.format(sqlDate);
		logger.debug("day : {}",day);
		
		calenVo.setPrjctno(prjctno);
		calenVo.setFxregistday(day);
		calenVo.setCwriter(user.getUsernm());
		calenVo.setCwriterid(user.getUsid());
		
		logger.debug("jsp에서 가져온 값들 : {}",calenVo);
		
		int cnt = 0;
		int cntUser = 0;
		
		try {
			cnt = calendarService.insertCl(calenVo);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		

//		for 문을 활용하여 참석자 수 만큼 insert
		try {
			cntUser = calendarService.insertCl_user(calenVo);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		

		logger.debug("cntUser {}",cntUser);
		
		return "jsonView";
	}
	
	
}
