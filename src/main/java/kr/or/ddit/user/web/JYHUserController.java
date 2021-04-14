
package kr.or.ddit.user.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.user.model.UsersVo;
import kr.or.ddit.user.service.UserService;

@Controller
@RequestMapping("juser")
public class JYHUserController {
	private static final Logger logger = LoggerFactory.getLogger(JYHUserController.class);
	
	@Resource(name = "userService")
	public UserService userService;

//메인화면
	@RequestMapping("jmain")
	public String main() {
		return "pms_col/JYHmain";
	}

// 로그인 화면
	@RequestMapping("jlogin")
	public String loginView() {
		return "pms_col/JYHlogin";
	}
	
//로그인 다음 화면	
	@RequestMapping(path="jlogining", method= {RequestMethod.POST})
	public String loginNext(UsersVo usersVo, HttpSession session) {
		
		UsersVo vo = userService.selectAllUser(usersVo.getUsid());
		logger.debug("voaaaaaa :{}" ,vo);
		if(vo != null && usersVo.getPassword().equals(vo.getPassword())) {
			session.setAttribute("S_USER", vo);
			return "pms_col/JYHindex";			
		}else {
			logger.debug("로그인 실패");
			return "pms_col/JYHmain";
		}	
	}
	
//	마이페이지
	@RequestMapping(path="jmypage", method= {RequestMethod.POST})
	public String mypageView(Model model, HttpSession session) {
		session.getAttribute("S_USER");
		return "";
	}
	
// 회원 가입 화면 뷰	
	@RequestMapping(path="jjoinView")
	public String JoinView() {
		return "pms_col/JYHjoin";
	}
	
//회원가입 폼 전송 받는 곳
	@RequestMapping(path="jjoin", method= {RequestMethod.POST})
	public String Join(UsersVo userVo, String p_no1, String p_no2, String p_no3, String brthday) {
			
			userVo.setTelno(p_no1+"-"+p_no2+"-"+p_no3);
		
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date bir;
			try {
				bir = transFormat.parse(brthday);
				userVo.setBrthdy(bir);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
					
			logger.debug("userVo : {}", userVo);
			int cnt = 0;
			
			try{
				cnt = userService.insertUser(userVo);
			}catch(Exception e) {
				e.printStackTrace();
				cnt=0;
			}
			
			if(cnt == 1) {
				return "redirect:/juser/jmypage";
			}else {
				
				return "pms_col/JYHjoin";
			}
			
	}
//	, method= {RequestMethod.POST}
	@RequestMapping(path="jmypage")
	public String Mypage(HttpSession session) {
//		UsersVo userVo = (UsersVo) session.getAttribute("S_USER");
		
		return "pms_col/JYHgrid";
	}
	
	//아이디 중복확인
	@RequestMapping(path="idcheck", method = {RequestMethod.POST})
	public void IdCheck(String usid, Model model) {
		UsersVo userVo = userService.selectAllUser(usid);
		
		String userid = userVo.getUsid();
		
		model.addAttribute("userid", userid);
			
		String sw ="";
		if(userid != null) {
			 sw = "이미 사용중인 아이디 입니다";
		}else {
			sw = "사용 가능한 아이디입니다";
		}
		
		model.addAttribute("sw", sw);
		
//		return "pms_col/idCheck";
	}
	
	
	
}


