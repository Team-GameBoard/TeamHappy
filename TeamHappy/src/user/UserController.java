package user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/user")
public class UserController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		User.builder().user_age(11).build();
		
		//		try {
//			UserDAO.writeUser(new User("asdasd123", "asdasd123", 5));
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
	
	}

}
