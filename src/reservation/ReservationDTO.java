package reservation;

public class ReservationDTO {
	private int no;
	private String chk_in;
	private String chk_out;
	private int room_no;
	private String id;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getChk_in() {
		return chk_in;
	}

	public void setChk_in(String chk_in) {
		this.chk_in = chk_in;
	}

	public String getChk_out() {
		return chk_out;
	}

	public void setChk_out(String chk_out) {
		this.chk_out = chk_out;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}