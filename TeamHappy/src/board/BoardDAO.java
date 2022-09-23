package board;

import user.User;

public class BoardDAO {
	private static Board instance = new Board();
	
	public static Board getInstance() {
		return instance;
	}
	
}