package kr.or.ddit.model;

public class TaskVo {

	private String prjctno;            //프로젝트번호     
	private String jobno;              //업무번호       
	private String jobnm;              //업무이름       
	private String jobcn;              //업무내용       
	private String jobpriort;          //업무우선순위     
	                                                  
	private String jobsttus;           //업무상태       
	private int prgsdo;                //진척도     
	private String jobrgsde;//등록일     //업무등록일      
	private String jobbgnde; //시작일    //업무시작일        
	private String jobclosde;//마감일    //업무마감일        
	                                                  
	private String upperjobno;         //상위업무번호     
	private String jobwrter;           //업무작성자
	
	private int mcount;                          
	private String manager;                    
	private String usid;               
	public String completech;    //완료여부
	public String twriterid;   //작성자 아이디
	public String proflphoto; //프사
	public String filename;  //파일이름
	public String realfilename;
	
	
	public String getProflphoto() {
		return proflphoto;
	}
	public void setProflphoto(String proflphoto) {
		this.proflphoto = proflphoto;
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
	public String getCompletech() {
		return completech;
	}
	public void setCompletech(String completech) {
		this.completech = completech;
	}
	public String getTwriterid() {
		return twriterid;
	}
	public void setTwriterid(String twriterid) {
		this.twriterid = twriterid;
	}
	public String getUsid() {
		return usid;
	}
	public void setUsid(String usid) {
		this.usid = usid;
	}
	public String getManager() {
		return manager== null?"":manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public int getMcount() {
		if(mcount==-1) {
			mcount=0;
		}
		return mcount;
	}
	public void setMcount(int mcount) {
		this.mcount = mcount;
	}
	public String getPrjctno() {
		return prjctno;
	}
	public void setPrjctno(String prjctno) {
		this.prjctno = prjctno;
	}
	public String getJobno() {
		return jobno;
	}
	public void setJobno(String jobno) {
		this.jobno = jobno;
	}
	public String getJobnm() {
		return jobnm;
	}
	public void setJobnm(String jobnm) {
		this.jobnm = jobnm;
	}
	public String getJobcn() {
		return jobcn;
	}
	public void setJobcn(String jobcn) {
		this.jobcn = jobcn;
	}
	public String getJobpriort() {
		return jobpriort;
	}
	public void setJobpriort(String jobpriort) {
		this.jobpriort = jobpriort;
	}
	public String getJobsttus() {
		return jobsttus;
	}
	public void setJobsttus(String jobsttus) {
		this.jobsttus = jobsttus;
	}
	public int getPrgsdo() {
		return prgsdo;
	}
	public void setPrgsdo(int prgsdo) {
		this.prgsdo = prgsdo;
	}

	public String getJobrgsde() {
		return jobrgsde;
	}
	public void setJobrgsde(String jobrgsde) {
		this.jobrgsde=jobrgsde.substring(0, 10);
	}
	
	public String getJobbgnde() {
		return jobbgnde;
	}
	public void setJobbgnde(String jobbgnde) {
		this.jobbgnde = jobbgnde.substring(0, 10);
	}
	public String getJobclosde() {
		return jobclosde == null? "-" : jobclosde;
	}
	public void setJobclosde(String jobclosde) {
		this.jobclosde = jobclosde.substring(0, 10);
	}
	public String getUpperjobno() {
		return upperjobno;
	}
	public void setUpperjobno(String upperjobno) {
		this.upperjobno = upperjobno;
	}
	public String getJobwrter() {
		return jobwrter;
	}
	public void setJobwrter(String jobwrter) {
		this.jobwrter = jobwrter;
	}
	
	
	@Override
	public String toString() {
		return "TaskVo [prjctno=" + prjctno + ", jobno=" + jobno + ", jobnm=" + jobnm + ", jobcn=" + jobcn
				+ ", jobpriort=" + jobpriort + ", jobsttus=" + jobsttus + ", prgsdo=" + prgsdo + ", jobrgsde="
				+ jobrgsde + ", jobbgnde=" + jobbgnde + ", jobclosde=" + jobclosde + ", upperjobno=" + upperjobno
				+ ", jobwrter=" + jobwrter + ", mcount=" + mcount + ", manager=" + manager + ", usid=" + usid
				+ ", completech=" + completech + ", twriterid=" + twriterid + ", proflphoto=" + proflphoto
				+ ", filename=" + filename + ", realfilename=" + realfilename + "]";
	}
	
}
