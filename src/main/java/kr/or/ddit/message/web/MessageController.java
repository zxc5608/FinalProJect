
package kr.or.ddit.message.web;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.message.service.MessageService;
import kr.or.ddit.model.MessageVo;
import kr.or.ddit.model.PageVo;
import kr.or.ddit.user.model.UsersVo;

@Controller
@RequestMapping("msg") 
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Resource(name="messageService") 
	public MessageService messageService;

	@RequestMapping("msgsend")
	public String msgsend(MessageVo msgvo, HttpServletRequest request, HttpSession session) {
		UsersVo user = (UsersVo)session.getAttribute("S_USER");
		String usid = user.getUsid();
		
		msgvo.setUsid(usid);
		
		String reusid= request.getParameter("re_usid");
		String[]array =reusid.split(",");
		
		
		int insertCnt = 0;
		int insertCnt1 = 0;
		
		for(int i=0; i<array.length; i++) {
			
		String mssagesj = request.getParameter("mssagesj"); // 제목
		String mssagecn = request.getParameter("mssagecn"); // 내용

		msgvo.setRe_usid(array[i]);
		
		logger.debug("array:{}",array[i]);		
		logger.debug("reusid:{}",reusid);
		logger.debug("mssagesj:{}",mssagesj);
		logger.debug("mssagecn:{}",mssagecn);
		logger.debug("array.length:{}",array.length);
		
	
		
		try {
			
			insertCnt= messageService.msgsend(msgvo);
			
			} catch (Exception e) {
					e.printStackTrace();
			}
		
		try {
			insertCnt1 = messageService.msgsend2(msgvo);
			} catch(Exception e) {
			e.printStackTrace();
			}
		
		}  //for문 끝
	
		if (insertCnt == array.length) {
			logger.debug("사용자 등록 성공 insertCnt 값:{}",insertCnt );
		
			return "redirect:/msg/count";
		}	
		else {
			logger.debug("사용자 등록 실패 insertCnt 값:{}",insertCnt );
		}
			return "redirect:/msg/count";
	}
	
	@RequestMapping("replysend")
	public String replysend(MessageVo msgvo, HttpSession session) {
		UsersVo user = (UsersVo)session.getAttribute("S_USER");
		String usid = user.getUsid();
		
		msgvo.setUsid(usid);
		
		
		logger.debug("msgvo:{}",msgvo);
		int insertCnt = 0;
		int insertCnt1 = 0;
		
		try {
			insertCnt= messageService.replysend(msgvo);
			insertCnt1 = messageService.replysend2(msgvo);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		if (insertCnt == 1) {
			logger.debug("사용자 등록 성공 insertCnt 값:{}",insertCnt );
		
			return "redirect:/msg/msgAllList";
		}	
		else {
			logger.debug("사용자 등록 실패 insertCnt 값:{}",insertCnt );
		}
		
		return "redirect:/msg/msgAllList";
	}
	
	@RequestMapping("count")
	public String count(Model model, HttpSession session) {
		UsersVo user = (UsersVo)session.getAttribute("S_USER");
		String usid = user.getUsid();
		
		String re_usid = usid;
		int cntcn = messageService.count(re_usid);
		
		model.addAttribute("cntcn",cntcn);
		
		return"jsonView";
	}
	
	@RequestMapping("msgAllList")
	public String msgAllList(Model model,PageVo pagevo,
			@RequestParam(defaultValue = "1") int page, 
			@RequestParam(defaultValue = "5") int pageSize, HttpSession session) {
		
		UsersVo user = (UsersVo)session.getAttribute("S_USER");
		String usid = user.getUsid();
		
		String re_usid =usid;
		pagevo.setRe_usid(re_usid);
		pagevo.setPage(page);
		pagevo.setPageSize(pageSize);
		
		
		List<MessageVo>msgList=messageService.msgAllList(pagevo);
		
		List<MessageVo>msgList2=messageService.msgAllListread(pagevo);

		model.addAttribute("msgList",msgList);
		model.addAttribute("msgList2",msgList2);
		model.addAttribute("pageVo",pagevo);
		model.addAttribute("pagination",(int)Math.ceil((double)messageService.selectAllMsgCnt2(re_usid)/(int)pageSize));
		logger.debug("dasd{}",msgList);
		return"pms_col/msgbox";
	}
	
	@RequestMapping("msgSentList")
	public String msgSentList(Model model ,PageVo pagevo,
			@RequestParam(defaultValue = "1") int page, 
			@RequestParam(defaultValue = "5") int pageSize, HttpSession session) {
		
		UsersVo user = (UsersVo)session.getAttribute("S_USER");
		String usid = user.getUsid();
		
		pagevo.setPageSize(pageSize);
		pagevo.setPage(page);
		pagevo.setUsid(usid);
		
		List<MessageVo>msgSentList=messageService.msgSentList(pagevo);
		model.addAttribute("msgSentList", msgSentList);
		model.addAttribute("pageVo",pagevo);
		model.addAttribute("pagination",(int)Math.ceil((double)messageService.selectAllMsgCnt(usid)/(int)pageSize));
		
		return "pms_col/msgboxsent";
	}
	
	@RequestMapping("msgDetail")
	public String msgDetail(String mssageno,String re_usid ,MessageVo msgvo, Model model) {
		
		msgvo.setMssageno(mssageno);
		msgvo.setRe_usid(re_usid);
		
		MessageVo messagevo = messageService.msgDetail(msgvo);
		
		logger.debug("vovovovovvo: {}",messagevo);
		model.addAttribute("msgvo", messagevo);
		
		return"jsonView";
	}
	
	@RequestMapping("DeState")
	public String DeState(String mssageno, Model model) {

		int updateCnt = 0;
		
		try {
			updateCnt= messageService.DeState(mssageno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return"jsonView";
	}
	
	@RequestMapping(path="msgkeydown")
	public String msgkeydown(Locale locale, Model model, String value) {
		
		List<UsersVo>keyList =messageService.msgkeydown(value);
		
		model.addAttribute("content", keyList);
				
		return "jsonView";
	}
	
}

