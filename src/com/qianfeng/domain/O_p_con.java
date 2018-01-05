package com.qianfeng.domain;

@SuppressWarnings("serial")
public class O_p_con implements java.io.Serializable {
	private String oid;
	private String pid;
	private int amount;
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public O_p_con() {
		super();
	}
	
	
	
}
