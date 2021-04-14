package kr.or.ddit.invite.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.model.MemberVo;
import kr.or.ddit.model.ProjectVo;

@Repository("inviteDao")
public class inviteDaoImpl implements inviteDao {

	@Resource(name="sqlSessionTemplate")
	public SqlSessionTemplate template;

	@Override
	public List<ProjectVo> invitelist(String prjctno) {
		// TODO Auto-generated method stub
		return template.selectList("invite.invitelist",prjctno);
	}

	@Override
	public int inviteinsert(MemberVo membervo) {
		// TODO Auto-generated method stub
		return template.insert("invite.inviteinsert",membervo);
	}

}
