package com.qianfeng.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qianfeng.domain.Product;
import com.qianfeng.service.AdminProductService;

@SuppressWarnings("serial")
public class AdminUpdateProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid=request.getParameter("pid");
		double market_price=Double.valueOf(request.getParameter("market_price"));
		double shop_price=Double.valueOf(request.getParameter("shop_price"));
		String pdesc=request.getParameter("pdesc");
		int is_hot=Integer.valueOf(request.getParameter("is_hot"));
		AdminProductService service=new AdminProductService();
		Product product=new Product();
		try {
			product=service.findProductById(pid);
			service.deleteProductByPidone(pid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		product.setMarket_price(market_price);
		product.setShop_price(shop_price);
		product.setPdesc(pdesc);
		product.setIs_hot(is_hot);
		//传递给service层
		AdminProductService service2=new AdminProductService();
		try {
			service2.addProduct(product);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath()+"/adminProductListServlet");

				
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}