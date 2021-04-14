package kr.or.ddit.approval.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.approval.repository.ApprovalDao;
import kr.or.ddit.model.ApprovalVo;
import kr.or.ddit.model.TaskVo;

@Service("approvalService")
public class ApprovalServiceImpl implements ApprovalService{

	@Resource(name = "approvalDao")
	public ApprovalDao approvalDao;
	
	@Override
	public int insertapproval(ApprovalVo approvalvo) {
		return approvalDao.insertapproval(approvalvo);
	}
	
	@Override
	public int insertapproLine(String usid) {
		return approvalDao.insertapproLine(usid);
	}
	
	// 업무 정보 가져오기
	@Override
	public TaskVo selectTask(String jobno) {
		return approvalDao.selectTask(jobno);
	}

	@Override
	public List<ApprovalVo> approvalList() {
		return approvalDao.approvalList();
	}

	@Override
	public ApprovalVo approveTask(String jobno) {
		return approvalDao.approveTask(jobno);
	}


}
