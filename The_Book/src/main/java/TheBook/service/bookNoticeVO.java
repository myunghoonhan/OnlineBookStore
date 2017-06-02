package TheBook.service;

import java.sql.Date;

public class bookNoticeVO {
	
	private int booknoticeunq;
	private String booknoticetitle;
	private String booknoticecontent;
	private String booknoticehit;
	private Date booknoticeregdate;
	
	private String searchname;
	
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
	public String getSearchname() {
		return searchname;
	}
	public void setSearchname(String searchname) {
		this.searchname = searchname;
	}

	public int getBooknoticeunq() {
		return booknoticeunq;
	}
	public void setBooknoticeunq(int booknoticeunq) {
		this.booknoticeunq = booknoticeunq;
	}	
	public String getBooknoticetitle() {
		return booknoticetitle;
	}
	public void setBooknoticetitle(String booknoticetitle) {
		this.booknoticetitle = booknoticetitle;
	}
	public String getBooknoticecontent() {
		return booknoticecontent;
	}
	public void setBooknoticecontent(String booknoticecontent) {
		this.booknoticecontent = booknoticecontent;
	}
	public String getBooknoticehit() {
		return booknoticehit;
	}
	public void setBooknoticehit(String booknoticehit) {
		this.booknoticehit = booknoticehit;
	}
	public Date getBooknoticeregdate() {
		return booknoticeregdate;
	}
	public void setBooknoticeregdate(Date booknoticeregdate) {
		this.booknoticeregdate = booknoticeregdate;
	}
	
	
}
