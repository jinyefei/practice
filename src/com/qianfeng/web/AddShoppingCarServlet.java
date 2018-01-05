package com.qianfeng.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.qianfeng.domain.Product;
import com.qianfeng.domain.ShoppingCar;
import com.qianfeng.domain.User;
import com.qianfeng.service.AdminProductService;
import com.qianfeng.service.ShoppingCarService;
import com.qianfeng.service.UserServiceServlet;


public class AddShoppingCarServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String pid = request.getParameter("pid");
			String uid = request.getParameter("uid");
			String num=request.getParameter("amount");
			HttpSession session=request.getSession();
			UserServiceServlet serviceloginornot=new UserServiceServlet();
			User user=new User();
			try {
				user=serviceloginornot.searchUser(uid);
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			//如果用户未登录
			if(user==null&&pid!=null){
			Map<Product,Integer> map=(Map<Product, Integer>) session.getAttribute("map");	
			int amount=0;
			if(num!=null&&!"".equals(num)){
				amount=Integer.parseInt(num);
			}
			Product product=new Product();
			AdminProductService service=new AdminProductService();
			try {
				product=service.findProductById(pid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}				
			if(map==null){
				map=new HashMap<>(); 
				map.put(product, amount);
			}else{
				if(map.containsKey(product)){	
					map.put(product, amount+map.get(product));
				}
				map.put(product, amount);
			}
				session.setAttribute("map", map);
			}
			
			if(user!=null&&pid!=null){//如果用户已登录
			Map<Product,Integer> map=new HashMap<>();
			Product product=new Product();
			AdminProductService service=new AdminProductService();
			//如果用户登录将商品加入购物车
			if(pid!=null&num!=null){
			int amount=Integer.parseInt(num);
			ShoppingCar shoppingCar=new ShoppingCar();
			ShoppingCarService judge=new ShoppingCarService();
			try {
				shoppingCar=judge.getShoppingCarUPN(uid,pid);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			if(shoppingCar==null){//若数据库中此用户此商品不存在，新建
				ShoppingCar shoppingCarnew=new ShoppingCar();
				shoppingCarnew.setUid(uid);
				shoppingCarnew.setPid(pid);
				shoppingCarnew.setAmount(amount);
				
				ShoppingCarService serviceCar=new ShoppingCarService();
				try {
					serviceCar.addShoppingCar(shoppingCarnew);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}else{//若数据库中此用户此商品存在，数量更新
				amount=amount+shoppingCar.getAmount();
			
			ShoppingCarService serviceCar=new ShoppingCarService();
				try {
					serviceCar.updateShoppingCar(uid,pid,amount);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			}
			//如果用户未加入新的商品只查看购物车
			//根据uid取出数据库中这个id下所有的商品pid以及对应的数量amount
			ShoppingCarService serviceGet=new ShoppingCarService();
			List<ShoppingCar> carlist=new ArrayList<>();
			try {
				carlist=serviceGet.getCarFromDB(uid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			for (ShoppingCar sc : carlist) {
				try {
					product=service.findProductById(sc.getPid());
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				map.put(product, sc.getAmount());
			}
			session.setAttribute("map", map);
			}
			response.sendRedirect(request.getContextPath()+"/ShoppingCar.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
