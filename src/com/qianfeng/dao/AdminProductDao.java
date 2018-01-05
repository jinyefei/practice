package com.qianfeng.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.qianfeng.domain.Category;
import com.qianfeng.domain.Product;
import com.qianfeng.domain.vo.Condition;
import com.qianfeng.utils.C3P0Utils;

public class AdminProductDao {
	//查询所有商品
	public List<Product> getAllProduct() throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from product";
		return qr.query(sql, new BeanListHandler<Product>(Product.class));
	}
	
	public List<Category> findAllCategory() throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from category";
		return qr.query(sql, new BeanListHandler<Category>(Category.class));
	}
	public void addProduct(Product p) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="insert into product values(?,?,?,?,?,?,?,?,?,?)";
		qr.update(sql,p.getPid(),p.getPname(),p.getMarket_price(),p.getShop_price(),
				p.getPimage(),p.getPdate(),p.getIs_hot(),p.getPdesc(),p.getPflag(),p.getCid());
	}
	public Product findProductById(String pid) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from product where pid=?";
		return qr.query(sql, new BeanHandler<Product>(Product.class),pid);
	}
	public void updateProduct(Product p) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="update product set pname=?,market_price=?,shop_price=?,"
				+ "pimage=?,pdate=?,is_hot=?,pdesc=?,pflag=?,cid=? where pid=?";
		qr.update(sql,p.getPname(),p.getMarket_price(),p.getShop_price(),
				p.getPimage(),p.getPdate(),p.getIs_hot(),p.getPdesc(),p.getPflag(),p.getCid(),p.getPid());
	}
	public List<Product> searchProductByCondition(Condition condition) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from product where 1=1 ";
		List<String> params=new ArrayList<>();
		if(condition.getPname()!=null&&!"".equals(condition.getPname().trim())){
			sql+="and pname like ? ";
			params.add("%"+condition.getPname().trim()+"%");
		}
		if(condition.getIs_hot()!=null&&!"".equals(condition.getIs_hot().trim())){
			sql+="and is_hot=? ";
			params.add(condition.getIs_hot().trim());
		}
		if(condition.getCid()!=null&&!"".equals(condition.getCid().trim())){
			sql+="and cid= ?";
			params.add(condition.getCid().trim());
		}
		return qr.query(sql, new BeanListHandler<Product>(Product.class), params.toArray());
	}
	public Object findProducttotalCount() throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select count(*) from product";
		return qr.query(sql,new ScalarHandler());
	}
	public List<Product> findProductsByPageBean(int productIndex, int currentCount) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from product limit ?,?";
		return  qr.query(sql, new BeanListHandler<Product>(Product.class),productIndex,currentCount);
	}

	public void deleteProductById(String pid) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from product where pid=?";
		qr.update(sql,pid);
	}

}
