package com.qianfeng.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qianfeng.domain.O_p_con;
import com.qianfeng.domain.Product;
import com.qianfeng.service.AdminProductService;
import com.qianfeng.service.O_p_conService;

public class ManyProductByOidServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String oid = request.getParameter("oid");
			Map<Product, Integer> mapDescription= new HashMap<>();
			List<O_p_con> o_p_conList=new ArrayList<>();
			O_p_conService findService=new O_p_conService();
			try {
				o_p_conList=findService.findo_p_conListByOid(oid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String pid=null;
		    int amount=0;
		    Product product=new Product();
		    AdminProductService service=new AdminProductService();
			for (O_p_con o_p_con : o_p_conList) {
				pid=o_p_con.getPid();
				amount=o_p_con.getAmount();
				try {
					product=service.findProductById(pid);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				mapDescription.put(product, amount);
			}
			HttpSession session = request.getSession();
			session.setAttribute("mapDescription", mapDescription);
			request.getRequestDispatcher("/orderDescription.jsp").forward(request, response);
						
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}