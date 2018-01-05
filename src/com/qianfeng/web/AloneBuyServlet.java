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
public class AloneBuyServlet extends HttpServlet {

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid=request.getParameter("uid");
		String pid=request.getParameter("pid");
		String num=request.getParameter("amount");
		int number=Integer.parseInt(num);
		HttpSession session=request.getSession();
		AdminProductService service=new AdminProductService();
		Product product=new Product();
				try {
					product=service.findProductById(pid);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		UserServiceServlet uService=new UserServiceServlet();
		User user=new User();
		try {
			user=uService.searchUser(uid);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(user!=null){//用户已登录，需要单买
			
			Map<Product,Integer> mapalone=new HashMap<>();
				mapalone.put(product, number);
				session.setAttribute("mapalone", mapalone);
				//并存入购物车
				/*Map<Product,Integer> map=(Map<Product, Integer>) session.getAttribute("map");
				if(map==null){
				map=new HashMap<>();
				map.put(product,number);
				}else{
				int newnumber=0;
				if(map.containsKey(product)){
					newnumber=number+map.get(product);
					map.put(product, newnumber);
				}else{
				map.put(product,number);
				}
				}
				session.setAttribute("map", map);*/
				response.sendRedirect(request.getContextPath()+"/orderdetailsalone.jsp");
		}else{
			Map<Product,Integer> map=new HashMap<>();
			map.put(product, number);
			session.setAttribute("map", map);
			request.setAttribute("message", "请登陆后再操作！");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}		
			
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}