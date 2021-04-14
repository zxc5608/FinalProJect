package kr.or.ddit.vote.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.model.PageVo;
import kr.or.ddit.model.VoteVo;

@Repository("voteDao")
public class voteDaoImpl implements voteDao {
	@Resource(name = "sqlSessionTemplate")
	public SqlSessionTemplate template;

	@Override
	public int voteinsert(VoteVo votevo) {
		// TODO Auto-generated method stub
		return template.insert("vote.voteinsert", votevo);
	}

	@Override
	public int voteListinsert(VoteVo votevo) {
		// TODO Auto-generated method stub
		return template.insert("vote.voteListinsert",votevo);
	}

	@Override
	public List<VoteVo> voteview(PageVo pagevo) {
		// TODO Auto-generated method stub
		return template.selectList("vote.voteview",pagevo);
	}
	

	@Override
	public List<VoteVo> votecont(String voteno) {
		// TODO Auto-generated method stub
		return template.selectList("vote.votecont",voteno);
	}

	@Override
	public int votecheck(VoteVo votevo) {
		// TODO Auto-generated method stub
		return template.insert("vote.votecheck", votevo);
	}

	@Override
	public int novoteupdate(VoteVo votevo) {
		// TODO Auto-generated method stub
		return template.update("vote.novoteupdate", votevo);
	}

	@Override
	public List<VoteVo> votecontlist(String voteno) {
		// TODO Auto-generated method stub
		return template.selectList("vote.votecontlist",voteno);
	}

	@Override
	public String voteuser(VoteVo votevo) {
		// TODO Auto-generated method stub
		return template.selectOne("vote.voteuser",votevo);
	}

	@Override
	public String votewrt(VoteVo votevo) {
		// TODO Auto-generated method stub
		return template.selectOne("vote.votewrt",votevo);
	}

	@Override
	public int votecomplate(String prjctno) {
		// TODO Auto-generated method stub
		return template.delete("vote.votecomplate",prjctno);
	}

	@Override
	public String voteclostt(VoteVo votevo) {
		// TODO Auto-generated method stub
		return template.selectOne("vote.voteclostt",votevo);
	}



	@Override
	public int votepage() {
		// TODO Auto-generated method stub
		return template.selectOne("vote.votepage");
	}


	
	
}
