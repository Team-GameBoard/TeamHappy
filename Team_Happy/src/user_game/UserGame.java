package user_game;

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
public class UserGame {
	private int userNum;
	private String userId;
	private int gameNum;
	private String userGameGrade;
	
	public UserGame(String userId, int gameNum, String userGameGrade) {
		this.userId = userId;
		this.gameNum = gameNum;
		this.userGameGrade = userGameGrade;
	}
}
