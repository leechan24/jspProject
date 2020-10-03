package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
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

	public boolean checkId(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			conn = getConnection();
			sql = "select id from project_member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			flag = pstmt.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return flag;
	}

	public boolean insertMember(MemberDTO bean) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			conn = getConnection();
			sql = "insert into project_member(id,password,name,tel,birthday)values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPassword());
			pstmt.setString(3, bean.getName());
			pstmt.setInt(4, bean.getTel());
			pstmt.setString(5, bean.getBirthday());

			if (pstmt.executeUpdate() == 1)
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return flag;
	}

	public boolean loginMember(String id, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			conn = getConnection();
			sql = "select id from project_member where id = ? and password = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return flag;
	}

	public ArrayList<MemberDTO> readMemberList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MemberDTO> li = new ArrayList<MemberDTO>();
		try {
			conn = getConnection();
			String sql = "select * from project_member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDTO bean = new MemberDTO();
				bean.setId(rs.getString("id"));
				bean.setPassword(rs.getString("p"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getInt("tel"));
				bean.setBirthday(rs.getString("birthday"));
				li.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return li;
	}

	public boolean updateMember(MemberDTO bean) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			conn = getConnection();
			sql = "update project_member set password = ?, name = ?, tel = ?, birthday = ? where id = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getPassword());
			pstmt.setString(2, bean.getName());
			pstmt.setInt(3, bean.getTel());
			pstmt.setString(4, bean.getBirthday());
			pstmt.setString(5, bean.getId());
			
			if (pstmt.executeUpdate() == 1)
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return flag;
	}

	public MemberDTO getMember(String id) {
		MemberDTO bean = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select * from project_member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new MemberDTO();
				bean.setId(rs.getString("id"));
				bean.setPassword(rs.getString("password"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getInt("tel"));
				bean.setBirthday(rs.getString("birthday"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn,pstmt,rs);
		}

		return bean;
	}
	
	public boolean deleteMember(String id, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			conn = getConnection();
			sql = "delete from project_member where id = ? and password = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
		
			if (pstmt.executeUpdate() == 1)
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		return flag;
	}
}