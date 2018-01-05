package com.qianfeng.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.qianfeng.domain.Product;
import com.qianfeng.service.SearchService;

public class SearchServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String word = request.getParameter("word");
		SearchService service = new SearchService();
		List<Product> sproductList = null;
		try {
			sproductList = service.findProductListBySearch(word);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//发送给前端：  前端要的是json格式的数据
		Gson gson = new Gson();
		String json = gson.toJson(sproductList);
		System.out.println(json);
		if(json!=null){
			response.getWriter().write(json);
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}