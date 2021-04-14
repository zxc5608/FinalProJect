package kr.or.ddit.model;

import java.sql.Date;

public class ApprovalVo {

	private String docno       ;      // 문서번호
	private String jobno       ;      // 업무번호
	private String wrter       ;      // 작성자
	private String docsj       ;      // 문서제목
	private String doccn       ;      // 문서내용
	private String atchmnfl    ;      // 첨부파일
	private Date wrtede      ;        // 작성일자
	private Date taskclsde   ;        // 종료일
	
	private String sanctnsttus;	//결재상태
	                                     
	public ApprovalVo() {
		super();
	}

	public String getSanctnsttus() {
		return sanctnsttus;
	}
	public void setSanctnsttus(String sanctnsttus) {
		this.sanctnsttus = sanctnsttus;
	}
	public String getDocno() {
		return docno;
	}
	public void setDocno(String docno) {
		this.docno = docno;
	}
	public String getJobno() {
		return jobno;
	}
	public void setJobno(String jobno) {
		this.jobno = jobno;
	}
	public String getWrter() {
		return wrter;
	}
	public void setWrter(String wrter) {
		this.wrter = wrter;
	}
	public String getDocsj() {
		return docsj;
	}
	public void setDocsj(String docsj) {
		this.docsj = docsj;
	}
	public String getDoccn() {
		return doccn;
	}
	public void setDoccn(String doccn) {
		this.doccn = doccn;
	}
	public String getAtchmnfl() {
		return atchmnfl;
	}
	public void setAtchmnfl(String atchmnfl) {
		this.atchmnfl = atchmnfl;
	}
	public Date getWrtede() {
		return wrtede;
	}
	public void setWrtede(Date wrtede) {
		this.wrtede = wrtede;
	}
	public Date getTaskclsde() {
		return taskclsde;
	}
	public void setTaskclsde(Date taskclsde) {
		this.taskclsde = taskclsde;
	}
	
	@Override
	public String toString() {
		return "ApprovalVo [docno=" + docno + ", jobno=" + jobno + ", wrter=" + wrter + ", docsj=" + docsj + ", doccn="
				+ doccn + ", atchmnfl=" + atchmnfl + ", wrtede=" + wrtede + ", taskclsde=" + taskclsde
				+ ", sanctnsttus=" + sanctnsttus + "]";
	}

	public ApprovalVo(String docno, String jobno, String wrter, String docsj, String doccn, String atchmnfl,
			Date wrtede, Date taskclsde, String sanctnsttus) {
		super();
		this.docno = docno;
		this.jobno = jobno;
		this.wrter = wrter;
		this.docsj = docsj;
		this.doccn = doccn;
		this.atchmnfl = atchmnfl;
		this.wrtede = wrtede;
		this.taskclsde = taskclsde;
		this.sanctnsttus =sanctnsttus;
	}

	
	
	
}
