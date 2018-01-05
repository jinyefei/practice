package com.qianfeng.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.qianfeng.dao.ShoppingCarDao;
import com.qianfeng.domain.Product;
import com.qianfeng.domain.ShoppingCar;

public class ShoppingCarService {

	public void addShoppingCar(ShoppingCar shoppingCar) throws SQLException {
		ShoppingCarDao dao=new ShoppingCarDao();
		dao.addShoppingCar(shoppingCar);
	}


	public ShoppingCar getShoppingCarUPN(String uid, String pid) throws SQLException {
		ShoppingCarDao dao=new ShoppingCarDao();
		return dao.getShoppingCarUPN(uid,pid);
	}

	public void updateShoppingCar(String uid, String pid, int amount) throws SQLException {
		ShoppingCarDao dao=new ShoppingCarDao();
		dao.updateShoppingCar(uid,pid,amount);
	}


	public List<ShoppingCar> getCarFromDB(String uid) throws SQLException {
		ShoppingCarDao dao=new ShoppingCarDao();
		return dao.getCarFromDB(uid);
	}


	public void deleteOrderProducts(String uid, String pid) throws SQLException {
		ShoppingCarDao dao=new ShoppingCarDao();
		dao.deleteOrderProducts(uid,pid);
	}

	

}
