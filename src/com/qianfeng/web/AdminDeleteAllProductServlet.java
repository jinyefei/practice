package com.qianfeng.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qianfeng.service.AdminProductService;

@SuppressWarnings("serial")
public class AdminDeleteAllProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String[] checkones=request.getParameterValues("checkone");
			if(checkones!=null){
			AdminProductService service=new AdminProductService();
			try {
				service.deleteProductByPid(checkones);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
			response.sendRedirect(request.getContextPath()+"/adminProductListServlet");
			
			}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}