package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import user.User;
import util.DBUtil;

public class BoardDAO {
private static Board instance = new Board();
	
	public static Board getInstance() {
		return instance;
	}
	
	public static ArrayList<Board> getAllContents(int gameNum) throws SQLException{
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> data = null;
		String sql = "select * from board where game_num = ?";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, gameNum);
			rset = pstmt.executeQuery();
			data = new ArrayList<Board>();
			while(rset.next()) {
				data.add(new Board(rset.getInt(1), rset.getString(2),
						rset.getInt(3), rset.getString(4), rset.getString(5),
						rset.getTimestamp(6), rset.getTimestamp(7), rset.getInt(8)));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return data;
		
	}
	
	public static boolean writeContent(Board vo) throws SQLException{
		Connection con = null;	
		PreparedStatement pstmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into board (user_id, board_title, board_content, game_num) values (?, ?, ?, ?)");
			pstmt.setString(1, vo.getUserId());
	        pstmt.setString(2, vo.getBoardTitle());
	        pstmt.setString(3, vo.getBoardContent());
	        pstmt.setInt(4, vo.getGameNum());
	        
			int count = pstmt.executeUpdate();
			
			if(count != 0){
				result = true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return result;		
	}

	public static Board getContent(int num, boolean flag) throws SQLException{
		
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board vo  = null;
		String sql1="update board set board_readnum = board_readnum+1 where board_num =?";
		String sql2="select * from board where board_num =?";
			

		try {
			con = DBUtil.getConnection();
			if(flag){
				pstmt = con.prepareStatement(sql1);
				pstmt.setInt(1, num);
				int count = pstmt.executeUpdate();
				if(count == 0){
					return vo;
				}
			}
			
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, num);	
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				vo = new Board(num,rset.getString(2),
						rset.getInt(3),rset.getString(4),rset.getString(5).replaceAll("</n>","<br>"),
						rset.getTimestamp(6),rset.getTimestamp(7), rset.getInt(8));
			}
			
		}finally{
			DBUtil.close(con, pstmt);
		}
		return vo;
	}

	public static boolean updateContent(Board vo) throws SQLException {
		Connection con = null;	
		PreparedStatement pstmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();
		
			pstmt = con.prepareStatement("update board set board_title=?,board_content=? where board_num=?");
			pstmt.setString(1,vo.getBoardTitle());
		    pstmt.setString(2,vo.getBoardContent());
		    pstmt.setInt(3, vo.getBoardNum());

			int count = pstmt.executeUpdate();
			
			if(count != 0){
				result = true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return result;
	}

	public static boolean deleteContent(int num, String userId) throws SQLException {
		Connection con = null;	
		PreparedStatement pstmt = null;
		boolean result = false;
		
		String sql="delete from board where board_num=?";
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1,num);

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