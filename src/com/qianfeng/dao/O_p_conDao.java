package com.qianfeng.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.qianfeng.domain.O_p_con;
import com.qianfeng.utils.C3P0Utils;

public class O_p_conDao {

	public void addO_p_con(O_p_con opcon) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="insert into o_p_con values(?,?,?)";
		qr.update(sql,opcon.getOid(),opcon.getPid(),opcon.getAmount());
	}

	public void deleteO_p_con(String oid) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="delete from o_p_con where oid=?";
		qr.update(sql,oid);
	}

	public List<O_p_con> findo_p_conListByOid(String oid) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from o_p_con where oid=?";
		return qr.query(sql, new BeanListHandler<O_p_con>(O_p_con.class),oid);
	}

}
