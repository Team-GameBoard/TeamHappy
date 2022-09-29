package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/user")
public class UserController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 커맨드 패턴
		String command = request.getParameter("command");

		if (command == null) {
			command = "user";
		} else if (command.equals("signUp")) {
			signUp(request, response); // 회원가입
		} else if (command.equals("login")) {
			login(request, response); // 로그인
		} else if (command.equals("idCheck")) {
			idCheck(request, response);
		}
	}

	private boolean idCheck(HttpServletRequest request, HttpServletResponse response) {
		// 아이디 중복값 확인
		String user_id = request.getParameter("user_id");
//		System.out.println(user_id);
//		System.out.println("id 체크 입니다.");
		boolean result = false;
		response.setHeader("allow-control-allow-origin", "*");
//		request.setAttribute("user_id", user_id);

		try {
			result = UserDAO.confimId(user_id);
			response.addHeader("result", String.valueOf(result));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(result);
		return result;
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 로그인
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

//		System.out.println("id : " + id);
//		System.out.println("pw : " + pw);

		request.setAttribute("id", id);
		request.setAttribute("pw", pw);

		User user = new User(id, pw);
		User userLogin = new User();
		
		HttpSession session = null;
//		HttpSession session = request.getSession();
		
		try {
			userLogin = UserDAO.Login(user);
			if (userLogin != null) {
				session = request.getSession();
				session.setAttribute("userId", userLogin.getUserId());
				request.getRequestDispatcher("game").forward(request, response);
			} else {
				response.sendRedirect("NewLogin.jsp");
				return;
//				   request.getRequestDispatcher("Login.jsp").forward(request, response);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private void signUp(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 회원가입
		String user_id = request.getParameter("user_id");
		String user_password = request.getParameter("user_password");
		int user_age = Integer.parseInt(request.getParameter("user_age"));

//		System.out.println("user_id : " + user_id);
//		System.out.println("user_password : " + user_password);
//		System.out.println("user_age : " + user_age);

		try {
			UserDAO.writeUser(new User(user_id, user_password, user_age));
			response.sendRedirect("NewLogin.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}

}
