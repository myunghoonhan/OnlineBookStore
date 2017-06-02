package TheBook.service;

public class bookStockVO {

	private String stockbook;
	private String stockstoreunq;
	private int stockstock;
	private String day1;
	private String day2;
	
	private String seltype;
	private String selname;	
	
	public String getDay1() {
		return day1;
	}
	public void setDay1(String day1) {
		this.day1 = day1;
	}
	public String getDay2() {
		return day2;
	}
	public void setDay2(String day2) {
		this.day2 = day2;
	}
	public String getStockbook() {
		return stockbook;
	}
	public void setStockbook(String stockbook) {
		this.stockbook = stockbook;
	}
	public String getStockstoreunq() {
		return stockstoreunq;
	}
	public void setStockstoreunq(String stockstoreunq) {
		this.stockstoreunq = stockstoreunq;
	}
	public int getStockstock() {
		return stockstock;
	}
	public void setStockstock(int stockstock) {
		this.stockstock = stockstock;
	}
	public String getSelname() {
		return selname;
	}
	public void setSelname(String selname) {
		this.selname = selname;
	}
	public String getSeltype() {
		return seltype;
	}
	public void setSeltype(String seltype) {
		this.seltype = seltype;
	}	
	
}
