package com.qianfeng.service;

import java.sql.SQLException;
import java.util.List;

import com.qianfeng.dao.ServiceDao;
import com.qianfeng.domain.Product;

public class SearchService {

	public List<Product> findProductListBySearch(String word) throws SQLException {
		ServiceDao dao = new ServiceDao();
		return dao.findProductListBySearch(word);
	}
	
}
