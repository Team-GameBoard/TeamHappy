package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBUtil;

public class UserDAO {
	// 아이디 중복값 확인
	public static boolean confimId(String userId) throws SQLException {
		boolean result = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select user_id from user where user_id =?");
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				if (rset.getString(1).equals(userId)) {
					System.out.println("아이디 생성 불가능");
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		System.out.println("아이디 생성가능");
		return result;
	}

//		public static void Loginck(User user) {
//			   Connection con = null;
//			   PreparedStatement pstmt = null;
//			   ResultSet rset = null;
//			   
//			   try {
//				   con = DBUtil.getConnection();
//			       pstmt = con.prepareStatement("select user_id from user where user_id =?");
//			       
//			       pstmt.setString(1, user.getUser_id());
//			       rset = pstmt.executeQuery();
//			       if(rset.next()) {
//			    	if(rset.getNString(1).equals(user.getUser_id())){
//			    		System.out.println("중복된 아이디 값");
//			    	} 
//			      }else {
//			    	  System.out.println("아이디 생성 가능");
//			      }
//			   } catch (SQLException e) {
//				e.printStackTrace();
//			}finally {
//				   DBUtil.close(con, pstmt, rset);
//			}
//			   
//		   }

	// 회원가입 등록
	// Query
	public static boolean writeUser(User user) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		boolean result = false;

		System.out.println(user);

		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into user (user_id, user_password, user_age) values (?,?,?)");

			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setInt(3, user.getUserAge());

			int count = pstmt.executeUpdate();

			if (count != 0) {
				result = true;
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return result;
	}

	// 로그인 로직
	public static User Login(User user) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from user where user_id=? and user_password=?");

			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPassword());
			rset = pstmt.executeQuery();
			if (rset.next()) {
				if (rset.getString(2).equals(user.getUserPassword())) {
					System.out.println("로그인 성공");
					return user;
				}
			} else {
				System.out.println("로그인 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return null;

	}
}
