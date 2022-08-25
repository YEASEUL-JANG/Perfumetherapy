package items;

public class wishDTO {
	private int likeid;
	private int idx;
	private String picture;
	private String iname;
	private int sale_price;
	private int point;
	private int volume;
	public wishDTO() {
		// TODO Auto-generated constructor stub
	}
	public int getLikeid() {
		return likeid;
	}
	public void setLikeid(int likeid) {
		this.likeid = likeid;
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
		return "wishDTO [likeid=" + likeid + ", idx=" + idx + ", picture=" + picture + ", iname=" + iname
				+ ", sale_price=" + sale_price + ", point=" + point + ", volume=" + volume + "]";
	}
	
}
