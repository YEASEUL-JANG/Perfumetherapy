package order.dto;

public class CartDTO {
	private int cartid;
	private int num;
	private int idx;
	private String picture;
	private String iname;
	private int sale_price;
	private int point;
	private int volume;
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
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
		return "CartDTO [cartid=" + cartid + ", num=" + num + ", idx=" + idx + ", picture=" + picture + ", iname="
				+ iname + ", sale_price=" + sale_price + ", point=" + point + ", volume=" + volume + ", getCartid()="
				+ getCartid() + ", getNum()=" + getNum() + ", getIdx()=" + getIdx() + ", getPicture()=" + getPicture()
				+ ", getIname()=" + getIname() + ", getSale_price()=" + getSale_price() + ", getPoint()=" + getPoint()
				+ ", getVolume()=" + getVolume() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}
