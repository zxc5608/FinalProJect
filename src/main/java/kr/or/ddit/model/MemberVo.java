package kr.or.ddit.model;

public class MemberVo {
	
	private String prjctno;  //프로젝트번호
	private String deletede; //삭제일
	private String aditde;   //추가일
	private int author;      //권한
	private String usernm;   //사용자이름
	private String usid;     //사용자아이디
	public String email;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDeletede() {
		return deletede;
	}
	public void setDeletede(String deletede) {
		this.deletede = deletede;
	}
	public String getAditde() {
		return aditde;
	}
	public void setAditde(String aditde) {
		this.aditde = aditde;
	}
	public int getAuthor() {
		return author;
	}
	public void setAuthor(int author) {
		this.author = author;
	}
	public String getUsernm() {
		return usernm;
	}
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	public String getUsid() {
		return usid;
	}
	public void setUsid(String usid) {
		this.usid = usid;
	}
	public String getPrjctno() {
		return prjctno;
	}
	public void setPrjctno(String prjctno) {
		this.prjctno = prjctno;
	}
	
	@Override
	public String toString() {
		return "MemberVo [prjctno=" + prjctno + ", deletede=" + deletede + ", aditde=" + aditde + ", author=" + author
				+ ", usernm=" + usernm + ", usid=" + usid + ", email=" + email + "]";
	}
}
