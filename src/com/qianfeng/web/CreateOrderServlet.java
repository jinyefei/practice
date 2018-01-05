package com.qianfeng.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qianfeng.domain.Product;
import com.qianfeng.domain.User;
import com.qianfeng.service.AdminProductService;
import com.qianfeng.service.UserServiceServlet;

@SuppressWarnings("serial")
public class CreateOrderServlet extends HttpServlet {

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid=request.getParameter("uid");
		UserServiceServlet uService=new UserServiceServlet();
		User user=new User();
		try {
			user=uService.searchUser(uid);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(user!=null){
		String[] checkones=request.getParameterValues("checkone");
		HttpSession session=request.getSession();
		Map<Product,Integer> map=(Map<Product, Integer>) session.getAttribute("map");
		Map<Product,Integer> mapnew=new HashMap<>();
		if(checkones!=null){
			AdminProductService service=new AdminProductService();
			Product product=new Product();
				for (String pid : checkones) {
					try {
						product=service.findProductById(pid);
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					mapnew.put(product, map.get(product));	
				}
				}else{
					mapnew=map;
			}
		session.setAttribute("mapnew", mapnew);
		response.sendRedirect(request.getContextPath()+"/orderdetails.jsp");
		}else{
			request.setAttribute("message", "请登陆后再操作！");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}