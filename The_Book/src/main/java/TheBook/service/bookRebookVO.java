package TheBook.service;

import java.sql.Date;

public class bookRebookVO {
	private String rebounq;
	private String rebobookunq;
	private int reboprice;
	private String rebocondition;
	private String reboid;
	private String reboname;
	private Date reboregdate;
	private String rebostock;
	
	
	//검색
	
	private String reboSearchCode;
	private String reboSearchName;
	private String reboGubun;
	
	//중고장터 갯수
	private String recnt;
	//중고장터 unq
	private String bounq;
	
	public String getReboSearchCode() {
		return reboSearchCode;
	}
	public void setReboSearchCode(String reboSearchCode) {
		this.reboSearchCode = reboSearchCode;
	}
	public String getReboSearchName() {
		return reboSearchName;
	}
	public void setReboSearchName(String reboSearchName) {
		this.reboSearchName = reboSearchName;
	}
	public String getRebounq() {
		return rebounq;
	}
	public void setRebounq(String rebounq) {
		this.rebounq = rebounq;
	}
	public String getRebobookunq() {
		return rebobookunq;
	}
	public void setRebobookunq(String rebobookunq) {
		this.rebobookunq = rebobookunq;
	}
	public int getReboprice() {
		return reboprice;
	}
	public void setReboprice(int reboprice) {
		this.reboprice = reboprice;
	}
	public String getRebocondition() {
		return rebocondition;
	}
	public void setRebocondition(String rebocondition) {
		this.rebocondition = rebocondition;
	}
	public String getReboid() {
		return reboid;
	}
	public void setReboid(String reboid) {
		this.reboid = reboid;
	}
	public Date getReboregdate() {
		return reboregdate;
	}
	public void setReboregdate(Date reboregdate) {
		this.reboregdate = reboregdate;
	}
	public String getReboname() {
		return reboname;
	}
	public void setReboname(String reboname) {
		this.reboname = reboname;
	}
	public String getRebostock() {
		return rebostock;
	}
	public void setRebostock(String rebostock) {
		this.rebostock = rebostock;
	}
	public String getReboGubun() {
		return reboGubun;
	}
	public void setReboGubun(String reboGubun) {
		this.reboGubun = reboGubun;
	}
	public String getRecnt() {
		return recnt;
	}
	public void setRecnt(String recnt) {
		this.recnt = recnt;
	}
	public String getBounq() {
		return bounq;
	}
	public void setBounq(String bounq) {
		this.bounq = bounq;
	}
	
	
}
