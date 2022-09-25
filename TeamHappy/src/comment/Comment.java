package comment;

import java.sql.Timestamp;

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
public class Comment {
	private int comment_num;
	private int board_num;
	private String user_id;
	private String comment_board;
	private Timestamp comment_created_date;
}
