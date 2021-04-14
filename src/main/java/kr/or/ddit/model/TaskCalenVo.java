package kr.or.ddit.model;

import java.sql.Date;

public class TaskCalenVo {

	private String biztype;
	private String prjctno;
	private String sno;
	private String titlenm;
	private String centent;
	private String priort;
	private String sttus;
	private String prgsdo;
	private String regdate;
	private Date  bgdate;
	private Date  endate;
	private String writer;
	private String filename;
	private String realfilename;
	private String fxlocation;
	private String attend;
	private String chnm;
	private String cwriter;
	private String ctwriterid;
	
	
	
	public String getCtwriterid() {
		return ctwriterid;
	}
	public void setCtwriterid(String ctwriterid) {
		this.ctwriterid = ctwriterid;
	}
	public String getCwriter() {
		return cwriter;
	}
	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}
	public String getChnm() {
		return chnm;
	}
	public void setChnm(String chnm) {
		this.chnm = chnm;
	}
	public String getAttend() {
		return attend;
	}
	public void setAttend(String attend) {
		this.attend = attend;
	}
	public String getBiztype() {
		return biztype;
	}
	public void setBiztype(String biztype) {
		this.biztype = biztype;
	}
	public String getPrjctno() {
		return prjctno;
	}
	public void setPrjctno(String prjctno) {
		this.prjctno = prjctno;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getTitlenm() {
		return titlenm;
	}
	public void setTitlenm(String titlenm) {
		this.titlenm = titlenm;
	}
	public String getCentent() {
		return centent;
	}
	public void setCentent(String centent) {
		this.centent = centent;
	}
	public String getPriort() {
		return priort;
	}
	public void setPriort(String priort) {
		this.priort = priort;
	}
	public String getSttus() {
		return sttus;
	}
	public void setSttus(String sttus) {
		this.sttus = sttus;
	}
	public String getPrgsdo() {
		return prgsdo;
	}
	public void setPrgsdo(String prgsdo) {
		this.prgsdo = prgsdo;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public Date getBgdate() {
		return bgdate;
	}
	public void setBgdate(Date bgdate) {
		this.bgdate = bgdate;
	}
	public Date getEndate() {
		return endate;
	}
	public void setEndate(Date endate) {
		this.endate = endate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRealfilename() {
		return realfilename;
	}
	public void setRealfilename(String realfilename) {
		this.realfilename = realfilename;
	}
	public String getFxlocation() {
		return fxlocation;
	}
	public void setFxlocation(String fxlocation) {
		this.fxlocation = fxlocation;
	}
	@Override
	public String toString() {
		return "TaskCalenVo [biztype=" + biztype + ", prjctno=" + prjctno + ", sno=" + sno + ", titlenm=" + titlenm
				+ ", centent=" + centent + ", priort=" + priort + ", sttus=" + sttus + ", prgsdo=" + prgsdo
				+ ", regdate=" + regdate + ", bgdate=" + bgdate + ", endate=" + endate + ", writer=" + writer
				+ ", filename=" + filename + ", realfilename=" + realfilename + ", fxlocation=" + fxlocation
				+ ", attend=" + attend + ", chnm=" + chnm + ", cwriter=" + cwriter + ", ctwriterid=" + ctwriterid + "]";
	}
	
	
	
	

	
}
