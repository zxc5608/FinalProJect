package kr.or.ddit.task.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.model.PageVo;
import kr.or.ddit.model.TaskVo;

public interface TaskService {
	// 처음 : 해당 프로젝트에 대한 모든 업무와 개수
	Map<String, Object> taskAllList(PageVo pagevo);

	Map<String, Object> TaskAllViewAccess(Map<String, Object> paramap, PageVo pagevo);
	
	//엑셀다운로드
	List<TaskVo> selectExcel(Map<String, Object> map);
	
	// task 디테일 정보 출력
	TaskVo selectTaskDetail(String jobno);
	
}
