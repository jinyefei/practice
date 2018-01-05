package com.qianfeng.domain.vo;

import java.util.List;


public class PageBean<T> {
	/*
	 * 要想实现分页的功能，就必须获得这五项数据:这五项数据将被封装进pagebaen对象中，在各层间传递
	 * 当前页	   currentPage 该数据从客户端获得 //1表示第一页
	 * 每页显示的条数    currentCount  该数据也从客户端获得  目前我们在这写死  12条
	 * 数据总条数	totalCount
	 * 总页数		totalPage
	 * 当前页上的数据     pageData 
	 *   
	 */
	private int currentPage;
	private int currentCount;
	private int totalCount;
	private int totalPage;
	private List<T> pageData;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getCurrentCount() {
		return currentCount;
	}
	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getPageData() {
		return pageData;
	}
	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
	}
	public PageBean() {
		super();
	}
	
}
