package com.qianfeng.service;

import java.sql.SQLException;
import java.util.List;

import com.qianfeng.dao.AdminProductDao;
import com.qianfeng.domain.Product;
import com.qianfeng.domain.vo.Condition;
import com.qianfeng.domain.vo.PageBean;

public class AdminProductService {

	public List<Product> getAllProduct() throws SQLException {
		AdminProductDao dao=new AdminProductDao();
		return dao.getAllProduct();
	}

	public void addProduct(Product product) throws SQLException {
		AdminProductDao dao=new AdminProductDao();
		dao.addProduct(product);
	}

	public Product findProductById(String pid) throws SQLException {
		AdminProductDao dao=new AdminProductDao();
		return dao.findProductById(pid);
	}

	public void updateProduct(Product product) throws SQLException {
		AdminProductDao dao=new AdminProductDao();
		dao.updateProduct(product);
	}

	public List<Product> searchProductByCondition(Condition condition) throws SQLException {
		AdminProductDao dao=new AdminProductDao();
		return dao.searchProductByCondition(condition);
	}

	public PageBean<Product> findProductsByPageBean(int currentPageInt, int currentCount) throws SQLException {
		/*
		 * 要想实现分页的功能，就必须获得这五项数据:这五项数据将被封装进pagebaen对象中，在各层间传递
		 * 当前页	   currentPage 该数据从客户端获得 //1表示第一页
		 * 每页显示的条数    currentCount  该数据也从客户端获得  目前我们在这写死  12条
		 * 数据总条数	totalCount
		 * 总页数		totalPage
		 * 当前页上的数据     pageData 
		 *   
		 */
		AdminProductDao dao=new AdminProductDao();
		int productIndex=(currentPageInt-1)*currentCount;
		List<Product> list=null;
		Long totalCountlong = (Long) dao.findProducttotalCount();
		int totalCount=totalCountlong.intValue();
		int totalPage=(int) Math.ceil(totalCount/(currentCount*1.0));
		list=dao.findProductsByPageBean(productIndex,currentCount);
		
		PageBean<Product> pageBean=new PageBean<>();
		pageBean.setCurrentCount(currentCount);
		pageBean.setCurrentPage(currentPageInt);
		pageBean.setPageData(list);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}

	public void deleteProductByPid(String[] checkones) throws SQLException {
		AdminProductDao dao=new AdminProductDao();
		for (String pid : checkones) {
			dao.deleteProductById(pid);
		}
		
	}

	public void deleteProductByPidone(String pid) throws SQLException {
		AdminProductDao dao=new AdminProductDao();
			dao.deleteProductById(pid);
	}




}
