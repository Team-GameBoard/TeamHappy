package filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.Objects;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter(filterName="/LoginFilter", urlPatterns="*")
public class LoginFilter implements Filter {
	String[] whiteList;
    
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(false);
//		System.out.println(req.getServletPath());
//		System.out.println(Arrays.asList(whiteList).contains(req.getServletPath()));
//		System.out.println(Objects.isNull(session.getAttribute("userId")));
//		System.out.println(Objects.isNull(session));
		System.out.println(!Arrays.asList(whiteList).contains(req.getServletPath()) && Objects.isNull(session.getAttribute("userId")));
		
		if(!Arrays.asList(whiteList).contains(req.getServletPath()) && Objects.isNull(session.getAttribute("userId"))) {
			req.getRequestDispatcher("/NewLogin.jsp").forward(request, response);
//			res.sendRedirect("/NewLogin.jsp");
		}
		
//		System.out.println(req.getServletPath().equals(whiteList));
		
//		for(String i : whiteList) {
//			System.out.println(i + "\n");
//		}

		chain.doFilter(request, response);
	}


	public void init(FilterConfig fConfig) throws ServletException {
		whiteList = new String[]{"/test.jsp" , "/NewLogin.jsp", "/NewSignUp.jsp", "/user", "/game"};
	}
}
