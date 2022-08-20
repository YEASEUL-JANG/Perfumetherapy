package items;

public class itemsDTO {
	private int idx;
	private String iname;
	private String picture;
	private int o_price;
	private int sale_price;
	private int stock;
	private int point;
	private int volume;
	private String memo;
	private String post_date;
	private String category;
	private String big_category;
	private String brand;
	public itemsDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public String getIname() {
		return iname;
	}


	public void setIname(String iname) {
		this.iname = iname;
	}


	public String getPicture() {
		return picture;
	}


	public void setPicture(String picture) {
		this.picture = picture;
	}


	public int getO_price() {
		return o_price;
	}


	public void setO_price(int o_price) {
		this.o_price = o_price;
	}


	public int getSale_price() {
		return sale_price;
	}


	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}


	public int getStock() {
		return stock;
	}


	public void setStock(int stock) {
		this.stock = stock;
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


	public String getMemo() {
		return memo;
	}


	public void setMemo(String memo) {
		this.memo = memo;
	}


	public String getPost_date() {
		return post_date;
	}


	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getBig_category() {
		return big_category;
	}


	public void setBig_category(String big_category) {
		this.big_category = big_category;
	}


	public String getBrand() {
		return brand;
	}


	public void setBrand(String brand) {
		this.brand = brand;
	}


	public itemsDTO(int idx, String iname, String picture, int o_price, int sale_price, int stock, int point,
			int volume, String memo, String post_date, String category, String big_category, String brand) {
		super();
		this.idx = idx;
		this.iname = iname;
		this.picture = picture;
		this.o_price = o_price;
		this.sale_price = sale_price;
		this.stock = stock;
		this.point = point;
		this.volume = volume;
		this.memo = memo;
		this.post_date = post_date;
		this.category = category;
		this.big_category = big_category;
		this.brand = brand;
	}


}
