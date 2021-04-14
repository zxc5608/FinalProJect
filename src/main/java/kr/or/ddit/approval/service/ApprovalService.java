package kr.or.ddit.approval.service;

import java.util.List;

import kr.or.ddit.model.ApprovalVo;
import kr.or.ddit.model.TaskVo;

public interface ApprovalService {
	
	// 결제 문서 추가
	int insertapproval(ApprovalVo approvalvo);
	
	// 결제 선 추가
	int insertapproLine(String usid);

	// 업무정보 가져오기
	TaskVo selectTask(String jobno);
	
	//결재 목록 가져오기
	List<ApprovalVo> approvalList();
	
	//결재 목록 하나 가져오기
	ApprovalVo approveTask(String jobno);
}
