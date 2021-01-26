package com.doogwal.coffee.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logout.do")
public class Logout extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//세션 얻어서 비활성화
		req.getSession().invalidate();
		
		String referer = 
				req.getHeader("referer");
		
		resp.sendRedirect("/loginForm.jsp");
		
	}//doGet() end

	
	
}//Logout end
