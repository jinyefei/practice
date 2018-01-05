package com.qianfeng.web;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;

import com.qianfeng.domain.Product;
import com.qianfeng.domain.ShoppingCar;
import com.qianfeng.domain.User;
import com.qianfeng.service.AdminProductService;
import com.qianfeng.service.ShoppingCarService;
import com.qianfeng.utils.C3P0Utils;

@SuppressWarnings("serial")
public class RegisterServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//request.setCharacterEncoding("utf-8");
			User user=new User();
			@SuppressWarnings("rawtypes")
			Map map1=request.getParameterMap();
			String year=request.getParameter("year");
			String month=request.getParameter("month");
			String day=request.getParameter("day");
			String str=""+year+"-"+month+"-"+day;
			Date date = new  Date() ;
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			try {
				date = dateFormat.parse(str);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				BeanUtils.populate(user, map1);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			QueryRunner qr= new QueryRunner(C3P0Utils.getDataSource());
			String sql="insert into user(uid,username,password,name,email,telephone,birthday,sex) values(?,?,?,?,?,?,?,?)";
			user.setUid(UUID.randomUUID().toString());
			try {
				qr.update(sql,user.getUid(),user.getUsername(),user.getPassword(),user.getName(),user.getEmail(),user.getTelephone(),date,user.getSex());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}