package kr.or.ddit.vote.web;



import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.model.PageVo;
import kr.or.ddit.model.VoteVo;
import kr.or.ddit.user.model.UsersVo;
import kr.or.ddit.vote.service.voteService;

@Controller
@RequestMapping("vote")
public class voteController {

	private static final Logger logger = LoggerFactory.getLogger(voteController.class);
	
	@Resource(name="voteService")
	public voteService voteservice;
	
	@RequestMapping("votemake")
	public String votemake(Model model,HttpSession session,PageVo pagevo,
			@RequestParam(defaultValue = "1") int page, 
			@RequestParam(defaultValue = "5") int pageSize) {
		
	
		
		String prjctno = (String) session.getAttribute("prjctno");
		pagevo.setPrjctno(prjctno);
		pagevo.setPage(page);
		pagevo.setPageSize(pageSize);
		
		List<VoteVo>votelist=voteservice.voteview(pagevo);
		
		model.addAttribute("votelist", votelist);
		model.addAttribute("pagination",voteservice.votepage()/pageSize+1);
		return "pms_col/votemake";
	}
	@RequestMapping("voteDetail")
	public String voteDetail(String voteno
							,String prjctno
							,String votethema
							,String voteendde
							
							,Model model
							,HttpSession session) {
		
		
		logger.debug("voteno:{}",voteno);
		UsersVo user = (UsersVo)session.getAttribute("S_USER");
		
		
		
		List<VoteVo>voteDelist=voteservice.votecont(voteno);
		VoteVo votevo= new VoteVo();
		votevo.setUsid(user.getUsid());
		votevo.setVoteno(voteno);
		votevo.setPrjctno(prjctno);
		
		String voteuser = voteservice.voteuser(votevo);
		
		String votewrt= voteservice.votewrt(votevo);
		String voteclostt=voteservice.voteclostt(votevo);
		
		logger.debug("voteDelist : {}",voteDelist);
		logger.debug("votewrt : {}",votewrt);
		logger.debug("usid2 : {}",user.getUsid());
		logger.debug("voteclostt : {}",voteclostt);
		
		
		
		model.addAttribute("voteDelist",voteDelist);
		model.addAttribute("voteuser",voteuser);
		model.addAttribute("votewrt",votewrt);
		model.addAttribute("usid2",user.getUsid());
		model.addAttribute("voteclostt", voteclostt);
		
		return"pms_col/voteDetail";
	}
	
	@RequestMapping("voteinsert")
	public String voteinsert(
							String[] votelist,
							VoteVo votevo,HttpSession session) {
		
		UsersVo user = (UsersVo) session.getAttribute("S_USER");
		String votewrt = user.getUsid();
		logger.debug("votelist 값:{}",votelist);
		logger.debug("votevo 값:{}",votevo);
		
		
		votevo.setPrjctno((String)session.getAttribute("prjctno"));
		votevo.setVotewrt(votewrt);
		int insertCnt = 0;
		int insertCnt1 = 0;
		
		try {
			insertCnt= voteservice.voteinsert(votevo);
			
			for(int i=0; i<votelist.length;i++) {
				  votevo.setVotelist(votelist[i]);
				  votevo.setVotelistno(i+1);
				  insertCnt1=voteservice.voteListinsert(votevo);
			  }
			  
			  logger.debug("insertCnt1:{}", insertCnt1);

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		if (insertCnt == 1) {
			logger.debug("사용자 등록 성공 insertCnt 값:{}",insertCnt );
		
			return "redirect:/vote/votemake";
		}	
		else {
			logger.debug("사용자 등록 실패 insertCnt 값:{}",insertCnt );
			
		
	}
		return "pms_col/votemake";

	}
	@RequestMapping("voteresult")
	public String voteresult(String voteno,Model model) {
		List<VoteVo>voteDelist=voteservice.votecont(voteno);
		List<VoteVo>votecontlist= voteservice.votecontlist(voteno);
		
		
		
		model.addAttribute("voteDelist",voteDelist);
		model.addAttribute("votecontlist",votecontlist);
		
		return"jsonView";
	}
	@RequestMapping("votecomplate")
	public String votecomplate(String voteno) {
		
		int updateCnt=0;
		try {
			updateCnt= voteservice.votecomplate(voteno);

		} catch (Exception e) {
			e.printStackTrace();
		}
		if (updateCnt == 1) {
			logger.debug("사용자 등록 성공 updateCnt 값:{}",updateCnt );
			}	
		else {
			logger.debug("사용자 등록 실패 updateCnt 값:{}",updateCnt );
		}
		return"jsonView";
	}
	@RequestMapping("votecheck")
	public String votecheck(String voteno,String votelistno,
			@RequestParam(value="voteone")String voteone
							,VoteVo votevo,Model model,HttpSession session) {
		
	
		UsersVo user = (UsersVo)session.getAttribute("S_USER");
		votevo.setUsid(user.getUsid()); 
		
		logger.debug("votevo:{}",votevo);
		
		int updateCnt=0;
		try {
			updateCnt= voteservice.novoteupdate(votevo);

		} catch (Exception e) {
			e.printStackTrace();
		}
		if (updateCnt == 1) {
			logger.debug("사용자 등록 성공 updateCnt 값:{}",updateCnt );
			}	
		else {
			logger.debug("사용자 등록 실패 updateCnt 값:{}",updateCnt );
		}

		
		int insertCnt = 0;
		try {
			insertCnt= voteservice.votecheck(votevo);

		} catch (Exception e) {
			e.printStackTrace();
		}
		if (insertCnt == 1) {
			logger.debug("사용자 등록 성공 insertCnt 값:{}",insertCnt );
			}	
		else {
			logger.debug("사용자 등록 실패 insertCnt 값:{}",insertCnt );
		}
		List<VoteVo>voteDelist=voteservice.votecont(voteno);
		List<VoteVo>votecontlist= voteservice.votecontlist(voteno);
		
				
		model.addAttribute("voteDelist",voteDelist);
		model.addAttribute("votecontlist",votecontlist);
		model.addAttribute("usid",user.getUsid());
		
		return"jsonView";
	}
}
