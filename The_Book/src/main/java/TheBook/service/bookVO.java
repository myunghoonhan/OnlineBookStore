package TheBook.service;

import java.sql.Date;

public class bookVO {

	private String bounq;
	private String bocode;
	private String boname;
	private String boauthor;
	private String botrans;
	private String bocompany;
	private String bopublish;
	private int boprice;
	private String boimg;
	private String bopreview1;
	private String bopreview2;
	private String bopreview3;
	private String bopage;
	private String bosize;
	private String boinfo1;
	private String boinfo2;
	private int bohit;
	private Date boregdate;
	private int bototal;
	
	private String searchCode;
	private String searchName;
	private String gubun;
	
	private String name;
	private String search;
	
	private int stockstock; //새 책 등록시 재고 같이넣기
	
	public int getStockstock() {
		return stockstock;
	}
	public void setStockstock(int stockstock) {
		this.stockstock = stockstock;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getSearchCode() {
		return searchCode;
	}
	public void setSearchCode(String searchCode) {
		this.searchCode = searchCode;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getBounq() {
		return bounq;
	}
	public void setBounq(String bounq) {
		this.bounq = bounq;
	}
	public String getBocode() {
		return bocode;
	}
	public void setBocode(String bocode) {
		this.bocode = bocode;
	}
	public String getBoname() {
		return boname;
	}
	public void setBoname(String boname) {
		this.boname = boname;
	}
	public String getBoauthor() {
		return boauthor;
	}
	public void setBoauthor(String boauthor) {
		this.boauthor = boauthor;
	}
	public String getBotrans() {
		return botrans;
	}
	public void setBotrans(String botrans) {
		this.botrans = botrans;
	}
	public String getBocompany() {
		return bocompany;
	}
	public void setBocompany(String bocompany) {
		this.bocompany = bocompany;
	}
	public String getBopublish() {
		return bopublish;
	}
	public void setBopublish(String bopublish) {
		this.bopublish = bopublish;
	}
	public int getBoprice() {
		return boprice;
	}
	public void setBoprice(int boprice) {
		this.boprice = boprice;
	}
	public String getBopreview1() {
		return bopreview1;
	}
	public void setBopreview1(String bopreview1) {
		this.bopreview1 = bopreview1;
	}
	public String getBopreview2() {
		return bopreview2;
	}
	public void setBopreview2(String bopreview2) {
		this.bopreview2 = bopreview2;
	}
	public String getBopreview3() {
		return bopreview3;
	}
	public void setBopreview3(String bopreview3) {
		this.bopreview3 = bopreview3;
	}
	public String getBopage() {
		return bopage;
	}
	public void setBopage(String bopage) {
		this.bopage = bopage;
	}
	public String getBosize() {
		return bosize;
	}
	public void setBosize(String bosize) {
		this.bosize = bosize;
	}
	public String getBoinfo1() {
		return boinfo1;
	}
	public void setBoinfo1(String boinfo1) {
		this.boinfo1 = boinfo1;
	}
	public String getBoinfo2() {
		return boinfo2;
	}
	public void setBoinfo2(String boinfo2) {
		this.boinfo2 = boinfo2;
	}
	public int getBohit() {
		return bohit;
	}
	public void setBohit(int bohit) {
		this.bohit = bohit;
	}
	public Date getBoregdate() {
		return boregdate;
	}
	public void setBoregdate(Date boregdate) {
		this.boregdate = boregdate;
	}
	public String getBoimg() {
		return boimg;
	}
	public void setBoimg(String boimg) {
		this.boimg = boimg;
	}
	public int getBototal() {
		return bototal;
	}
	public void setBototal(int bototal) {
		this.bototal = bototal;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}

	
	
	
}
