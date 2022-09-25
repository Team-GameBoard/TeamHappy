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
public class User_game {
	private int user_num;
	private String user_id;
	private int game_num;
	private String user_game_grade;
}
