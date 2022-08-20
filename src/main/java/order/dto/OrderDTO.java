package order.dto;

public class OrderDTO {
	private String orderid;
	private String userid;
	private String order_date;
	private int sum_price;
	private String delivery;
	
	public OrderDTO() {
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

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public int getSum_price() {
		return sum_price;
	}

	public void setSum_price(int sum_price) {
		this.sum_price = sum_price;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	@Override
	public String toString() {
		return "OrderDTO [orderid=" + orderid + ", userid=" + userid + ", order_date=" + order_date + ", sum_price="
				+ sum_price + ", delivery=" + delivery + "]";
	}
	
	
}
