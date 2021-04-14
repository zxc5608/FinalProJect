package kr.or.ddit.task.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.model.PageVo;
import kr.or.ddit.model.TaskVo;
import kr.or.ddit.task.service.TaskService;
import kr.or.ddit.user.model.UsersVo;

@Controller
@RequestMapping("task")
public class TaskController {
	private static final Logger logger = LoggerFactory.getLogger(TaskController.class);
	
	@Resource(name = "taskService")
	public TaskService taskService;
	
	@RequestMapping("task")
	public String taskAllList(PageVo pagevo,Model model,HttpSession session,
								@RequestParam(defaultValue="1") int page,
								@RequestParam(defaultValue="5") int pageSize) {
		
		String prjctno = (String)session.getAttribute("prjctno");
		
		pagevo.setPrjctno(prjctno);
		pagevo.setPageSize(pageSize);
		pagevo.setPage(page);
		
		Map<String, Object>tasklist=taskService.taskAllList(pagevo);
		model.addAllAttributes(taskService.taskAllList(pagevo));
		model.addAttribute("prjctnm", "첫번째 프로젝트");
		model.addAttribute("tasklist",tasklist.get("taskAllList"));
	
		
		logger.debug("jsptasklist:{}",tasklist);
		
		return"pms_col/workhistory";
	}
	
	@RequestMapping("excelDownload")
	public String excelDownload(Model model,HttpSession session,
			@RequestParam(value="workradio")String workradio,
			@RequestParam(value="charr")List<String> charr,
			@RequestParam(value="charr2")List<String> charr2,
			@RequestParam(value="workradio1")String workradio1,
			@RequestParam(value="workradio2")String workradio2) {
		
		List<String> header = new ArrayList<>();
		
		String prjctno = (String)session.getAttribute("prjctno");
		UsersVo uservo =  (UsersVo)session.getAttribute("S_USER");
		header.add("프로젝트번호");
		header.add("업무번호");
		header.add("상태");
		header.add("우선순위");
		header.add("제목");
		header.add("내용");
		header.add("진척도");
		header.add("담당자");
		header.add("작성자");
		header.add("시작일");
		header.add("마감일");
		header.add("등록일");
		
		Map<String, Object>map= new HashMap<String ,Object>();
		map.put("usid", uservo.getUsid());
		map.put("prjctno", prjctno);
		map.put("workradio", workradio);
		map.put("sttus1", charr);
		map.put("workcheck1", charr2);
		map.put("workradio1", workradio1);
		map.put("workradio2", workradio2);
		logger.debug("확인확인:{}",map);
		
		model.addAttribute("header", header);
		model.addAttribute("data", taskService.selectExcel(map));
		
		logger.debug("태스크올:{}",taskService.selectExcel(map));
		return "userExcelDownloadView";
	}
	
	
	/**
	 * 컨트롤러 처리 프로세스 
	 *  1. 파라미터 조회/설정/검증/밸리데이션
	 *  2. 파라미터 구성 -> 서비스 사용
	 *  3. 클라이언트 자료 구성
	 *  4. 화면페이지설정
	 * 
	 * 
	 */
	@RequestMapping("TaskAllViewAccess")
	public String TaskAllViewAccess(@RequestParam(value="workradio")String workradio,
									@RequestParam(value="charr[]") List<String> charr,
									@RequestParam(value="charr2[]")List<String> charr2,
									@RequestParam(value="workradio1")String workradio1,
									@RequestParam(value="workradio2")String workradio2,
									Model model,
									TaskVo taskvo,
									@RequestParam(defaultValue="1") int page,
									@RequestParam(defaultValue="4") int pageSize,
									HttpSession session) {
		
		/** 1. 파라미터 조회/설정/검증 */ 
		/** 2. 파라미터 검증 */ 
		String prjctNo = (String)session.getAttribute("prjctno");
		UsersVo userVo =  (UsersVo)session.getAttribute("S_USER");
		if(userVo==null) {
			// return redirect:로그인페이지 ; // 로그인페이지로 이동
			// 오류페이지로 이동
		}
		
		/** 서비스로 보낼 파라미터 구성 */ 
		Map<String, Object>map= new HashMap<String, Object>();
		map.put("usid", userVo.getUsid());
		map.put("prjctno", prjctNo);
		map.put("workradio", workradio);
		map.put("sttus1", charr);
		map.put("workcheck1", charr2);
		map.put("workradio1", workradio1);
		map.put("workradio2", workradio2);
		
		PageVo pagevo = new PageVo();
		pagevo.setPage(page);
		pagevo.setPageSize(pageSize);
		
		logger.debug("sttus1 : {}", map.get("sttus1"));
		
		/** 서비스 사용 : 2개이상 사용가능 ??? - 
		 *  - 트랜잭션 단위를 2개 이상의 CUD 서비스로 쪼개는 경우 안됨 ( CUD 트랜잭션 단위는 하나의 서비스로 해야 함 ) 
		 *  - 트랜잭션 단위가 2개 이상의 경우에는 컨트롤러 단위에서 처리해야 한다. 
		 *    try{}catch{}finally{} 
		 */ 
		Map<String, Object> taskAllViewAccess = taskService.TaskAllViewAccess(map, pagevo);
		
		/** 클라이언트 자료 구성 */ 
		model.addAllAttributes(taskAllViewAccess);
		
		logger.debug("tasklist : {}", taskService.TaskAllViewAccess(map, pagevo).get("tasklist"));
		logger.debug("pagination : {}" , taskService.TaskAllViewAccess(map, pagevo).get("pagination"));
		
		/** 화면페이지설정 */ 
		return "jsonView";
	}
	
	@RequestMapping("TaskWorkDetail")
	public String TaskWorkDetail(String jobno, Model model) {
		/* task 디테일 정보 출력하기 */
		logger.debug("jobno : {}",jobno);
		TaskVo taskVo = taskService.selectTaskDetail(jobno);
		
		model.addAttribute("taskVo", taskVo);
		model.addAttribute("jobno", jobno);
		return"pms_col/TaskWorkDetail";
	}
	
//	@RequestMapping("TaskAllViewAccess1")
//	public String TaskAllViewAccess2(@RequestParam HashMap<String, Object> paramMap,
//									Model model,
//									TaskVo taskvo,
//									@RequestParam(defaultValue="1") int page,
//									@RequestParam(defaultValue="4") int pageSize,
//									HttpSession session) {
//		
//		/** 1. 파라미터 조회/설정/검증 */ 
//		/** 2. 파라미터 검증 */ 
//		String prjctNo = (String)session.getAttribute("prjctno");
//		UsersVo userVo =  (UsersVo)session.getAttribute("S_USER");
//		if(userVo==null) {
//			// return redirect:로그인페이지 ; // 로그인페이지로 이동
//			// 오류페이지로 이동
//		}
//		logger.debug("paramMap : {}", paramMap);
//		
//		/** 서비스로 보낼 파라미터 구성 */ 
//		Map<String, Object>map= new HashMap<String, Object>();
//		map.put("usid", userVo.getUsid());
//		map.put("prjctno", prjctNo);
//		map.put("workradio", paramMap.get("workradio"));
//		map.put("sttus1", paramMap.get("charr[]"));
//		map.put("workcheck1", paramMap.get("charr2[]"));
//		map.put("workradio1", paramMap.get("workradio1"));
//		map.put("workradio2", paramMap.get("workradio2"));
//		PageVo pagevo = new PageVo();
//		pagevo.setPage(page);
//		pagevo.setPageSize(pageSize);
//		
//		logger.debug("sttus1 : {}", map.get("sttus1"));
//		
//		/** 서비스 사용 : 2개이상 사용가능 ??? - 
//		 *  - 트랜잭션 단위를 2개 이상의 CUD 서비스로 쪼개는 경우 안됨 ( CUD 트랜잭션 단위는 하나의 서비스로 해야 함 ) 
//		 *  - 트랜잭션 단위가 2개 이상의 경우에는 컨트롤러 단위에서 처리해야 한다. 
//		 *    try{}catch{}finally{} 
//		 */ 
//		Map<String, Object> taskAllViewAccess = taskService.TaskAllViewAccess(map, pagevo);
//		
//		/** 클라이언트 자료 구성 */ 
//		model.addAllAttributes(taskAllViewAccess);
//		
//		logger.debug("tasklist : {}", taskService.TaskAllViewAccess(map, pagevo).get("tasklist"));
//		logger.debug("pagination : {}" , taskService.TaskAllViewAccess(map, pagevo).get("pagination"));
//		
//		/** 화면페이지설정 */ 
//		return "jsonView";
//	}

}
