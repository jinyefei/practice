package com.qianfeng.domain;

import java.sql.Date;

@SuppressWarnings("serial")
public class Orderdetails implements java.io.Serializable {
/*
FieldTypeComment
oidvarchar(100) NULL
ordertimedate NULL
buyernamevarchar(100) NULL
addrvarchar(100) NULL
telephonevarchar(100) NULL
statevarchar(100) NULL
unovarchar(100) NULL*/
	
	private String oid;
	private java.util.Date ordertime;
	private String buyername;
	private String addr;
	private String telephone;
	private String state;
	private String uno;
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public java.util.Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(java.util.Date date) {
		this.ordertime = date;
	}
	public String getBuyername() {
		return buyername;
	}
	public void setBuyername(String buyername) {
		this.buyername = buyername;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUno() {
		return uno;
	}
	public void setUno(String uno) {
		this.uno = uno;
	}
	public Orderdetails() {
		super();
	}
	
}
