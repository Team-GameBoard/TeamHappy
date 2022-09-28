package board;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Board {
	private int boardNum;
	private String userId;
	private int gameNum;
	private String boardTitle;
	private String boardContent;
	private Timestamp boardCreatedDate;
	private Timestamp boardUpdateDate;
	private int readNum;
	
	public Board(String userId, String boardTitle, String boardContent) {
		this.userId = userId;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
	}
	
	public Board(String userId, String boardTitle, String boardContent, int gameNum) {
		this.userId = userId;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.gameNum = gameNum;
	}

	public Board(int boardNum, String boardTitle, String boardContent) {
		this.boardNum = boardNum;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
	}
	
}
