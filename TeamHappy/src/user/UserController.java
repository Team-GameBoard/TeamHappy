package user;

import java.io.IOException;
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
	   
	   if(command == null) {
		   command = "user";
	   }else if(command.equals("usercr")){
		   // 회원가입
		   String user_id = request.getParameter("user_id");
		   String user_password = request.getParameter("user_password");
		   int user_age = Integer.parseInt(request.getParameter("user_age"));
		   
		   System.out.println("user_id : " + user_id);
		   System.out.println("user_password : " + user_password);
		   System.out.println("user_age : " + user_age);
		   
		   try {
			   UserDAO.writeUser(new User(user_id,user_password,user_age));
		   } catch (SQLException e) {
			   e.printStackTrace();
		   }
	   }else if(command.equals("userlogin")) {
		   // 로그인
		   String id = request.getParameter("id");
		   String pw = request.getParameter("pw");
		   
		   System.out.println("id : " +id);
		   System.out.println("pw : " +pw);
		   
		   request.setAttribute("id", id);
		   request.setAttribute("pw", pw);
		   
		   User user = new User(id,pw);
		   User userLogin = new User();
		   try {
			   userLogin = UserDAO.Login(user);
			   HttpSession session = request.getSession();
			   if(userLogin != null) {
				   session.setAttribute("id", userLogin.getUser_id());
				   session.setAttribute(pw, userLogin.getUser_password());
				   request.getRequestDispatcher("Logintest.jsp").forward(request, response);
			   }else {
//				   response.sendRedirect("Login.jsp");
				   request.getRequestDispatcher("Login.jsp").forward(request, response);
			   }
			   
		   }catch (Exception e) {
			// TODO: handle exception
			   e.printStackTrace();
		}
		   
		  
	   }
      
	   
	   
	   
   }

}