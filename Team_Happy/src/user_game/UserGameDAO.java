package user_game;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.DBUtil;

public class UserGameDAO {

	public static boolean writeContent(UserGame vo) throws SQLException {
		Connection con = null;	
		PreparedStatement pstmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into user_game (user_id, game_num, user_game_grade) values (?, ?, ?)");

			pstmt.setString(1, vo.getUserId());
	        pstmt.setInt(2, vo.getGameNum());
	        pstmt.setString(3, vo.getUserGameGrade());
	     	        
			int count = pstmt.executeUpdate();
			
			if(count != 0){
				result = true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return result;		
	}

}
