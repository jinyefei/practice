package com.qianfeng.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qianfeng.domain.Product;
import com.qianfeng.domain.vo.PageBean;
import com.qianfeng.service.AdminProductService;

@SuppressWarnings("serial")
public class ShowAllProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 要想实现分页的功能，就必须获得这五项数据:这五项数据将被封装进pagebaen对象中，在各层间传递
		 * 当前页	   currentPage 该数据从客户端获得 //1表示第一页
		 * 每页显示的条数    currentCount  该数据也从客户端获得  目前我们在这写死  12条
		 * 数据总条数	totalCount
		 * 总页数		totalPage
		 * 当前页上的数据     PageData 
		 *   
		 */
		//request.setCharacterEncoding("utf-8");
		String currentPage=request.getParameter("currentPage");
		int currentPageInt=1;
		if(currentPage!=null&&!"".equals(currentPage)){
			currentPageInt=Integer.parseInt(request.getParameter("currentPage"));
		}
		int currentCount=16;
		AdminProductService service=new AdminProductService();
		PageBean<Product> pageBean=null;
		try {
			pageBean=service.findProductsByPageBean(currentPageInt,currentCount);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("pageBean", pageBean);
		request.getRequestDispatcher("/newhomepage.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}