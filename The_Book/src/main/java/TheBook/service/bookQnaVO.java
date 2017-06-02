package TheBook.service;

import java.sql.Date;

public class bookQnaVO {

	private int qnaunq;
	private String qnaid;
	private String qnapwd;
	private String qnatitle;
	private String qnacontent;
	private int qnahit;
	private int qnafid;
	private String qnathread;
	private Date qnaregdate;
	
	private String search;
	private String name;
	
	private int tot;

	private String srchTxt;
	private String srchCd;

	/** 현재페이지 */
	private int pageIndex = 1;

	/** 페이지갯수 */
	private int pageUnit = 10;

	/** 페이지사이즈 */
	private int pageSize = 10;

	/** firstIndex */
	private int firstIndex = 1;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage */
	private int recordCountPerPage = 10;
	
	
	
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public String getSrchTxt() {
		return srchTxt;
	}
	public void setSrchTxt(String srchTxt) {
		this.srchTxt = srchTxt;
	}
	public String getSrchCd() {
		return srchCd;
	}
	public void setSrchCd(String srchCd) {
		this.srchCd = srchCd;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public int getQnaunq() {
		return qnaunq;
	}
	public void setQnaunq(int qnaunq) {
		this.qnaunq = qnaunq;
	}
	public String getQnaid() {
		return qnaid;
	}
	public void setQnaid(String qnaid) {
		this.qnaid = qnaid;
	}
	public String getQnapwd() {
		return qnapwd;
	}
	public void setQnapwd(String qnapwd) {
		this.qnapwd = qnapwd;
	}
	public String getQnatitle() {
		return qnatitle;
	}
	public void setQnatitle(String qnatitle) {
		this.qnatitle = qnatitle;
	}
	public String getQnacontent() {
		return qnacontent;
	}
	public void setQnacontent(String qnacontent) {
		this.qnacontent = qnacontent;
	}
	
	public int getQnahit() {
		return qnahit;
	}
	public void setQnahit(int qnahit) {
		this.qnahit = qnahit;
	}
	public int getQnafid() {
		return qnafid;
	}
	public void setQnafid(int qnafid) {
		this.qnafid = qnafid;
	}
	public String getQnathread() {
		return qnathread;
	}
	public void setQnathread(String qnathread) {
		this.qnathread = qnathread;
	}
	public Date getQnaregdate() {
		return qnaregdate;
	}
	public void setQnaregdate(Date qnaregdate) {
		this.qnaregdate = qnaregdate;
	}
	
	
	
	
		
}
