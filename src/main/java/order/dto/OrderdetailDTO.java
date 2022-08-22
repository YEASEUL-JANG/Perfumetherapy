package order.dto;

public class OrderdetailDTO {
	private String orderid; //주문번호
	private String userid;//아이디
	private int cartid;//카트번호
	private int num; //구매수량
	private int idx;//상품번호
	private String picture;//이미지
	private String iname; //상품명
	private int sale_price; //판매가
	private int point; //적립금
	private int volume;//용량
	public OrderdetailDTO() {
		// TODO Auto-generated constructor stub
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getCartid() {
		return cartid;
	}
	public void setCartid(int cartid) {
		this.cartid = cartid;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getIname() {
		return iname;
	}
	public void setIname(String iname) {
		this.iname = iname;
	}
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getVolume() {
		return volume;
	}
	public void setVolume(int volume) {
		this.volume = volume;
	}
	@Override
	public String toString() {
		return "OrderdetailDTO [orderid=" + orderid + ", userid=" + userid + ", cartid=" + cartid + ", num=" + num
				+ ", idx=" + idx + ", picture=" + picture + ", iname=" + iname + ", sale_price=" + sale_price
				+ ", point=" + point + ", volume=" + volume + "]";
	}
}
