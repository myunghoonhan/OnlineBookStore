package TheBook.service;

import java.sql.Date;

public class bookStoreNoticeVO {
	
	private int storenoticeunq;
	
	private String storenoticestore;
	private String storenoticetitle;
	private String storenoticecontent;
	private String storenoticeroom;
	private String storenoticeing;
	private Date storenoticeregdate;
	
	private String searchname;
	private String selecttype;
	
	private String sdate;
	private String edate;
	
	
	private String sbsdate;
	private String sbedate;
	
	public String getSbsdate() {
		return sbsdate;
	}
	public void setSbsdate(String sbsdate) {
		this.sbsdate = sbsdate;
	}
	public String getSbedate() {
		return sbedate;
	}
	public void setSbedate(String sbedate) {
		this.sbedate = sbedate;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getSelecttype() {
		return selecttype;
	}
	public void setSelecttype(String selecttype) {
		this.selecttype = selecttype;
	}
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
	
	private int tot;
	
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}		
	
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
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

	public String getStorenoticestore() {
		return storenoticestore;
	}
	public void setStorenoticestore(String storenoticestore) {
		this.storenoticestore = storenoticestore;
	}
	public String getStorenoticetitle() {
		return storenoticetitle;
	}
	public void setStorenoticetitle(String storenoticetitle) {
		this.storenoticetitle = storenoticetitle;
	}
	public String getStorenoticecontent() {
		return storenoticecontent;
	}
	public void setStorenoticecontent(String storenoticecontent) {
		this.storenoticecontent = storenoticecontent;
	}
	public String getStorenoticeroom() {
		return storenoticeroom;
	}
	public void setStorenoticeroom(String storenoticeroom) {
		this.storenoticeroom = storenoticeroom;
	}
	public String getStorenoticeing() {
		return storenoticeing;
	}
	public void setStorenoticeing(String storenoticeing) {
		this.storenoticeing = storenoticeing;
	}
	public Date getStorenoticeregdate() {
		return storenoticeregdate;
	}
	public void setStorenoticeregdate(Date storenoticeregdate) {
		this.storenoticeregdate = storenoticeregdate;
	}
	public String getSearchname() {
		return searchname;
	}
	public void setSearchname(String searchname) {
		this.searchname = searchname;
	}
	public int getStorenoticeunq() {
		return storenoticeunq;
	}
	public void setStorenoticeunq(int storenoticeunq) {
		this.storenoticeunq = storenoticeunq;
	}
	
}
