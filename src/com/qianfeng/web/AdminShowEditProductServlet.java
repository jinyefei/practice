package com.qianfeng.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qianfeng.domain.Category;
import com.qianfeng.domain.Product;
import com.qianfeng.service.AdminCategoryService;
import com.qianfeng.service.AdminProductService;

@SuppressWarnings("serial")
public class AdminShowEditProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String pid=request.getParameter("pid");
			AdminProductService service=new AdminProductService();
			Product product=null;
			try {
				product=service.findProductById(pid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			AdminCategoryService service2=new AdminCategoryService();
			List<Category> categoryList = null;
			try {
				categoryList=service2.findAllCategory();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("product", product);
			request.setAttribute("categoryList", categoryList);
			request.getRequestDispatcher("/admin/editProduct.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}