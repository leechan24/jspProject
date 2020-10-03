package room;

public class RoomDTO {

   private int room_no;
   private String room_name;
   private String is_reservation;
   private int room_fee;
   private int max_customer;
   private double rank_point;
   private int rank_cnt;
   
   public double getRank_point() {
      return rank_point;
   }

   public void setRank_point(double rank_point) {
      this.rank_point = rank_point;
   }

   public int getRank_cnt() {
      return rank_cnt;
   }

   public void setRank_cnt(int rank_cnt) {
      this.rank_cnt = rank_cnt;
   }

   public int getMax_customer() {
      return max_customer;
   }

   public void setMax_customer(int max_customer) {
      this.max_customer = max_customer;
   }

   public int getRoom_fee() {
      return room_fee;
   }

   public void setRoom_fee(int room_fee) {
      this.room_fee = room_fee;
   }

   public int getRoom_no() {
      return room_no;
   }

   public void setRoom_no(int room_no) {
      this.room_no = room_no;
   }

   public String getRoom_name() {
      return room_name;
   }

   public void setRoom_name(String room_name) {
      this.room_name = room_name;
   }

   public String getIs_reservation() {
      return is_reservation;
   }

   public void setIs_reservation(String is_reservation) {
      this.is_reservation = is_reservation;
   }
}