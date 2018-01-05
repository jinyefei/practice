package com.qianfeng.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.qianfeng.domain.Product;
import com.qianfeng.utils.C3P0Utils;

public class ServiceDao {

	public List<Product> findProductListBySearch(String word) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from product where pname like ? limit ?,?";
		return qr.query(sql, new BeanListHandler<Product>(Product.class),word+"%",0,4);
	}

}
