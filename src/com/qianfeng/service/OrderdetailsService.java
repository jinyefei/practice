package com.qianfeng.service;

import java.sql.SQLException;
import java.util.List;

import com.qianfeng.dao.OrderdetailsDao;
import com.qianfeng.domain.Orderdetails;

public class OrderdetailsService {

	public void addOrderdetails(Orderdetails orderdetails) throws SQLException {
		OrderdetailsDao dao=new OrderdetailsDao();
		dao.addOrderdetails(orderdetails);
	}

	public List<Orderdetails> getOrderdetails(String uno) throws SQLException {
		OrderdetailsDao dao=new OrderdetailsDao();
		return dao.getOrderdetails(uno);
	}

	public Orderdetails findOrderdetailsById(String oid) throws SQLException {
		OrderdetailsDao dao=new OrderdetailsDao();
		return dao.findOrderdetailsById(oid);
	}

	public void deleteOrderdetails(String oid) throws SQLException {
		OrderdetailsDao dao=new OrderdetailsDao();
		dao.deleteOrderdetails(oid);
	}

	



}
