package kr.or.ddit.model;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CalendarVo {

	private String fxno      ;
	private String prjctno   ;
	private String fxsj      ;
	private String fxcn      ;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fxbgnde   ;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fxendde   ;
	private String fxconstnt ;
	private String prjctnm;
	private String fxlocation;
	private String fxregistday;  //일정 등록일
	private String chargerid;	//참여자 아이디
	private String chnm;    //참여자 이름
	private String cwriter;   //등록자 이름
	private String cwriterid; //등록자 아이디
	
	
	public String getFxlocation() {
		return fxlocation;
	}
	public void setFxlocation(String fxlocation) {
		this.fxlocation = fxlocation;
	}
	public String getFxregistday() {
		return fxregistday;
	}
	public void setFxregistday(String fxregistday) {
		this.fxregistday = fxregistday;
	}
	public String getChargerid() {
		return chargerid;
	}
	public void setChargerid(String chargerid) {
		this.chargerid = chargerid;
	}
	public String getChnm() {
		return chnm;
	}
	public void setChnm(String chnm) {
		this.chnm = chnm;
	}
	public String getCwriter() {
		return cwriter;
	}
	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}
	public String getCwriterid() {
		return cwriterid;
	}
	public void setCwriterid(String cwriterid) {
		this.cwriterid = cwriterid;
	}
	public String getPrjctnm() {
		return prjctnm;
	}
	public void setPrjctnm(String prjctnm) {
		this.prjctnm = prjctnm;
	}
	public String getFxno() {
		return fxno;
	}
	public void setFxno(String fxno) {
		this.fxno = fxno;
	}
	public String getPrjctno() {
		return prjctno;
	}
	public void setPrjctno(String prjctno) {
		this.prjctno = prjctno;
	}
	public String getFxsj() {
		return fxsj;
	}
	public void setFxsj(String fxsj) {
		this.fxsj = fxsj;
	}
	public String getFxcn() {
		return fxcn;
	}
	public void setFxcn(String fxcn) {
		this.fxcn = fxcn;
	}
	public Date getFxbgnde() {
		return fxbgnde;
	}
	public void setFxbgnde(Date fxbgnde) {
		this.fxbgnde = fxbgnde;
	}
	public Date getFxendde() {
		return fxendde;
	}
	public void setFxendde(Date fxendde) {
		this.fxendde = fxendde;
	}
	public String getFxconstnt() {
		return fxconstnt;
	}
	public void setFxconstnt(String fxconstnt) {
		this.fxconstnt = fxconstnt;
	}
	
	@Override
	public String toString() {
		return "CalendarVo [fxno=" + fxno + ", prjctno=" + prjctno + ", fxsj=" + fxsj + ", fxcn=" + fxcn + ", fxbgnde="
				+ fxbgnde + ", fxendde=" + fxendde + ", fxconstnt=" + fxconstnt + ", prjctnm=" + prjctnm
				+ ", fxlocation=" + fxlocation + ", fxregistday=" + fxregistday + ", chargerid=" + chargerid + ", chnm="
				+ chnm + ", cwriter=" + cwriter + ", cwriterid=" + cwriterid + "]";
	}
}
