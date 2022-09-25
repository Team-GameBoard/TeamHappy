package game;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.DBUtil;

public class GameDAO {
	private static Game instance = new Game();
	
	public static Game getInstance() {
		return instance;
	}
	
}
