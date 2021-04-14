package kr.or.ddit.user.repository;

import java.util.List;

import kr.or.ddit.model.MemberVo;
import kr.or.ddit.user.model.UsersVo;

public interface UserDao {
	
	// userid에 해당하는 사용자 한명의 정보 조회
	UsersVo selectAllUser(String id);
	
	//회원 가입
	int insertUser(UsersVo userVo);
	
	//마이페이지에서 이름 수정
	int updateUsernm(UsersVo userVo);
	
	//마이페이지에서 번호 수정
	int updateUsertelno(UsersVo userVo);
	
	//마이페이지에서 프로필사진 수정
	int updateUserPhoto(UsersVo userVo);
	
	//마이페이지에서 프로필사진 삭제
	int removeUserPhoto(UsersVo userVo);
	
	//마이페이지에서 비밀번호 변경
	int changePass(UsersVo userVo);
	
	//아이디 찾기에서 이름하고 전화번호 비교
	UsersVo compareUser(String usernm);
	
	//전화번호로 사용자 아이디 찾기
	String findUserId(String telno);
	
	//이메일로 사용자 이메일 찾기
	String findEmail(String email);
	
	//이메일로 임시 비밀번호 발급 후 업데이트
	int tempPass(UsersVo userVo);
	
	//프로젝트에 속한 구성원 불러오기
	List<MemberVo> selectMemberPr(String prjctno);
	
	//프로젝트에 속한 구성원 프로필사진 불러오기
	List<UsersVo> selectProfile(String prjctno);
	
	//모달창 구성원 프로필 사진 및 이름 불러오기
	UsersVo selectPro(String usid);
	
}
