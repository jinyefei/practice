package com.qianfeng.service;

import java.sql.SQLException;

import com.qianfeng.dao.UserDaoServlet;
import com.qianfeng.domain.User;

public class UserServiceServlet {

	public User getLoginUser(String username, String password) throws SQLException {
		User user=null;
		UserDaoServlet service=new UserDaoServlet();
		user=service.getLoginUser(username,password);
		return user;
	}

	public User searchUser(String uid) throws SQLException {
		UserDaoServlet service=new UserDaoServlet();
		return service.searchUser(uid);	 
	}

}
