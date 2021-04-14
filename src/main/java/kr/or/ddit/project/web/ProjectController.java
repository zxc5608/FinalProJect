package kr.or.ddit.project.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.thoughtworks.qdox.parser.ParseException;

import kr.or.ddit.model.DriveVo;
import kr.or.ddit.model.MemberVo;
import kr.or.ddit.model.ProjectVo;
import kr.or.ddit.model.TaskCalenVo;
import kr.or.ddit.model.TaskVo;
import kr.or.ddit.model.TaskphotoVo;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.task.service.TaskServiceImpl;
import kr.or.ddit.user.model.UsersVo;
import kr.or.ddit.util.FileUtil;

@RequestMapping("project")
@Controller
public class ProjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Resource(name = "projectService")
	public ProjectService projectService;
	
	@RequestMapping("projectpick")
	public String projectpick(Model model, HttpSession session) {
		UsersVo user = (UsersVo)session.getAttribute("S_USER");
		
		List<ProjectVo>proList= projectService.selectAllpro(user.getUsid());
		logger.debug("prolist : {}", proList);
		
		model.addAttribute("prolist",proList);
		return"pms_col/projectpick";
	}
	
	@RequestMapping("projectpick2")
	public String projectpick2(Model model, HttpSession session) {
		
		UsersVo user = (UsersVo)session.getAttribute("S_USER");
		
		String prjctno = (String)session.getAttribute("prjctno");
		String usernm = user.getUsernm();
		
		List<ProjectVo>invitelist2=projectService.invitelist2(prjctno);
		List<ProjectVo>proList= projectService.selectAllpro(user.getUsid());
		
		logger.debug("prolist : {}", proList);
		model.addAttribute("invitelist2",invitelist2);
		model.addAttribute("prolist",proList);
		return"pms_col/invitepick";
	}
	
	@RequestMapping("projectMain")
	public String projectMain(Model model,HttpSession session,String prjctno) {
		
		UsersVo user = (UsersVo) session.getAttribute("S_USER");
		
		Map<String, Integer> map= new HashMap<>();
		
		map=projectService.doughnutchart(prjctno);
		
		logger.debug("map:{}",map);
		
		
		//List<TaskVo> list = projectService.selectallproject(prjctno);
		List<TaskCalenVo> list = projectService.selectAllCT(prjctno);
		
		logger.debug("전체리스트:{}", list);
		session.setAttribute("prjctno", prjctno);
		

		model.addAllAttributes(map);
		model.addAttribute("user", user);
		model.addAttribute("tasklist", list);
		
		logger.debug("prjctno : {}",prjctno);
		
		return "tiles.pms_col.mainpage";
	}
	
	//프로젝트 생성 1일때 활성 2일때 비활성
	@RequestMapping("registproject")
	public String registproject(ProjectVo projectvo, HttpSession session) {
		
		UsersVo user = (UsersVo)session.getAttribute("S_USER"); 
		MemberVo membervo = new MemberVo();
		membervo.setUsid(user.getUsid());
		membervo.setUsernm(user.getUsernm());
		logger.debug("projectvo:{}",projectvo);
		
		int insertCnt = 0;
		int insertmemCnt = 0;
		try {
			insertCnt= projectService.registproject(projectvo);
			insertmemCnt = projectService.insertmember(membervo);
		} catch (Exception e) {
			insertCnt = 0;
			insertmemCnt = 0;
			e.printStackTrace();
		}
		logger.debug("insertmemCnt : {}", insertmemCnt);
		if (insertCnt == 1 && insertmemCnt == 1) {
			logger.debug("사용자 등록 성공 insertCnt 값:{}",insertCnt );
			return "redirect:/project/projectpick";
		}
		else {
			logger.debug("사용자 등록 실패 insertCnt 값:{}",insertCnt );
			
			return "redirect:/project/projectpick";
		}
	}
	
	@RequestMapping("complateproject")
	public String complateproject(Model model, HttpSession session) {
		UsersVo user = (UsersVo)session.getAttribute("S_USER");
		
		List<ProjectVo>proList= projectService.selectcomplatepro(user.getUsid());
		
		model.addAttribute("prolist1",proList);
		return"pms_col/complateproject";
	}
	
	@RequestMapping("recyclebin")
	public String recyclebin(Model model, HttpSession session) {
		UsersVo user = (UsersVo)session.getAttribute("S_USER");
		
		List<ProjectVo>proList = projectService.recyclebin(user.getUsid());
		
		model.addAttribute("prolist2",proList);
		return "pms_col/recyclebin";
	}
	
	@RequestMapping("deleterecycle")
	public String deleterecycle(ProjectVo projectvo) {
		int updateCnt=0;
		
		try {
			updateCnt = projectService.deleterecycle(projectvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		if (updateCnt== 1) {
			logger.debug("성공 updateCnt 값:{}",updateCnt);
			return "redirect:/project/projectpick";
		}
		else {
			logger.debug("실패 updateCnt 값:{}",updateCnt);
			
			return "redirect:/project/projectpick";
		}
	}
	
	@RequestMapping("completepro")
	public String completepro(ProjectVo projectvo) {
		int updateCnt=0;
		
		try {	
			updateCnt = projectService.completepro(projectvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (updateCnt== 1) {
			logger.debug("성공 updateCnt 값:{}",updateCnt);
			return "redirect:/project/projectpick";
		}
		else {
			logger.debug("실패 updateCnt 값:{}",updateCnt );
			
			return "redirect:/project/projectpick";
		}
	}
	
	@RequestMapping("modifybtnpro")
	public String modifybtnpro(ProjectVo projectvo) {
		int updateCnt=0;
		
		try {	
			updateCnt = projectService.modifybtnpro(projectvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (updateCnt== 1) {
			logger.debug("성공 updateCnt 값:{}",updateCnt);
			return "redirect:/project/complateproject";
		}
		else {
			logger.debug("실패 updateCnt 값:{}",updateCnt );
			
			return "redirect:/project/complateproject";	
		}
	}
	
	@RequestMapping("restorepro")
	public String restorepro(ProjectVo projectvo) {
		int updateCnt=0;
		
		try {	
			updateCnt = projectService.restorepro(projectvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (updateCnt== 1) {
			logger.debug("성공 updateCnt 값:{}",updateCnt);
			return "redirect:/project/recyclebin";
		}
		else {
			logger.debug("실패 updateCnt 값:{}",updateCnt );
			
			return "redirect:/project/recyclebin";	
		}
	}
	
	// 즐겨찾기 추가삭제 projectpick, complateproject.jsp
	// 0일때 즐겨찾기 비활성 1일때 즐겨찾기 활성 
	@RequestMapping("favoritepro")
	public String favoritepro(ProjectVo projectvo) {
		int updateCnt=0;
		
		try {	
			updateCnt = projectService.favoritepro(projectvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (updateCnt== 1) {
			logger.debug("성공 updateCnt 값:{}",updateCnt);
			return "redirect:/project/complateproject";
		}
		else {
			logger.debug("실패 updateCnt 값:{}",updateCnt );
			
			return "redirect:/project/complateproject";		
		}
	}
	
	@RequestMapping("favoritepro2")
	public String favoritepro2(ProjectVo projectvo) {
		int updateCnt=0;
		
		try {	
			updateCnt = projectService.favoritepro(projectvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (updateCnt== 1) {
			logger.debug("성공 updateCnt 값:{}",updateCnt);
			return "redirect:/project/projectpick";
		}
		else {
			logger.debug("실패 updateCnt 값:{}",updateCnt );
			
			return "redirect:/project/projectpick";		
		}
	}
	
	@RequestMapping("favorite")
	public String favorite(ProjectVo projectvo) {
		int updateCnt=0;
		
		try {	
			updateCnt = projectService.favorite(projectvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (updateCnt== 1) {
			logger.debug("성공 updateCnt 값:{}",updateCnt);
			return "redirect:/project/complateproject";
		}
		else {
			logger.debug("실패 updateCnt 값:{}",updateCnt );
			
			return "redirect:/project/complateproject";		
		}
	}
	
	@RequestMapping("favorite2")
	public String favorite2(ProjectVo projectvo) {
		int updateCnt=0;
		
		try {	
			updateCnt = projectService.favorite(projectvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (updateCnt== 1) {
			logger.debug("성공 updateCnt 값:{}",updateCnt);
			return "redirect:/project/projectpick";
		}
		else {
			logger.debug("실패 updateCnt 값:{}",updateCnt );
			
			return "redirect:/project/projectpick";		
		}
	}
	
	@RequestMapping("deleteproject")
	public String deleteproject(String prjctno,Model model) {
		model.addAttribute("prjctno",projectService.deleteproject(prjctno));
		return "redirect:/project/projectpick";
	}
	
	@RequestMapping("selectuser")
	public String selectuser(String value, Model model, HttpSession session) {
		String prjctno = (String)session.getAttribute("prjctno");

		MemberVo memvo = new MemberVo();

		memvo.setUsid(value);
		memvo.setPrjctno(prjctno);

		List<MemberVo> list = projectService.selectuser(memvo);

		logger.debug("유저리스트:{}", list);

		model.addAttribute("content", list);

		return "jsonView";
	}
	
	@RequestMapping("deletetask")
	public String deleteTask(String jobno) {

		projectService.deleteTask(jobno);

		return "redirect:/project/projectMain";
	}

//	일정 참석자 리스트
	@RequestMapping("attendkeydown")
	public String attendKD(String usernm, Model model, HttpSession session) {
		String prjctno = (String)session.getAttribute("prjctno");
		MemberVo memVo = new MemberVo();

		memVo.setPrjctno(prjctno);
		memVo.setUsernm(usernm);

		List<MemberVo> memvo = projectService.attendkeydown(memVo);

		model.addAttribute("memvo", memvo);
		logger.debug("memvo:{}", memvo);

		return "jsonView";
	}
	
	
//	업무 등록
	@RequestMapping(path = "inserttask", method = { RequestMethod.POST })
	public String inserttask(TaskVo taskvo, HttpSession session, String chargerid, MultipartFile file) throws ParseException {
		
		String prjctno = (String)session.getAttribute("prjctno");
		UsersVo user = (UsersVo) session.getAttribute("S_USER");
			
		String writer = user.getUsernm();
		
		taskvo.setPrjctno(prjctno);
		taskvo.setJobwrter(writer);
		taskvo.setTwriterid(user.getUsid());
		
		
		logger.debug("file:{}",file);
		String filename = "";
		String realfilename = "";
		if (file.getSize() > 0) {
			filename = file.getOriginalFilename();
			taskvo.setFilename(filename);
			String fileExtension = FileUtil.getFileExtension(filename);
			// brown /brown.png
			
			realfilename = fileExtension + "." + UUID.randomUUID().toString() + "." + fileExtension;
			taskvo.setRealfilename(realfilename);
				try {
				

					file.transferTo(new File("d:\\upload\\" + realfilename));
				
				} catch (IOException e) {
				e.printStackTrace();
				}
				
			}
		
		logger.debug("TaskVo : {}", taskvo);
		int cnt = 0;
		int cntTaskUser = 0;
		
		try {
			cnt = projectService.inserttask(taskvo);
			logger.debug("업무 번호 : {}",taskvo.getJobno());
			
			cntTaskUser = projectService.inserttask_user(chargerid);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return "redirect:/project/projectMain";
	}
	
	@RequestMapping(path="fileDownLoad", method= {RequestMethod.POST})
	public void fileDown(String downfb, HttpServletRequest req, HttpServletResponse resp) {
		TaskVo taskvo = new TaskVo();

		taskvo = projectService.selectfiledown(downfb);
		
		logger.debug("파일 다운로드 : {}", taskvo);
		resp.setHeader("Content-Disposition", "attachment; filename="+taskvo.getFilename());
		
		resp.setContentType("image");
		String path ="";
		
		if(taskvo.getFilename() == null) {
			path = req.getServletContext().getRealPath("/img/unknown.jpg");
		}else if(taskvo.getFilename() != null) {
			path = "d:\\upload\\"+taskvo.getFilename();
		}
		
		try {
			FileInputStream fis = new FileInputStream(path);
			ServletOutputStream sos = resp.getOutputStream();
			
			byte[] buf = new byte[512];
			while(fis.read(buf) != -1) {
				sos.write(buf);
			}
			
			fis.close();
			sos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//연승이꺼
	@RequestMapping("taskfileupload")
	public String taskfileupload(String prjctno, DriveVo driveVo, HttpServletRequest req, HttpServletResponse resp,
			MultipartFile profile) {
		prjctno = "PJ2103006";

		String filename = "";
		String realfilename = "";
		if (profile.getSize() > 0) {
			filename = profile.getOriginalFilename();
			String fileExtension = FileUtil.getFileExtension(filename);
			// brown /brown.png
			realfilename = fileExtension + "." + UUID.randomUUID().toString() + "." + fileExtension;
			try {
				if (driveVo.getFlpth() != null) {
					profile.transferTo(new File("d:\\upload\\fileuploadfolder"  +
				"\\" + realfilename));
				} else {
					profile.transferTo(new File("d:\\upload\\" + realfilename));
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
				
		return "redirect:/project/projectMain";

	}
	
	@RequestMapping("tasklist")
	public String tasklist(HttpSession session, Model model, TaskphotoVo taskvo) {
		
		String prjctno = (String)session.getAttribute("prjctno");  
		UsersVo uservo =  (UsersVo)session.getAttribute("S_USER");
		model.addAttribute("tasklist",projectService.tasklist(prjctno));
		
		return "pms_col/mainpage";
	}
	
}
