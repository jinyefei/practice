package com.qianfeng.web;

import java.io.IOException;

import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.qianfeng.domain.Category;

import com.qianfeng.service.AdminCategoryService;

@SuppressWarnings("serial")
public class AdminAddCategoryServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//request.setCharacterEncoding("utf-8");
			String cname=request.getParameter("cname");
			Category category=new Category();
			category.setCname(cname);
			//手动封装剩余的属性
			category.setCid(UUID.randomUUID().toString());
			//传递给service层
			AdminCategoryService service=new AdminCategoryService();
			try {
				service.addCategory(category);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath()+"/adminCategoryListServlet");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}