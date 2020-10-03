package reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import member.Util;

public class ReservationDAO {

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

	public int getMaxNo() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxNo = 0;
		try {
			conn = getConnection();
			sql = "select Max(no) from project_reservation";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				maxNo = rs.getInt(1) + 1;
			else
				maxNo = 1;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return maxNo;
	}

	public void updateReservation() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<Integer> roomList = new ArrayList<Integer>();

		try {
			conn = getConnection();
			sql = "select ROOM_NO from project_reservation where CHK_OUT < to_char(sysdate,'yyyymmdd')";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				roomList.add(rs.getInt("ROOM_NO"));
			}

			for (int room_no : roomList) {
				sql = "update project_room set IS_RESERVATION = 'NO' where ROOM_NO = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, room_no);
				pstmt.executeUpdate();
				
				sql = "delete project_reservation where room_no = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, room_no);
				pstmt.executeUpdate();
			
			
				sql = "delete project_payment where room_no = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, room_no);
				pstmt.executeUpdate();
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
	}

	public boolean insertReservation(String chk_in, String chk_out, int room_no, String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			conn = getConnection();
			sql = "insert into project_reservation(no,chk_in,chk_out,room_no,id)values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, this.getMaxNo());
			pstmt.setString(2, chk_in);
			pstmt.setString(3, chk_out);
			pstmt.setInt(4, room_no);
			pstmt.setString(5, id);

			if (pstmt.executeUpdate() == 1)
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return flag;
	}

	public boolean deleteReservation(String id, int room_no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			conn = getConnection();
			sql = "delete from project_Reservation where id = ? and room_no = ? ";
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
	
	public ArrayList<ReservationDTO> getReservation(String id) {
		ReservationDTO bean = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReservationDTO> reservationList = new ArrayList<>();
		try {
			conn = getConnection();
			String sql = "select * from project_reservation where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new ReservationDTO();
				bean.setId(rs.getString("id"));
				bean.setChk_in(rs.getString("chk_in"));
				bean.setChk_out(rs.getString("chk_out"));
				bean.setRoom_no(rs.getInt("room_no"));
				reservationList.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}

		return reservationList;
	}
}