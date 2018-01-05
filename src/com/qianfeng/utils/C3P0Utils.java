package com.qianfeng.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0Utils {
	private static ComboPooledDataSource pool = new ComboPooledDataSource();
	//���һ��Connection����
	public static Connection getConnection() throws SQLException{
		return pool.getConnection();
	}
	//���һ�����ӳض���
	public static DataSource getDataSource(){
		return pool;
	}
}
