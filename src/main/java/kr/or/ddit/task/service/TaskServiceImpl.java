package kr.or.ddit.task.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.stereotype.Service;

import kr.or.ddit.model.PageVo;
import kr.or.ddit.model.TaskVo;
import kr.or.ddit.task.repository.TaskDao;

@Service("taskService")
public class TaskServiceImpl implements TaskService{

	@Resource(name="taskDao")
	public TaskDao taskDao;
	
	@Override
	public Map<String, Object> taskAllList(PageVo pagevo) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("taskAllList", taskDao.taskAllList(pagevo));
		map.put("taskCnt", taskDao.taskCount(pagevo.getPrjctno()));
		map.put("pagination", (int)Math.ceil((double)taskDao.selectAlltask(pagevo.getPrjctno())/(int)pagevo.getPageSize()));
		
		return map;
	}

	@Override
	public Map<String, Object> TaskAllViewAccess(Map<String, Object> paramap, PageVo pagevo) {
		
		Map<String, Object> map = new HashedMap<>();
		
		map.put("pagination", (int)Math.ceil((double)taskDao.taskAllViewAccessCount(paramap)/(int)pagevo.getPageSize()));
		paramap.put("page", pagevo.getPage());
		paramap.put("pageSize", pagevo.getPageSize());
		
		map.put("tasklist", taskDao.TaskAllViewAccess(paramap));
		map.put("pageVo", pagevo);
		return map;
	}

	@Override
	public List<TaskVo> selectExcel(Map<String, Object> map) {
		return taskDao.selectExcel(map);
	}
	
	// task 디테일 정보 출력
	@Override
	public TaskVo selectTaskDetail(String jobno) {
		return taskDao.selectTaskDetail(jobno);
	}
	
}
