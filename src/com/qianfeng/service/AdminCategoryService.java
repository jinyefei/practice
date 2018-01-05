package com.qianfeng.service;

import java.sql.SQLException;
import java.util.List;

import com.qianfeng.dao.AdminCategoryDao;
import com.qianfeng.dao.AdminProductDao;
import com.qianfeng.domain.Category;

public class AdminCategoryService {

	public List<Category> findAllCategory() throws SQLException {
		AdminProductDao dao=new AdminProductDao();
		return dao.findAllCategory();
	}

	public void addCategory(Category category) throws SQLException {
		List<Category> findAllCategory = findAllCategory();
		boolean res=true;
		for (Category cat : findAllCategory) {
			if(category.getCname().equals(cat.getCname())){
				res=false;
				break;
			}
		}
		if(res==true){
		AdminCategoryDao dao=new AdminCategoryDao();
		dao.addCategory(category);}
	}


	public void deleteCategoryByPid(String[] checkones) throws SQLException {
		AdminCategoryDao dao=new AdminCategoryDao();
		for (String cid : checkones) {
			dao.deleteCategoryById(cid);
		}
	}
	
}
