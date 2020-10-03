package room;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import member.MemberDTO;
import member.Util;
import reservation.ReservationDTO;

public class RoomDAO {

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

	public boolean updateRoom(int room_No) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			conn = getConnection();
			sql = "update project_room set IS_RESERVATION = ? where room_No = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "YES");
			pstmt.setInt(2, room_No);

			if (pstmt.executeUpdate() == 1)
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return flag;

	}
	public boolean cancleRoom(int room_No) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			conn = getConnection();
			sql = "update project_room set IS_RESERVATION = ? where room_No = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "NO");
			pstmt.setInt(2, room_No);

			if (pstmt.executeUpdate() == 1)
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return flag;

	}

	public boolean updateRankRoom(int room_No, int rank_point) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      boolean flag = false;
	      double tmp_rank = 0;
	      double tmp_sum_rank = 0;
	      double result_rank = 0;
	      int rank_cnt = 0;
	      try {

	         conn = getConnection();
	         sql = "select rank_point, rank_cnt from project_room where room_no = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, room_No);
	         rs = pstmt.executeQuery();   
	         if (rs.next()) {
	            tmp_rank = rs.getDouble("rank_point");
	               rank_cnt = rs.getInt("rank_cnt");
	         }
	         
	         tmp_sum_rank = tmp_rank* rank_cnt + rank_point;
	         rank_cnt +=1;
	         result_rank = tmp_sum_rank/ rank_cnt;
	         

	         sql = "update project_room set rank_point = ? rank_cnt = ? where room_No = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setDouble(1, result_rank);
	         pstmt.setInt(2, rank_cnt);
	         pstmt.setInt(3, room_No);

	         if (pstmt.executeUpdate() == 1)
	            flag = true;

	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         Util.close(conn, pstmt, rs);
	      }
	      return flag;
	   }

	public RoomDTO getRoom(int Room_no) {
		RoomDTO bean = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select * from project_room where room_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Room_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new RoomDTO();
				bean.setRoom_no(rs.getInt("room_no"));
				bean.setRoom_name(rs.getString("room_name"));
				bean.setIs_reservation(rs.getString("is_reservation"));
				bean.setMax_customer(rs.getInt("Max_customer"));
				bean.setRoom_fee(rs.getInt("room_fee"));
				bean.setRank_point(rs.getDouble("rank_point"));
				bean.setRank_cnt(rs.getInt("rank_cnt"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}

		return bean;
	}

	public ArrayList<Integer> getReservOk(String Room_Name) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = null;
		ArrayList<Integer> roomlist = new ArrayList<Integer>(); 
		
		try {
			con = getConnection();
			sql = "select ROOM_NO from PROJECT_ROOM where ROOM_NAME = ? and IS_RESERVATION = 'NO'";
			ps = con.prepareStatement(sql);
			ps.setString(1, Room_Name);
			rs = ps.executeQuery();
			while (rs.next()) {
				roomlist.add(rs.getInt("room_no"));
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(con, ps, rs);
		}
		return roomlist; 
	}

}