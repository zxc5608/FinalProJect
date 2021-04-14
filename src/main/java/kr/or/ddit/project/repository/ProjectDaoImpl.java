package kr.or.ddit.project.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.model.DriveVo;
import kr.or.ddit.model.MemberVo;
import kr.or.ddit.model.ProjectVo;
import kr.or.ddit.model.TaskCalenVo;
import kr.or.ddit.model.TaskVo;

@Repository("projectDao")
public class ProjectDaoImpl implements ProjectDao{

	@Resource(name = "sqlSessionTemplate")
	public SqlSessionTemplate template;
	
	@Override
	public List<ProjectVo> selectAllpro(String usid) {
		return template.selectList("project.selectAllpro", usid);
	}

	@Override
	public int registproject(ProjectVo projectvo) {
		return template.insert("project.registproject",projectvo);
	}

	@Override
	public List<ProjectVo> selectcomplatepro(String usid) {
		return template.selectList("project.selectcomplatepro", usid);
	}

	@Override
	public int completepro(ProjectVo projectvo) {
		return template.update("project.completepro",projectvo);
	}

	@Override
	public int modifybtnpro(ProjectVo projectvo) {
		return template.update("project.modifybtnpro",projectvo);
	}

	@Override
	public int favoritepro(ProjectVo projectvo) {
		return template.update("project.favoritepro",projectvo);
	}
	@Override
	public int favorite(ProjectVo projectvo) {
		return template.update("project.favorite",projectvo);
	}

	@Override
	public int deleteproject(String prjctno) {
		return template.delete("project.deleteproject",prjctno);
	}

	@Override
	public List<ProjectVo> recyclebin(String usid) {
		return template.selectList("project.recyclebin", usid);
	}

	@Override
	public int deleterecycle(ProjectVo projectvo) {
		return template.update("project.deleterecycle",projectvo);
	}

	@Override
	public int restorepro(ProjectVo projectvo) {
		return template.update("project.restorepro",projectvo);
	}

	@Override
	public int insertmember(MemberVo membervo) {
		return template.insert("project.insertmember", membervo);
	}

	@Override
	public List<ProjectVo> invitelist2(String prjctno) {
		// TODO Auto-generated method stub
		return template.selectList("project.invitelist2",prjctno);
	}

	@Override
	public int selectproCnt(String prjctno) {
		return template.selectOne("project.selectproCnt", prjctno);
	}
	
	@Override
	public DriveVo selectfile(DriveVo driveVo) {
		return template.selectOne("project.selectfile",driveVo);
	}

	@Override
	public List<DriveVo> selectallfile(String prjctno) {
		return template.selectList("project.selectallfile",prjctno);
	}

	@Override
	public int upfile(DriveVo driveVo) {
		return template.insert("project.upfile",driveVo);
	}

	@Override
	public int defile(DriveVo driveVo) {
		return template.update("project.defile",driveVo);
	}

	@Override
	public int upfolder(DriveVo driveVo) {
		return template.insert("project.upfile",driveVo);
	}

	@Override
	public List<DriveVo> selectallfile(DriveVo drivevo) {
		return template.selectList("project.folderselectallfile",drivevo);
	}

	@Override
	public List<MemberVo> selectuser(MemberVo memvo) {
		return template.selectList("project.selectuser",memvo);
	}

	@Override
	public List<TaskVo> selectallproject(String prjctno) {
		return template.selectList("project.selectallproject",prjctno);
	}

	@Override
	public int inserttask(TaskVo taskvo) {
		return template.insert("project.inserttask",taskvo);
	}

	@Override
	public int deleteTask(String jobno) {
		return template.delete("project.deleteTask",jobno);
	}

//	일정 참석자 리스트
	@Override
	public List<MemberVo> attendkeydown(MemberVo memVo) {
		return template.selectList("project.attendkeydown", memVo);
	}

	@Override
	public List<TaskVo> tasklist(String prjctno) {
		return template.selectList("project.taslist",prjctno);
	}
	
	@Override
	public List<TaskCalenVo> selectAllCT(String prjctno) {
		return template.selectList("project.selectAllCT", prjctno);
	}

	@Override
	public int inserttask_user(String chargerid) {
		return template.insert("project.inserttask_user", chargerid);
	}

	@Override
	public Integer countprogress(String prjctno) {
		return template.selectOne("project.countprogress",prjctno);
	}

	@Override
	public Integer counthold(String prjctno) {
		return template.selectOne("project.counthold",prjctno);
	}

	@Override
	public Integer countrequest(String prjctno) {
		return template.selectOne("project.countrequest",prjctno);
	}

	@Override
	public Integer countcomplete(String prjctno) {
		return template.selectOne("project.countcomplete",prjctno);
	}

	@Override
	public TaskVo selectfiledown(String jobno) {
		return template.selectOne("project.selectfiledown", jobno);
	}
	
	
}
