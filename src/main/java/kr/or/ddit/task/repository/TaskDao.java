package kr.or.ddit.task.repository;

import java.util.List;
import java.util.Map;

import kr.or.ddit.model.PageVo;
import kr.or.ddit.model.TaskVo;

public interface TaskDao {
	
	//모든 업무 데이터 가져오기
	List<TaskVo>taskAllList(PageVo pagevo);
	
	//해당 프로젝트에 대한 업무 개수(알림)
	int taskCount(String prjctno);
	
	int selectAlltask(String prjctno);
	
	//모든업무 정렬기능
	List<TaskVo>TaskAllViewAccess(Map<String, Object>map);
	
	//정렬기능의 count
	int taskAllViewAccessCount(Map<String, Object>map);
	
	//엑셀다운로드
	List<TaskVo> selectExcel(Map<String, Object> map);
	
	// task 디테일 정보 출력
	TaskVo selectTaskDetail(String jobno);
	
}
