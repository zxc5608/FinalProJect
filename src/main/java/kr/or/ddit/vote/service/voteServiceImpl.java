package kr.or.ddit.vote.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.model.PageVo;
import kr.or.ddit.model.VoteVo;
import kr.or.ddit.vote.repository.voteDao;

@Service("voteService")
public class voteServiceImpl implements voteService{
	@Resource(name = "voteDao")
	public voteDao votedao;

	@Override
	public int voteinsert(VoteVo votevo) {
		// TODO Auto-generated method stub
		return votedao.voteinsert(votevo);
	}

	@Override
	public int voteListinsert(VoteVo votevo) {
		// TODO Auto-generated method stub
		return votedao.voteListinsert(votevo);
	}

	@Override
	public List<VoteVo> voteview(PageVo pagevo) {
		// TODO Auto-generated method stub
		return votedao.voteview(pagevo);
	}

	@Override
	public List<VoteVo> votecont(String voteno) {
		// TODO Auto-generated method stub
		return votedao.votecont(voteno);
	}

	@Override
	public int votecheck(VoteVo votevo) {
		// TODO Auto-generated method stub
		return votedao.votecheck(votevo);
	}

	@Override
	public int novoteupdate(VoteVo votevo) {
		// TODO Auto-generated method stub
		return votedao.novoteupdate(votevo);
	}

	@Override
	public List<VoteVo> votecontlist(String voteno) {
		// TODO Auto-generated method stub
		return votedao.votecontlist(voteno);
	}

	@Override
	public String voteuser(VoteVo votevo) {
		// TODO Auto-generated method stub
		return votedao.voteuser(votevo);
	}

	@Override
	public String votewrt(VoteVo votevo) {
		// TODO Auto-generated method stub
		return votedao.votewrt(votevo);
	}

	@Override
	public int votecomplate(String prjctno) {
		// TODO Auto-generated method stub
		return votedao.votecomplate(prjctno);
	}

	@Override
	public String voteclostt(VoteVo votevo) {
		// TODO Auto-generated method stub
		return votedao.voteclostt(votevo);
	}

	@Override
	public int votepage() {
		// TODO Auto-generated method stub
		return votedao.votepage();
	}



}
