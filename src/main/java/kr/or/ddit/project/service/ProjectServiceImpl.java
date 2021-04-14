package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.stereotype.Service;

import kr.or.ddit.model.DriveVo;
import kr.or.ddit.model.MemberVo;
import kr.or.ddit.model.ProjectVo;
import kr.or.ddit.model.TaskCalenVo;
import kr.or.ddit.model.TaskVo;
import kr.or.ddit.project.repository.ProjectDao;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService{

	@Resource(name = "projectDao")
	public ProjectDao projectDao;
	
	@Override
	public List<ProjectVo> selectAllpro(String usid) {
		return projectDao.selectAllpro(usid);
	}

	@Override
	public int registproject(ProjectVo projectvo) {
		return projectDao.registproject(projectvo);
	}

	@Override
	public List<ProjectVo> selectcomplatepro(String usid) {
		return projectDao.selectcomplatepro(usid);
	}

	@Override
	public int completepro(ProjectVo projectvo) {
		return projectDao.completepro(projectvo);
	}

	@Override
	public int modifybtnpro(ProjectVo projectvo) {
		return projectDao.modifybtnpro(projectvo);
	}

	@Override
	public int favoritepro(ProjectVo projectvo) {
		return projectDao.favoritepro(projectvo);
	}

	@Override
	public int favorite(ProjectVo projectvo) {
		return projectDao.favorite(projectvo);
	}

	@Override
	public int deleteproject(String prjctno) {
		return projectDao.deleteproject(prjctno);
	}

	@Override
	public List<ProjectVo> recyclebin(String usid) {
		return projectDao.recyclebin(usid);
	}

	@Override
	public int deleterecycle(ProjectVo projectvo) {
		return projectDao.deleterecycle(projectvo);
	}

	@Override
	public int restorepro(ProjectVo projectvo) {
		return projectDao.restorepro(projectvo);
	}

	@Override
	public int insertmember(MemberVo membervo) {
		return projectDao.insertmember(membervo);
	}

	@Override
	public List<ProjectVo> invitelist2(String prjctno) {
		return projectDao.invitelist2(prjctno);
	}

	@Override
	public int selectproCnt(String prjctno) {
		return projectDao.selectproCnt(prjctno);
	}
	
	@Override
	public DriveVo selectfile(DriveVo driveVo) {
		// TODO Auto-generated method stub
		return projectDao.selectfile(driveVo);
	}


	@Override
	public List<DriveVo> selectallfile(String prjctno) {
		return projectDao.selectallfile(prjctno);
	}


	@Override
	public int upfile(DriveVo driveVo) {
		return projectDao.upfile(driveVo);
	}


	@Override
	public int defile(DriveVo driveVo) {
		return projectDao.defile(driveVo);
	}


	@Override
	public int upfolder(DriveVo driveVo) {
		return projectDao.upfolder(driveVo);
	}


	@Override
	public List<DriveVo> selectallfile(DriveVo drivevo) {
		return projectDao.selectallfile(drivevo);
	}


	@Override
	public List<MemberVo> selectuser(MemberVo memvo) {
		return projectDao.selectuser(memvo);
	}


	@Override
	public List<TaskVo> selectallproject(String prjctno) {
		return projectDao.selectallproject(prjctno);
	}


	@Override
	public int inserttask(TaskVo taskvo) {
		return projectDao.inserttask(taskvo);
	}


	@Override
	public int deleteTask(String jobno) {
		return projectDao.deleteTask(jobno);
	}

//	일정 참석자 리스트
	@Override
	public List<MemberVo> attendkeydown(MemberVo memVo) {
		return projectDao.attendkeydown(memVo);
	}

	@Override
	public List<TaskVo> tasklist(String prjctno) {
		return projectDao.tasklist(prjctno);
	}
	
	@Override
	public List<TaskCalenVo> selectAllCT(String prjctno) {
		return projectDao.selectAllCT(prjctno);
	}


	@Override
	public int inserttask_user(String chargerid) {
		return projectDao.inserttask_user(chargerid);
	}


	@Override
	public Map<String, Integer> doughnutchart(String prjctno) {
		@SuppressWarnings("unchecked")
		Map<String, Integer> map = new HashedMap();
		
		map.put("countprogress", projectDao.countprogress(prjctno));
		map.put("counthold", projectDao.counthold(prjctno));
		map.put("countrequest", projectDao.countrequest(prjctno));
		map.put("countcomplete", projectDao.countcomplete(prjctno));
		
		return map;
	}


	@Override
	public TaskVo selectfiledown(String jobno) {
		return projectDao.selectfiledown(jobno);
	}
}
