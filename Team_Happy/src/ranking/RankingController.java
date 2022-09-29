package ranking;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/rank")
public class RankingController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "error.jsp";
		
		try {
			request.setAttribute("board", RankingDAO.getRankingBoard());
			request.setAttribute("comment", RankingDAO.getRankingComment());
			System.out.println(request.getAttribute("board"));
			System.out.println(request.getAttribute("comment"));
			url = "Ranking.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "모두 보기 실패 재 실행 해 주세요");
		}
		request.getRequestDispatcher(url).forward(request, response);
	
	}
}
