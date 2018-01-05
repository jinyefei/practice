package com.qianfeng.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class QuitLoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie cookie_username=new Cookie("username","");
		Cookie cookie_password=new Cookie("password","");
		cookie_username.setMaxAge(0);
		cookie_password.setMaxAge(0);
		cookie_username.setPath("/");
		cookie_password.setPath("/");
		response.addCookie(cookie_username);
		response.addCookie(cookie_password);
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("map");
		session.removeAttribute("orderdetailsList");
		session.removeAttribute("mapDescription");
		response.sendRedirect(request.getContextPath()+"/showAllProductServlet");

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}