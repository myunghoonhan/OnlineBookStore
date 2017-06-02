package TheBook.service;

import java.sql.Date;

public class bookBuyVO {
	
	private String buyunq;
	private String buyid;
	private String buyname;
	private String buyphone;
	private String buyzip;
	private String buyaddr1;
	private String buyaddr2;
	private int buypoint;
	private int buycash;
	private int buydeliveryprice;
	private Date buyregdate;
	
	
	private String searchtype;
	private String searchname;
	
	/*
	private int pageIndex = 1; *//** 현재페이지 *//*
	private int pageUnit = 10; *//** 페이지갯수 *//*
	private int pageSize = 10; *//** 페이지사이즈 *//*
	private int firstIndex = 1; *//** firstIndex *//*
	private int lastIndex = 1; *//** lastIndex *//*
	private int recordCountPerPage = 10; *//** recordCountPerPage *//*
	
	
	public String getBuyunq() {
		return buyunq;
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
	*/
	
	public void setBuyunq(String buyunq) {
		this.buyunq = buyunq;
	}
	public String getBuyid() {
		return buyid;
	}
	public void setBuyid(String buyid) {
		this.buyid = buyid;
	}
	public String getBuyname() {
		return buyname;
	}
	public void setBuyname(String buyname) {
		this.buyname = buyname;
	}
	public String getBuyphone() {
		return buyphone;
	}
	public void setBuyphone(String buyphone) {
		this.buyphone = buyphone;
	}
	public String getBuyzip() {
		return buyzip;
	}
	public void setBuyzip(String buyzip) {
		this.buyzip = buyzip;
	}
	public String getBuyaddr1() {
		return buyaddr1;
	}
	public void setBuyaddr1(String buyaddr1) {
		this.buyaddr1 = buyaddr1;
	}
	public String getBuyaddr2() {
		return buyaddr2;
	}
	public void setBuyaddr2(String buyaddr2) {
		this.buyaddr2 = buyaddr2;
	}
	public int getBuypoint() {
		return buypoint;
	}
	public void setBuypoint(int buypoint) {
		this.buypoint = buypoint;
	}
	public int getBuycash() {
		return buycash;
	}
	public void setBuycash(int buycash) {
		this.buycash = buycash;
	}
	public int getBuydeliveryprice() {
		return buydeliveryprice;
	}
	public void setBuydeliveryprice(int buydeliveryprice) {
		this.buydeliveryprice = buydeliveryprice;
	}
	public Date getBuyregdate() {
		return buyregdate;
	}
	public void setBuyregdate(Date buyregdate) {
		this.buyregdate = buyregdate;
	}
	public String getSearchtype() {
		return searchtype;
	}
	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}
	public String getSearchname() {
		return searchname;
	}
	public void setSearchname(String searchname) {
		this.searchname = searchname;
	}	
}
