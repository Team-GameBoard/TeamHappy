package ranking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.Board;
import util.DBUtil;

public class RankingDAO {
	
	public static ArrayList<Ranking> getRankingBoard() throws SQLException{
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Ranking> data = null;
		String sql = "select a.user_id, count(a.user_id) from board b , user a where  a.user_id = b.user_id group by a.user_id order by count(a.user_id) desc limit 0,3";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			data = new ArrayList<Ranking>();
			while(rset.next()) {
				data.add(new Ranking(rset.getString(1),rset.getString(2)));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return data;
		
	}
	
	public static ArrayList<Ranking> getRankingComment() throws SQLException{
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Ranking> data = null;
		String sql = "select a.user_id, count(a.user_id) from comment b , user a where  a.user_id = b.user_id group by a.user_id order by count(a.user_id) desc limit 0,3";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			data = new ArrayList<Ranking>();
			while(rset.next()) {
				data.add(new Ranking(rset.getString(1),rset.getString(2)));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return data;
		
	}
	
}
