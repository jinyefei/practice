package com.qianfeng.web;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.jasper.tagplugins.jstl.core.Remove;

import com.qianfeng.domain.O_p_con;
import com.qianfeng.domain.Orderdetails;
import com.qianfeng.domain.Product;
import com.qianfeng.domain.ShoppingCar;
import com.qianfeng.service.O_p_conService;
import com.qianfeng.service.OrderdetailsService;
import com.qianfeng.service.ShoppingCarService;

@SuppressWarnings("serial")
public class PayAndCreateOrderDetailsServlet extends HttpServlet {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Map<Product,Integer> mapOrder=(Map<Product, Integer>) session.getAttribute(request.getParameter("map").toString());
		Orderdetails orderdetails=new Orderdetails(); 
		O_p_con opcon=new O_p_con();
		Map map1=request.getParameterMap();
		try {
			BeanUtils.populate(orderdetails, map1);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//手动封装剩余的属性
		orderdetails.setOid(UUID.randomUUID().toString());
		Date date=new Date();
		orderdetails.setOrdertime(date);
		orderdetails.setState("未支付");
		//opcon手动封装属性
		Set<Product> products=mapOrder.keySet();
		for (Product product : products) {
			opcon.setOid(orderdetails.getOid());
			opcon.setPid(product.getPid());
			int amount=mapOrder.get(product);
			opcon.setAmount(amount);
			//传递给service层
			O_p_conService service=new O_p_conService();
			try {
				service.addO_p_con(opcon);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		//传递给service层
		OrderdetailsService service=new OrderdetailsService();
		try {
			service.addOrderdetails(orderdetails);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//从数据库购物车中除去生成订单的商品maporder
		ShoppingCarService deleteService =new ShoppingCarService();
		String uid=request.getParameter("uid");
		for (Product product : products) {
			try {
				deleteService.deleteOrderProducts(uid,product.getPid());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//request.getRequestDispatcher("/PayAndBack.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/PayAndBack.jsp");
}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}









