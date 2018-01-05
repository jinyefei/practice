package com.qianfeng.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.qianfeng.domain.Orderdetails;
import com.qianfeng.utils.C3P0Utils;

public class OrderdetailsDao {

	public void addOrderdetails(Orderdetails o) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="insert into orderdetails values(?,?,?,?,?,?,?)";
		qr.update(sql,o.getOid(),o.getOrdertime(),o.getBuyername(),o.getAddr(),o.getTelephone(),o.getState(),o.getUno());
	}

	public List<Orderdetails> getOrderdetails(String uno) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from orderdetails where uno=?";
		return qr.query(sql, new BeanListHandler<Orderdetails>(Orderdetails.class),uno);
	}

	public Orderdetails findOrderdetailsById(String oid) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from orderdetails where oid=?";
		return qr.query(sql, new BeanHandler<Orderdetails>(Orderdetails.class),oid);
	}

	public void deleteOrderdetails(String oid) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="delete from orderdetails where oid=?";
		qr.update(sql, oid);
	}

}
