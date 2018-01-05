package com.qianfeng.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qianfeng.dao.O_p_conDao;
import com.qianfeng.domain.O_p_con;

public class O_p_conService {

	public void addO_p_con(O_p_con opcon) throws SQLException {
		O_p_conDao dao=new O_p_conDao();
		dao.addO_p_con(opcon);
	}

	public void deleteO_p_con(String oid) throws SQLException {
		O_p_conDao dao=new O_p_conDao();
		dao.deleteO_p_con(oid);
	}

	public List<O_p_con> findo_p_conListByOid(String oid) throws SQLException {
		O_p_conDao dao=new O_p_conDao();
		return dao.findo_p_conListByOid(oid);
		
	}
	
}
