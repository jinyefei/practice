package com.qianfeng.web;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
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

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		User user=null;
		//1.获得表单数据
		//request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String autoLogin=request.getParameter("autoLogin");
		UserServiceServlet service=new UserServiceServlet();
			try {
				user=service.getLoginUser(username,password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if(user!=null){
			if(autoLogin!=null&&!"".equals(autoLogin)){
				String username_enc = URLEncoder.encode(user.getUsername(), "utf-8");
				Cookie cookie_username=new Cookie("username",username_enc);
				Cookie cookie_password=new Cookie("password",user.getPassword());
				cookie_username.setMaxAge(60*60*24*7);
				cookie_password.setMaxAge(60*60*24*7);
				cookie_username.setPath("/");
				cookie_password.setPath("/");
				response.addCookie(cookie_username);
				response.addCookie(cookie_password);
			}
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
			
			//提取session中的购物车数据存入该user对象对应购物车数据库
			Map<Product, Integer> map=(Map<Product, Integer>) session.getAttribute("map");
			if(map==null){
				map=new HashMap<>();
			}
			Set<Product> products=map.keySet();
			//查看此用户在数据库中有无购物车内容
			ShoppingCarService service2=new ShoppingCarService();
			List<ShoppingCar> carlist=new ArrayList<>();
			try {
				carlist=service2.getCarFromDB(user.getUid());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ShoppingCar shoppingCar=new ShoppingCar();
			ShoppingCarService service4=new ShoppingCarService();
			if(carlist==null){//此用户之前没有DB购物车数据时
				
				//将session中的购物车内容存入数据库
				for (Product product : products) {
					shoppingCar.setUid(user.getUid());
					shoppingCar.setPid(product.getPid());
					shoppingCar.setAmount(map.get(product));
					try {
						service4.addShoppingCar(shoppingCar);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			}else{//此用户之前有DB购物车数据时
			//将list集合转化为map集合
			Map<Product, Integer> mapDB=new HashMap<>();
			Product product=new Product();
			AdminProductService service3=new AdminProductService();
			for (ShoppingCar sc : carlist) {
				try {
					product=service3.findProductById(sc.getPid());
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				mapDB.put(product, sc.getAmount());
			}
			String uid=user.getUid();
			String pid=null;
			int amount=0;
			ShoppingCarService serviceCar=new ShoppingCarService();
			for (Product product2 : products) {
				if(mapDB.containsKey(product2)){
					pid=product2.getPid();
					amount=map.get(product2)+mapDB.get(product2);
					try {
						serviceCar.updateShoppingCar(uid,pid,amount);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else{
					shoppingCar.setUid(uid);
					shoppingCar.setPid(product2.getPid());
					shoppingCar.setAmount(map.get(product2));
					try {
						service4.addShoppingCar(shoppingCar);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
			response.sendRedirect(request.getContextPath()+"/showAllProductServlet");
		}else{
			request.setAttribute("message", "用户名或密码错误！");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}