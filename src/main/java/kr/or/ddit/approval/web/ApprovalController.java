package kr.or.ddit.approval.web;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.approval.service.ApprovalService;
import kr.or.ddit.model.ApprovalVo;
import kr.or.ddit.model.TaskVo;
import kr.or.ddit.user.model.UsersVo;

@Controller
@RequestMapping("approval")
public class ApprovalController {

	private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);

	@Resource(name = "approvalService")
	public ApprovalService approvalService;
	
	/**
	 * 업무 완료 보고서 쓰는 페이지 보여주기
	 */
	@RequestMapping(path="insertnote", method = RequestMethod.GET)
	public String textse(Model model, HttpSession session, String jobno) {
		// 업무 정보 가져오기
		TaskVo taskVo =  approvalService.selectTask("ST2104010");
		logger.debug("taskVO : {} ", taskVo);
		model.addAttribute("taskVo", taskVo);
		
		// 작성자 = 담당자
		UsersVo user = (UsersVo)session.getAttribute("S_USER");
		if(user == null) {
			return "pms_col/login";
		}
		String usid = user.getUsernm();

		// 관리자 = 결재 승인 하는 사람
	//	String manager = approvalService.selectManager()
		
		model.addAttribute("usernm", usid);
		
		return "approve/insertapproval";
	}
	
	/**
	 * 업무 완료 보고서 만들기 db에 insert
	 */
	@RequestMapping(path="insertnotes", method = RequestMethod.POST)
	public String insertNote(String tag, String tag2, 
			String jobno, String wrter, String docsj, Date taskclsde, MultipartFile atchmnfl, HttpSession session) {
		UsersVo user = (UsersVo)session.getAttribute("S_USER");
		String usid = user.getUsid();
		
		// 상세내용
		String doccn = tag + tag2;
		logger.debug("doccn : {}", doccn);
		
		ApprovalVo approvalVo = new ApprovalVo();
		approvalVo.setJobno(jobno);
		approvalVo.setWrter(wrter);
		approvalVo.setDocsj(docsj);
		approvalVo.setDoccn(doccn);
		approvalVo.setTaskclsde(taskclsde);
		
		int insertCnt = approvalService.insertapproval(approvalVo);
		insertCnt += approvalService.insertapproLine(usid);
		
		if(insertCnt == 2) {
			return "redirect:/task/task";
		}else {
			return "redirect:/project/projectMain";
		}
		
	}
	
	/**
	 * 업무 완료 보고서 보여주기
	 * - db의 approval 테이블과 task 테이블 조인 후 data 1개 조회
	 */
	@RequestMapping("approvalList")
	public String viewapproval(Model model) {
		model.addAttribute("approvalList", approvalService.approvalList());
		return "tiles.approve.approveList";
	}
	
	
}
