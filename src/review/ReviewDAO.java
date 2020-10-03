package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.BoardDTO;
import member.Util;

public class ReviewDAO {

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

	public boolean insertReview(ReviewDTO article, int room_name) { // Project_review에 저장
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = article.getNum();
		int number = 0;
		String sql = "";
		boolean flag = false;
		String real_room_name = "";
		switch (room_name) {
		case 1:
			real_room_name = "Standard";
			break;
		case 2:
			real_room_name = "Superior";
			break;
		case 3:
			real_room_name = "Deluxe";
			break;
		default:
			System.out.println("방 번호 선택 오류==> 디버깅할것");
		}

		try {

			conn = getConnection();
			pstmt = conn.prepareStatement("select reviewser.nextval from dual");
			rs = pstmt.executeQuery();
			if (rs.next())
				number = rs.getInt(1) + 1;
			else
				number = 1;

			sql = "insert into Project_review (num,name,password,title,content,rank_point,room_name,boardid,reg_date)"
					+ "values(?,?,?,?,?,?,?,?,sysdate)";
			String boardid = "3";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, number);
			pstmt.setString(2, article.getName());
			System.out.println(article.getName());
			pstmt.setString(3, article.getPassword());
			System.out.println(article.getPassword());
			pstmt.setString(4, article.getTitle());
			System.out.println(article.getTitle());
			pstmt.setString(5, article.getContent());
			System.out.println(article.getContent());
			pstmt.setInt(6, article.getRank_point());
			System.out.println(article.getRank_point());
			pstmt.setString(7, real_room_name);
			System.out.println(real_room_name);
			pstmt.setString(8, boardid);
			pstmt.executeUpdate();
			flag = true;
			System.out.println("flag1=" + flag);

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			Util.close(conn, pstmt);
		}
		System.out.println("flag2=" + flag);
		return flag;
	}

	public ReviewDTO getReview(int num, String boardid) { // Project_Review에 저장한거 가져오기, 내용보기 할때 사용
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		ReviewDTO article = null;

		try {
			con = getConnection();

			pstmt = con.prepareStatement("select * from Project_review where num=? and boardid=?");
			pstmt.setInt(1, num);
			pstmt.setString(2, boardid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new ReviewDTO();
				article.setNum(rs.getInt("num"));
				article.setName(rs.getString("name"));
				article.setPassword(rs.getString("password"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setRank_point(rs.getInt("rank_point"));
				article.setRoom_name(rs.getString("room_name"));
				article.setReg_date(rs.getTimestamp("reg_date"));

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			Util.close(con, pstmt, rs);
		}
		return article;
	}

	public ArrayList<ReviewDTO> getReviews(String boardid) { // ReviewList에 모든 후기들 출력
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReviewDTO> articleList = new ArrayList<ReviewDTO>();
		String sql = null;
		try {
			con = getConnection();
			sql = "select * from project_review where boardid = ? order by reg_date desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					ReviewDTO article = new ReviewDTO();
					article.setNum(rs.getInt("num"));
					article.setName(rs.getString("name"));
					article.setPassword(rs.getString("password"));
					article.setTitle(rs.getString("title"));
					article.setContent(rs.getString("content"));
					article.setRank_point(rs.getInt("rank_point"));
					article.setRoom_name(rs.getString("room_name"));
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
		System.out.println("articlelist : " + articleList);
		return articleList;
	}

	public int getReviewCount(String boardid) throws Exception { // 후기가 총 몇개인지 셈
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		int x = 0;
		String sql = "";
		try {
			conn = getConnection();

			sql = "select nvl(count(*),0) from Project_review where boardid =?";
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

	public ReviewDTO getArticle(int num, String boardid) { // 글 내용 보기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		ReviewDTO article = null;

		try {
			con = getConnection();
			pstmt = con.prepareStatement("select * from PROJECT_review where num=? and boardid=?");
			pstmt.setInt(1, num);
			pstmt.setString(2, boardid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					article = new ReviewDTO();
					article.setNum(rs.getInt("num"));
					article.setName(rs.getString("name"));
					article.setPassword(rs.getString("password"));
					article.setTitle(rs.getString("title"));
					article.setContent(rs.getString("content"));
					article.setRank_point(rs.getInt("rank_point"));
					article.setRoom_name(rs.getString("room_name"));
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

	public int getRoomReviewCount(String room_name) { //후기가 총 몇개인지 셈
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		int x = 0;
		String sql = "";
		try {
			conn = getConnection();

			sql = "select nvl(count(*),0) from Project_review where room_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, room_name);
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

	public String showRankRoom(String room_name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		double tmp_rank = 0;
		double result_rank = 0;
		int rank_cnt = 0;

		String star = null;

		try {

			conn = getConnection();

			sql = "select nvl(count(*),0) from Project_review where room_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, room_name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rank_cnt = rs.getInt(1);
			}

			sql = "select rank_point from Project_review where room_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, room_name);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tmp_rank += rs.getDouble("rank_point");
			}
			result_rank = tmp_rank / rank_cnt;

			switch ((int) result_rank) {
			case 1:
				star = "★";
				break;
			case 2:
				star = "★★";
				break;
			case 3:
				star = "★★★";
				break;
			case 4:
				star = "★★★★";
				break;
			case 5:
				star = "★★★★★";
				break;
			default:
				star = "아직 평점이 없습니다";
				break;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.close(conn, pstmt, rs);
		}
		return star;
	}
}
