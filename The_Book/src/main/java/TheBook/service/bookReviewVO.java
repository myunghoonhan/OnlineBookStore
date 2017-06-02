package TheBook.service;

import java.sql.Date;

public class bookReviewVO {
	private String reviewunq;
	private String reviewid;
	private String reviewbookunq;
	private String reviewcontent;
	private int reviewstar;
	private Date reviewregdate;
	
	
	private int tot;  //리뷰 갯수
	private int pageIndex = 1; /** 현재페이지 */
	private int pageUnit = 10; /** 페이지갯수 */
	private int pageSize = 10; /** 페이지사이즈 */
	private int firstIndex = 1; /** firstIndex */
	private int lastIndex = 1; /** lastIndex */
	private int recordCountPerPage = 10; /** recordCountPerPage */
	
	
	
	
	public String getReviewunq() {
		return reviewunq;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
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
	public void setReviewunq(String reviewunq) {
		this.reviewunq = reviewunq;
	}
	public String getReviewid() {
		return reviewid;
	}
	public void setReviewid(String reviewid) {
		this.reviewid = reviewid;
	}
	public String getReviewbookunq() {
		return reviewbookunq;
	}
	public void setReviewbookunq(String reviewbookunq) {
		this.reviewbookunq = reviewbookunq;
	}
	public String getReviewcontent() {
		return reviewcontent;
	}
	public void setReviewcontent(String reviewcontent) {
		this.reviewcontent = reviewcontent;
	}
	public int getReviewstar() {
		return reviewstar;
	}
	public void setReviewstar(int reviewstar) {
		this.reviewstar = reviewstar;
	}
	public Date getReviewregdate() {
		return reviewregdate;
	}
	public void setReviewregdate(Date reviewregdate) {
		this.reviewregdate = reviewregdate;
	}
	
	
}
