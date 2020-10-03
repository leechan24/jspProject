package payment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import member.Util;
import reservation.ReservationDTO;

public class PaymentDAO {


	public static Connection getConnection() throws Exception {
		Connection con = null;
		try {
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbId = "scott";
			String dbPass = "1111";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	

	public int getMaxPayCode() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxPayCode = 0;
		try {
			conn = getConnection();
			sql = "select Max(PayCode) from project_payment";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				maxPayCode = rs.getInt(1) + 1;
			else
				maxPayCode = 1;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt,rs);
		}
		return maxPayCode;
	}

	public boolean insertPayment(int customer_count, int totalPay, String id, int room_no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			conn = getConnection();
			sql = "insert into project_payment(paycode,customer,total_pay,id,room_no)values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, this.getMaxPayCode());
			pstmt.setInt(2, customer_count);
			pstmt.setInt(3, totalPay);
			pstmt.setString(4, id);
			pstmt.setInt(5, room_no);
			
			if (pstmt.executeUpdate() == 1)
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return flag;
	}
	
	public boolean deletePayment(String id, int room_no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			conn = getConnection();
			sql = "delete from project_payment where id = ? and room_no = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);	
			pstmt.setInt(2, room_no);
			
			if (pstmt.executeUpdate() == 1)
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return flag;
	}
	public ArrayList<PaymentDTO> getPayment(String id) {
		PaymentDTO bean = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<PaymentDTO> paymentList = new ArrayList<>();
		
		try {
			conn = getConnection();
			String sql = "select * from project_payment where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bean = new PaymentDTO();
				bean.setId(rs.getString("id"));
				bean.setCustomer(rs.getInt("customer"));
				bean.setTotal_pay(rs.getInt("total_pay"));
				bean.setRoom_no(rs.getInt("room_no"));
				paymentList.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt,rs);
		}

		return paymentList;
	}
	
}