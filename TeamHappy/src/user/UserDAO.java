package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.DBUtil;

public class UserDAO {
	// 게시물 등록
	// Query
	// VO Value Object(set메소드가 없는 객체, 읽기 전용)
	public static boolean writeUser(User user) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result = false;

		System.out.println(user);

		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into user (user_id, user_password, user_age) values (?,?,?)");

			pstmt.setString(1, user.getUser_id());
			pstmt.setString(2, user.getUser_password());
			pstmt.setInt(3, user.getUser_age());

			int count = pstmt.executeUpdate();

			if (count != 0) {
				result = true;
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return result;
	}
}
