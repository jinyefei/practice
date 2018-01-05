package com.qianfeng.domain;

public class ShoppingCar {
	private  String uid;
	private  String pid;
	private  int amount;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public ShoppingCar() {
		super();
	}
	
}
