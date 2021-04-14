package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.model.DriveVo;
import kr.or.ddit.model.MemberVo;
import kr.or.ddit.model.ProjectVo;
import kr.or.ddit.model.TaskCalenVo;
import kr.or.ddit.model.TaskVo;

public interface ProjectService {

	// 프로젝트select
	List<ProjectVo> selectAllpro(String usid);

	// 완료된 프로젝트
	List<ProjectVo> selectcomplatepro(String usid);

	List<ProjectVo>invitelist2(String prjctno);
	
	//프로젝트 참여자 명수
	int selectproCnt(String prjctno);
	
	// 프로젝트 등록
	int registproject(ProjectVo projectvo);

	// 프로젝트 등록시 등록자 member에 넣기
	int insertmember(MemberVo membervo);

	// 수정>> 완료 프로젝트 이동
	int completepro(ProjectVo projectvo);

	// 완료>>수정 프로젝트 이동
	int modifybtnpro(ProjectVo projectvo);

	// 즐겨찾기 버튼 수정 0 ==> 1
	int favoritepro(ProjectVo projectvo);

	// 즐겨찾기 버튼 수정 1 ==> 0
	int favorite(ProjectVo projectvo);

	// 프로젝트 삭제
	int deleteproject(String prjctno);

	// 휴지통 리스트
	List<ProjectVo> recyclebin(String usid);

	// 수정>> 휴지통
	int deleterecycle(ProjectVo projectvo);

	// 휴지통 > 수정
	int restorepro(ProjectVo projectvo);
	
	
	
	DriveVo selectfile(DriveVo driveVo);

	List<DriveVo> selectallfile(String prjctno);

	int upfile(DriveVo driveVo);

	int defile(DriveVo driveVo);

	int upfolder(DriveVo driveVo);

	List<DriveVo> selectallfile(DriveVo drivevo);

	List<MemberVo> selectuser(MemberVo memvo);


	List<TaskVo> selectallproject(String prjctno);

	int inserttask(TaskVo taskvo);

	int deleteTask(String jobno);


	
//	일정 참석자 리스트
	List<MemberVo> attendkeydown(MemberVo memVo);

	List<TaskVo> tasklist(String prjctno);
	
	//전체 업무 및 일정 리스트 출력
	List<TaskCalenVo> selectAllCT(String prjctno);
	
	//업무 참석자 insert
	int inserttask_user(String chargerid);
	
	//도넛차트
	Map<String, Integer> doughnutchart(String prjctno);
	
//	첨부파일 다운
	TaskVo selectfiledown(String jobno);
}
