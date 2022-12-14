package board;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comment.Comment;
import comment.CommentDAO;
import game.GameDAO;
import user.User;
import user.UserDAO;


@WebServlet("/board")
public class BoardController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
//		HttpSession session1 = request.getSession();
//		session1.setAttribute("userId", "test");
//		System.out.println(session1.getAttribute("userId"));
		String command = request.getParameter("command");

		if (command == null) {
			command = "list";
		}

		if (command.equals("list")) {
			list(request, response);
		} else if (command.contentEquals("write")) {
			write(request, response);
		} else if (command.equals("read")) {
			read(request, response);
		} else if (command.equals("updateForm")) {
			updateForm(request, response);
		} else if (command.equals("update")) {
			update(request, response);
		} else if (command.equals("delete")) {
			delete(request, response);
		} else if (command.equals("mypage")) {
			mypage(request, response);
		} else if (command.equals("mypageUpdate")) {
			mypageUpdate(request, response);
		} else if (command.equals("search")) {
			search(request, response);
		}
	}
	
	private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "error.jsp";
		String keyword = request.getParameter("searchkey");
		String gameNum = request.getParameter("game_num");
		String selectWhere = request.getParameter("selectWhere");
		
		try {
			request.setAttribute("list", BoardDAO.searchContents(selectWhere, keyword, Integer.parseInt(gameNum)));
			request.setAttribute("game", GameDAO.getAllContents());
			url = "Gameboard.jsp";
			
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "?????? ?????? ?????? ??? ?????? ??? ?????????");
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	private void mypageUpdate(HttpServletRequest request, HttpServletResponse response) {
		
		String Pw = request.getParameter("Pw");
		String newPw = request.getParameter("newPw");
		String newAge = request.getParameter("newAge");
		
//		System.out.println("Pw : " + Pw + "newPw : " + newPw + "newAge : " + newAge);

//		System.out.println(isInt(newAge));
		
		User user = null;
		HttpSession session = null;
		
		try {
			session = request.getSession();
			String userId = (String) session.getAttribute("userId");
			user = UserDAO.userInfo(userId);

			if (user.getUserPassword().equals(Pw)) {
				if (isInt(newAge)) {
					UserDAO.updateMypage(new User(userId, newPw, Integer.parseInt(newAge)));
					mypage(request,response);
				} else {
					System.out.println("????????? ????????? ???????????????");
					mypage(request,response);
				}
			} else {
				System.out.println("?????? ???????????? ???????????? ??????!!");
				mypage(request,response);
			}
		} catch (NumberFormatException | SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public boolean isInt(String str) {
		
	  	try {
	      	@SuppressWarnings("unused")
	    	int x = Integer.parseInt(str);
	      	return true; //String is an Integer
		} catch (NumberFormatException e) {
	    	return false; //String is not an Integer
		}
	  	
	}

	private void mypage(HttpServletRequest request, HttpServletResponse response) {
		String count = request.getParameter("count");
		HttpSession session = null; 
		User user = null;
		String url = null;
		
		if("update".equals(count)) {
			url = "MypageUpdate.jsp";
		} else {
			url = "Mypage.jsp";
		}

		try {
			session = request.getSession();
			String userId = (String)session.getAttribute("userId");
			user = UserDAO.userInfo(userId);
			request.setAttribute("userInfo", user);
			request.getRequestDispatcher(url).forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String strNum = request.getParameter("num");
		String userId = request.getParameter("userId");
		String gameNum = request.getParameter("game_num");

		if (strNum == null || strNum.trim().length() == 0) {
			response.sendRedirect("board?game_num=" + gameNum);
			return;
		}
		boolean result = false;
		try {
			result = BoardDAO.deleteContent(Integer.parseInt(strNum), userId);
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "?????? ????????? ?????? ??????????????????.");
		}
		if (result) {
			response.sendRedirect("board?game_num=" + gameNum);
			return;
		} else {
			request.setAttribute("error", "??????????????? ???????????? ???????????? ????????????");
		}
		request.getRequestDispatcher("error.jsp").forward(request, response);
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strNum = request.getParameter("num");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String gameNum = request.getParameter("game_num");

		if (strNum == null || strNum.trim().length() == 0 || title == null || title.trim().length() == 0
				|| content == null || content.trim().length() == 0) {
			response.sendRedirect("board?game_num=" + gameNum);
			return;
		}

		boolean result = false;

		try {
			// ,userId
			result = BoardDAO.updateContent(new Board(Integer.parseInt(strNum), title, content));
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "????????? ?????? ??????");
		}
		if (result) {
			response.sendRedirect("board?game_num=" + gameNum);
			return;
		}
		request.setAttribute("error", "????????? ?????? ??????");
		request.getRequestDispatcher("error.jsp").forward(request, response);

	}

	private void updateForm(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String strNum = request.getParameter("num");

		if (strNum == null || strNum.trim().length() == 0) {
			response.sendRedirect("board");
			return;
		}
		String url = "error.jsp";
		Board gContent = null;
		try {
			gContent = BoardDAO.getContent(Integer.parseInt(strNum), false);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "??????????????? ?????? ????????? ?????? ??????????????????");
		}
		if (gContent == null) {
			request.setAttribute("error", "??????????????? ?????? ???????????? ???????????? ????????????");
		} else {
			request.setAttribute("resultContent", gContent);
			url = "Update.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	private void read(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String strNum = request.getParameter("num");
		if (strNum == null || strNum.length() == 0) {
			response.sendRedirect("board");
			return;
		}
		String url = "error.jsp";
		Board gContent = null;
		// comment ?????? arrayList ?????? ???????????? ?????? ??????
		ArrayList<Comment> commentList = null;
		
		try {
			gContent = BoardDAO.getContent(Integer.parseInt(strNum), true);
			// comment ?????? arrayList ??? ????????????
			commentList = CommentDAO.getAllcomment(Integer.parseInt(strNum));
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "????????? ?????? ??????");
		}
		if (gContent == null) {
			request.setAttribute("error", "?????? ???????????? ???????????? ????????????");
		} else {
			request.setAttribute("resultContent", gContent);
			// comList ?????? commentList ???  GameboardDetail.jsp ??? ?????? ????????????.
			request.setAttribute("comList", commentList);
			url = "GameboardDetail.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	private void write(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session1 = request.getSession();
		String userId = (String) session1.getAttribute("userId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String gameNum = request.getParameter("game_num");
//		String gameGrade = request.getParameter("tier");

		// ???????????? ?????? ????????? ????????? ??????
		if (userId == null || userId.trim().length() == 0 || title == null || title.trim().length() == 0
				|| content == null || content.trim().length() == 0) {
			response.sendRedirect("Write.jsp");
			return;// write() ????????? ??????
		}

		boolean result = false;

		try {
//			User_gameDAO.writeContent(new User_game(userId, Integer.parseInt(game_num), gameGrade));
			result = BoardDAO.writeContent(new Board(userId, title, content, Integer.parseInt(gameNum)));
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "????????? ?????? ?????? ?????? ??? ?????? ?????????");
		}

		if (result) {
			response.sendRedirect("board?game_num=" + gameNum);
		} else {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}

	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "error.jsp";
		String game_num = request.getParameter("game_num");

		try {
			request.setAttribute("list", BoardDAO.getAllContents(Integer.parseInt(game_num)));
			request.setAttribute("game", GameDAO.getAllContents());
			url = "Gameboard.jsp";
			
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "?????? ?????? ?????? ??? ?????? ??? ?????????");
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}