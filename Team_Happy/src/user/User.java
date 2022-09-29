package user;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class User {
	private String userId;
	private String userPassword;
	private int userAge;
	private String userGrade;
	
	
	// 회원가입
	public User(String userId, String userPassword, int userAge) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.userAge = userAge;
	}

	// 로그인
	public User(String userId, String userPassword) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
	}
	
	// ID 중복값 확인
	public User(String userId) {
		super();
		this.userId = userId;
	}
}
