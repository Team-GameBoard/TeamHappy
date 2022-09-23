package user;

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
public class User {
	private String user_id;
	private String user_password;
	private int user_age;
	private String user_grade;
	
	
	public User(String user_id, String user_password, int user_age) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_age = user_age;
	}
}
