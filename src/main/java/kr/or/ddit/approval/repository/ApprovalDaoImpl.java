package kr.or.ddit.approval.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.model.ApprovalVo;
import kr.or.ddit.model.TaskVo;

@Repository("approvalDao")
public class ApprovalDaoImpl implements ApprovalDao{

	@Resource(name = "sqlSessionTemplate")
	public SqlSessionTemplate template;
	
	@Override
	public int insertapproval(ApprovalVo approvalvo) {
		return template.insert("approval.insertapproval", approvalvo);
	}
	
	@Override
	public int insertapproLine(String usid) {
		return template.insert("approval.insertapproLine", usid);
	}

	@Override
	public TaskVo selectTask(String jobno) {
		return template.selectOne("approval.selectTask", jobno);
	}

	@Override
	public List<ApprovalVo> approvalList() {
		return template.selectList("approval.approvalList");
	}

	@Override
	public ApprovalVo approveTask(String jobno) {
		return template.selectOne("approval.approveTask", jobno);
	}


}
