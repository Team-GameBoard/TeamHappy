package game;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Game {
	private int gameNum;
	private String gameName;
	private int gameAge;
	private String gameGenre;
	
}
