package kr.or.ddit.invite.service;

import java.util.List;

import kr.or.ddit.model.MemberVo;
import kr.or.ddit.model.ProjectVo;


public interface inviteService {
	List<ProjectVo>invitelist(String prjctno);
	
	
	int inviteinsert(MemberVo membervo);
}
