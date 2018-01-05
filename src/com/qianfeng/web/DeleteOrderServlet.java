package com.qianfeng.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qianfeng.domain.Orderdetails;
import com.qianfeng.domain.Product;
import com.qianfeng.service.AdminProductService;
import com.qianfeng.service.O_p_conService;
import com.qianfeng.service.OrderdetailsService;
import com.qianfeng.service.ShoppingCarService;

public class DeleteOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] checkones=request.getParameterValues("checkone");
		//用户有勾选订单安删除键
		if(checkones!=null){
			HttpSession session=request.getSession();
			List<Orderdetails> orderdetailsListcar=(List<Orderdetails>) session.getAttribute("orderdetailsList");
			OrderdetailsService service=new OrderdetailsService();
			Orderdetails orderdetails=new Orderdetails();
			OrderdetailsService deleteService =new OrderdetailsService();
			O_p_conService dleteServiceop=new O_p_conService();
			//个人中心有订单供删除的话
			if(orderdetailsListcar!=null){
				for (String oid : checkones) {
					try {
					orderdetails=service.findOrderdetailsById(oid);
					//从数据库中删除被选中的订单oid数据
					deleteService.deleteOrderdetails(oid);
					dleteServiceop.deleteO_p_con(oid);	
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					//if(orderdetailsList.contains(orderdetails)){
					//每筛选出一个订单就从session域中 的订单列表中除去
					//	orderdetailsList.remove(orderdetails);
					//}
				}
				//session.setAttribute("orderdetailsList", orderdetailsList);
				//request.getRequestDispatcher("/manyOrderByUserServlet").forward(request, response);
				//response.sendRedirect(request.getContextPath()+"/UserCenter.jsp");
			
				String uno = request.getParameter("username");
				OrderdetailsService servicebyname=new OrderdetailsService();
				List<Orderdetails> orderdetailsList=new ArrayList<>();
				try {
					orderdetailsList=servicebyname.getOrderdetails(uno);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				session.setAttribute("orderdetailsList", orderdetailsList);
				request.getRequestDispatcher("/UserCenter.jsp").forward(request, response);
			
			
			
			}
		}else{
			//用户未勾选订单按删除键待在原页
			response.sendRedirect(request.getContextPath()+"/UserCenter.jsp");
		}
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}