package kr.or.ddit.model;

import java.util.Date;

public class UsersVo {

	private String usid;
	private String usernm;
	private String password;
	private Date brthdy;
	private String telno;
	private String email;
	private String proflphoto;
	private String cmpnynm;
	public String getUsid() {
		return usid;
	}
	public void setUsid(String usid) {
		this.usid = usid;
	}
	public String getUsernm() {
		return usernm;
	}
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getBrthdy() {
		return brthdy;
	}
	public void setBrthdy(Date brthdy) {
		this.brthdy = brthdy;
	}
	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProflphoto() {
		return proflphoto;
	}
	public void setProflphoto(String proflphoto) {
		this.proflphoto = proflphoto;
	}
	public String getCmpnynm() {
		return cmpnynm;
	}
	public void setCmpnynm(String cmpnynm) {
		this.cmpnynm = cmpnynm;
	}
	@Override
	public String toString() {
		return "UsersVo [usid=" + usid + ", usernm=" + usernm + ", password=" + password + ", brthdy=" + brthdy
				+ ", telno=" + telno + ", email=" + email + ", proflphoto=" + proflphoto + ", cmpnynm=" + cmpnynm + "]";
	}
	public UsersVo(String usid, String usernm, String password, Date brthdy, String telno, String email,
			String proflphoto, String cmpnynm) {
		
		this.usid = usid;
		this.usernm = usernm;
		this.password = password;
		this.brthdy = brthdy;
		this.telno = telno;
		this.email = email;
		this.proflphoto = proflphoto;
		this.cmpnynm = cmpnynm;
	}
	public UsersVo() {
		
	}
	
	
}
