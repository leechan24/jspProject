package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {

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

	public boolean insertInquire(BoardDTO article) { // Project_inquire에 저장
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = article.getNum();
		int number = 0;
		String sql = "";
		boolean flag = false;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select boardser.nextval from dual");
			rs = pstmt.executeQuery();
			if (rs.next())
				number = rs.getInt(1) + 1;
			else
				number = 1;

			sql = "insert into Project_inquire (num,name,email,tel,title,category,content,password,boardid,reg_date)"
					+ "values(?,?,?,?,?,?,?,?,?,sysdate)";
			String boardid = "3";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, article.getName());
			pstmt.setString(3, article.getEmail());
			pstmt.setInt(4, article.getTel());
			pstmt.setString(5, article.getTitle());
			pstmt.setString(6, article.getCategory());
			pstmt.setString(7, article.getContent());
			pstmt.setString(8, article.getPassword());
			pstmt.setString(9, boardid);
			pstmt.executeUpdate();
			flag = true;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return flag;
	}

	/*
	 * public BoardDTO getInquire(int num, String boardid) { // Project_inquire에
	 * 저장한거 가져오기 PreparedStatement pstmt = null; ResultSet rs = null; Connection con
	 * = null; BoardDTO article = null;
	 * 
	 * try { pstmt = con.
	 * prepareStatement("select * from Project_inquire where num=? and boardid=?");
	 * pstmt.setInt(1, num); pstmt.setString(2, boardid); rs = pstmt.executeQuery();
	 * if (rs.next()) { article = new BoardDTO(); article.setNum(rs.getInt("num"));
	 * article.setName(rs.getString("name"));
	 * article.setEmail(rs.getString("email")); article.setTel(rs.getInt("tel"));
	 * article.setTitle(rs.getString("title"));
	 * article.setCategory(rs.getString("category"));
	 * article.setContent(rs.getString("content"));
	 * article.setPassword(rs.getString("password"));
	 * article.setReg_date(rs.getTimestamp("reg_date"));
	 * 
	 * } } catch (Exception ex) { ex.printStackTrace(); } finally { Util.close(con,
	 * pstmt, rs); } return article; }
	 */

	public int deleteInquire(int num, String password) { // 문의 쓴거 지우기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int number = -1;
		String dbpasswd = "";
		String sql = "";

		try {

			conn = getConnection();
			pstmt = conn.prepareStatement("select password from Project_inquire where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("password");
				if (dbpasswd.equals(password)) {

					sql = "delete Project_inquire where num=?";
					pstmt = conn.prepareStatement(sql);

					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					number = 1;

				} else {
					number = 0;
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return number;
	}

	public ArrayList<BoardDTO> getArticles(int start, int end, String boardid) { // list에 모든 문의들 출력
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardDTO> articleList = new ArrayList<BoardDTO>();
		String sql = null;
		try {
			con = getConnection();
			sql = "select * from " + "(select rownum rnum, a.* "
					+ "from(select * from project_inquire where boardid = ? "
					+ "order by reg_date desc) a) where rnum between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardid);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					BoardDTO article = new BoardDTO();
					article.setNum(rs.getInt("num"));
					article.setName(rs.getString("name"));
					article.setEmail(rs.getString("email"));
					article.setTel(rs.getInt("tel"));
					article.setTitle(rs.getString("title"));
					article.setCategory(rs.getString("category"));
					article.setContent(rs.getString("content"));
					article.setPassword(rs.getString("password"));
					article.setBoardid(rs.getString("boardid"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			Util.close(con, pstmt, rs);
		}
		System.out.println(articleList);
		return articleList;
	}

	public int getArticleCount(String boardid) throws Exception { // 문의가 총 몇개인지 셈
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		int x = 0;
		String sql = "";
		try {
			sql = "select nvl(count(*),0) from Project_inquire where boardid =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return x;
	}

	public BoardDTO getArticle(int num, String boardid) { // 글 내용 보기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		BoardDTO article = null;

		try {
			con = getConnection();
			pstmt = con.prepareStatement("select * from PROJECT_INQUIRE where num=? and boardid=?");
			pstmt.setInt(1, num);
			pstmt.setString(2, boardid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					article = new BoardDTO();
					article.setNum(rs.getInt("num"));
					article.setName(rs.getString("name"));
					article.setEmail(rs.getString("email"));
					article.setTel(rs.getInt("tel"));
					article.setTitle(rs.getString("title"));
					article.setCategory(rs.getString("category"));
					article.setContent(rs.getString("content"));
					article.setPassword(rs.getString("password"));
					article.setBoardid(rs.getString("boardid"));
					article.setReg_date(rs.getTimestamp("reg_date"));
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			Util.close(con, pstmt, rs);
		}
		return article;
	}

	public boolean pwCheck(int num, String password) {
		boolean result = false;
		String dbpw = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		try {
			conn = getConnection();
			String sql = "select password from PROJECT_INQUIRE where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbpw = rs.getString("password");
				if (dbpw.equals(password)) {
					result = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return result;
	}

}