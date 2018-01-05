package com.qianfeng.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.qianfeng.domain.Product;
import com.qianfeng.domain.ShoppingCar;
import com.qianfeng.utils.C3P0Utils;

public class ShoppingCarDao {

	public void addShoppingCar(ShoppingCar sc) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="insert into shoppingcar values(?,?,?)";
		qr.update(sql,sc.getUid(),sc.getPid(),sc.getAmount());
	}

	
	public ShoppingCar getShoppingCarUPN(String uid, String pid) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from shoppingcar where uid=? and pid=?";
		return  qr.query(sql, new BeanHandler<ShoppingCar>(ShoppingCar.class),uid,pid);
	}

	public void updateShoppingCar(String uid, String pid, int amount) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="update shoppingcar set amount=? where pid=? and uid=?";
		qr.update(sql,amount,pid,uid);
	}


	public List<ShoppingCar> getCarFromDB(String uid) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from shoppingcar where uid=?";
		return  qr.query(sql, new BeanListHandler<ShoppingCar>(ShoppingCar.class),uid);
	}


	public void deleteOrderProducts(String uid, String pid) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="delete from shoppingcar where pid=? and uid=?";
		qr.update(sql,pid,uid);
	}



}
