package com.qianfeng.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qianfeng.domain.Product;
import com.qianfeng.service.AdminProductService;
import com.qianfeng.service.ShoppingCarService;

@SuppressWarnings("serial")
public class DeleteAllCarProductServlet extends HttpServlet {

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] checkones=request.getParameterValues("checkone");
		String uid=request.getParameter("uid");
		if(checkones!=null){
			HttpSession session=request.getSession();
			Map<Product,Integer> map=(Map<Product, Integer>) session.getAttribute("map");
			AdminProductService service=new AdminProductService();
			Product product=new Product();
			ShoppingCarService deleteService =new ShoppingCarService();
			if(map!=null){
				for (String pid : checkones) {
					try {
					product=service.findProductById(pid);
				deleteService.deleteOrderProducts(uid,pid);
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					if(map.containsKey(product)){
						map.remove(product);
					}
				}
				session.setAttribute("map", map);
				request.getRequestDispatcher("/addShoppingCarServlet").forward(request, response);
	
			}
		}else{
			response.sendRedirect(request.getContextPath()+"/ShoppingCar.jsp");
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}