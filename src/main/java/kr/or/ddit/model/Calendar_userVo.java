package kr.or.ddit.model;

public class Calendar_userVo {
	
	private String fxno;			//일정 번호
	private String chargerid;	//참여자 아이디
	
	
	public String getFxno() {
		return fxno;
	}
	public void setFxno(String fxno) {
		this.fxno = fxno;
	}
	public String getChargerid() {
		return chargerid;
	}
	public void setChargerid(String chargerid) {
		this.chargerid = chargerid;
	}
	
	
	@Override
	public String toString() {
		return "calendar_userVo [fxno=" + fxno + ", chargerid=" + chargerid + "]";
	}
	
	
	

}
