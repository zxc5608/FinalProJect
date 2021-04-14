package kr.or.ddit.vote.repository;

import java.util.List;

import kr.or.ddit.model.PageVo;
import kr.or.ddit.model.VoteVo;

public interface voteDao {

	int voteinsert(VoteVo votevo);
	
	int voteListinsert(VoteVo votevo);
	

	
	List<VoteVo>votecont(String voteno);
	
	int votecheck(VoteVo votevo);
	
	int novoteupdate(VoteVo votevo);
	
	List<VoteVo>votecontlist(String voteno);
	
	String voteuser(VoteVo votevo);
	
	String votewrt(VoteVo votevo);
	
	int votecomplate(String prjctno);
	
	String voteclostt(VoteVo votevo);

	List<VoteVo> voteview(PageVo pagevo);
	
	int votepage();

}
