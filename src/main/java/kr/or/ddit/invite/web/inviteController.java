package kr.or.ddit.invite.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.invite.service.inviteService;
import kr.or.ddit.model.MemberVo;
import kr.or.ddit.model.ProjectVo;
import kr.or.ddit.user.model.UsersVo;

@Controller
@RequestMapping("invite")
public class inviteController {
	private static final Logger logger = LoggerFactory.getLogger(inviteController.class);
	@Resource(name="inviteService")
	public inviteService inviteservice;

	@RequestMapping("invite")
	public String invite(Model model, HttpSession session,String prjctno) {
		 
		session.setAttribute("prjctno", prjctno);
		
		
		List<ProjectVo>invitelist=inviteservice.invitelist(prjctno);
		
		logger.debug("invite:{}",prjctno );
		logger.debug("invite:{}",invitelist);
		
		model.addAttribute("invitelist", invitelist);
		return "pms_col/invite";
	}
	@RequestMapping("inviteinsert")
	public String inviteinsert(HttpSession session,MemberVo membervo) {
		
		String prjctno=(String) session.getAttribute("prjctno");
		UsersVo user = (UsersVo)session.getAttribute("S_USER");
		
		String usid = user.getUsid();
		String usernm = user.getUsernm();
		
		membervo.setPrjctno(prjctno);
		membervo.setUsid(usid);
		membervo.setUsernm(usernm);
		
		logger.debug("prjctno:{}",prjctno);
		logger.debug("userid:{}",usid);
		logger.debug("usernm:{}",usernm);
		
		int insertCnt=0;
		try {
			insertCnt=inviteservice.inviteinsert(membervo);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		if (insertCnt == 1) {
			logger.debug("사용자 등록 성공 insertCnt 값:{}",insertCnt );
			return"redirect:/project/projectMain?prjctno="+prjctno;
		}
		else {
			logger.debug("사용자 등록 실패 insertCnt 값:{}",insertCnt );
			
			return "redirect:/project/projectpick";

		}
		
		
		
	}
}
