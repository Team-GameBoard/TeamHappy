package game;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/game")
public class GameController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		list(request, response);
	}
	
	
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "error.jsp";

		try {
			request.setAttribute("list", GameDAO.getAllContents());
			url = "test.jsp";
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "모두 보기 실패 재 실행 해 주세요");
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
}


