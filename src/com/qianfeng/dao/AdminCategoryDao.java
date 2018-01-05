package com.qianfeng.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import com.qianfeng.domain.Category;
import com.qianfeng.utils.C3P0Utils;

public class AdminCategoryDao {

	public void addCategory(Category category) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="insert into category values(?,?)";
		qr.update(sql,category.getCid(),category.getCname());
	}

	public void deleteCategoryById(String cid) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from category where cid=?";
		qr.update(sql,cid);
	}

}
