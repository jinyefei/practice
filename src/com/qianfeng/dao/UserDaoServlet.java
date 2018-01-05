package com.qianfeng.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.qianfeng.domain.User;
import com.qianfeng.utils.C3P0Utils;

public class UserDaoServlet {
	
	public User getLoginUser(String username, String password) throws SQLException {
		User user=null;
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from user where username=? and password=?";
		user=qr.query(sql, new BeanHandler<User>(User.class), username,password);
		return user;
	}

	public User searchUser(String uid) throws SQLException {
		User user=null;
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from user where uid=?";
		user=qr.query(sql, new BeanHandler<User>(User.class), uid);
		return user;
	}
	
}
