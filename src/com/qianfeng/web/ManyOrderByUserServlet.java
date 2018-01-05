package com.qianfeng.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qianfeng.domain.Orderdetails;
import com.qianfeng.service.OrderdetailsService;

public class ManyOrderByUserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String uno = request.getParameter("username");
				OrderdetailsService service=new OrderdetailsService();
				List<Orderdetails> orderdetailsList=new ArrayList<>();
				try {
					orderdetailsList=service.getOrderdetails(uno);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				HttpSession session = request.getSession();
				session.setAttribute("orderdetailsList", orderdetailsList);
				request.getRequestDispatcher("/UserCenter.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}