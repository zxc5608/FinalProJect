package kr.or.ddit.invite.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.invite.repository.inviteDao;
import kr.or.ddit.model.MemberVo;
import kr.or.ddit.model.ProjectVo;

@Service("inviteService")
public class inviteServiceImpl implements inviteService{
	
	@Resource(name="inviteDao")
	public inviteDao invitedao;

	@Override
	public List<ProjectVo> invitelist(String prjctno) {
		// TODO Auto-generated method stub
		return invitedao.invitelist(prjctno);
	}

	@Override
	public int inviteinsert(MemberVo membervo) {
		// TODO Auto-generated method stub
		return invitedao.inviteinsert(membervo);
	}


}
