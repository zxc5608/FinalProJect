package kr.or.ddit.invite.repository;

import java.util.List;

import kr.or.ddit.model.MemberVo;
import kr.or.ddit.model.ProjectVo;

public interface inviteDao {
	
	List<ProjectVo>invitelist(String prjctno);
	
	int inviteinsert(MemberVo membervo);

}
