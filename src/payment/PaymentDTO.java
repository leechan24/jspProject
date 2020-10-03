package payment;

public class PaymentDTO {

	private int paycode;
	private int customer;
	private int total_pay;
	private String id;
	private int room_no;
	
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public int getPaycode() {
		return paycode;
	}
	public void setPaycode(int paycode) {
		this.paycode = paycode;
	}
	public int getCustomer() {
		return customer;
	}
	public void setCustomer(int customer) {
		this.customer = customer;
	}
	public int getTotal_pay() {
		return total_pay;
	}
	public void setTotal_pay(int total_pay) {
		this.total_pay = total_pay;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

}