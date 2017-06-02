package TheBook.service;

public class bookBuyDetailVO {

	private String buydetailbuyunq;
	private String buydetailbookunq;
	private String buydetailbookname;
	private int buydetailprice;
	private int buydetailcnt;
	private int buydetailtotalprice;
	private String buydetailbookimg;
	private String buydetailmemid;
	private String buydetailcondition;
	
	private String memid;
	
	private int totBookCost;
	private int usedCash;
	private int usedPoint;
	
	private int buyRoute;
	
	private int pageIndex = 1; //** 현재페이지 *//*
	private int pageUnit = 10; //** 페이지갯수 *//*
	private int pageSize = 10; //** 페이지사이즈 *//*
	private int firstIndex = 1; //** firstIndex *//*
	private int lastIndex = 1; //** lastIndex *//*
	private int recordCountPerPage = 10; //** recordCountPerPage *//*
	
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
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
	public int getTotBookCost() {
		return totBookCost;
	}
	public void setTotBookCost(int totBookCost) {
		this.totBookCost = totBookCost;
	}
	public int getUsedCash() {
		return usedCash;
	}
	public void setUsedCash(int usedCash) {
		this.usedCash = usedCash;
	}
	public int getUsedPoint() {
		return usedPoint;
	}
	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}
	
	public String getBuydetailbuyunq() {
		return buydetailbuyunq;
	}
	public void setBuydetailbuyunq(String buydetailbuyunq) {
		this.buydetailbuyunq = buydetailbuyunq;
	}
	public String getBuydetailbookunq() {
		return buydetailbookunq;
	}
	public void setBuydetailbookunq(String buydetailbookunq) {
		this.buydetailbookunq = buydetailbookunq;
	}
	public String getBuydetailbookname() {
		return buydetailbookname;
	}
	public void setBuydetailbookname(String buydetailbookname) {
		this.buydetailbookname = buydetailbookname;
	}
	public int getBuydetailprice() {
		return buydetailprice;
	}
	public void setBuydetailprice(int buydetailprice) {
		this.buydetailprice = buydetailprice;
	}
	public int getBuydetailcnt() {
		return buydetailcnt;
	}
	public void setBuydetailcnt(int buydetailcnt) {
		this.buydetailcnt = buydetailcnt;
	}
	public int getBuydetailtotalprice() {
		return buydetailtotalprice;
	}
	public void setBuydetailtotalprice(int buydetailtotalprice) {
		this.buydetailtotalprice = buydetailtotalprice;
	}
	public String getBuydetailbookimg() {
		return buydetailbookimg;
	}
	public void setBuydetailbookimg(String buydetailbookimg) {
		this.buydetailbookimg = buydetailbookimg;
	}
	public String getBuydetailmemid() {
		return buydetailmemid;
	}
	public void setBuydetailmemid(String buydetailmemid) {
		this.buydetailmemid = buydetailmemid;
	}
	public String getBuydetailcondition() {
		return buydetailcondition;
	}
	public void setBuydetailcondition(String buydetailcondition) {
		this.buydetailcondition = buydetailcondition;
	}
	public int getBuyRoute() {
		return buyRoute;
	}
	public void setBuyRoute(int buyRoute) {
		this.buyRoute = buyRoute;
	}
}
