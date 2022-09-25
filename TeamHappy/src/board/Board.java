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
	private int board_num;
	private String user_id;
	private int game_num;
	private String board_title;
	private String board_context;
	private Timestamp board_created_date;
	private Timestamp board_update_date;
}
