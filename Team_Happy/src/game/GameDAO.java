package game;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.Board;
import util.DBUtil;

public class GameDAO {
	private static Game instance = new Game();
	
	public static Game getInstance() {
		return instance;
	}

	public static ArrayList<Game> getAllContents() throws SQLException {
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Game> data = null;
		String sql = "select * from game";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			data = new ArrayList<Game>();
			while(rset.next()) {
				data.add(new Game(rset.getInt(1), rset.getString(2),
						rset.getInt(3), rset.getString(4)));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return data;
	}
	
}
