package com.qianfeng.web.filter;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.qianfeng.domain.User;
import com.qianfeng.service.UserServiceServlet;

/**
 * Servlet Filter implementation class AutoLoginFilternew
 */
public class AutoLoginFilternew implements Filter {

    /**
     * Default constructor. 
     */
    public AutoLoginFilternew() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		EnhancedRequest request = new EnhancedRequest((HttpServletRequest) req);
		//HttpServletRequest request=(HttpServletRequest) req;
		Cookie[] cookies = request.getCookies();
		String username=null;
		String password=null;
		if(cookies!=null){
			for (Cookie cookie : cookies) {
				if("username".equals(cookie.getName())){
					username = URLDecoder.decode(cookie.getValue(), "utf-8");
				}
				if("password".equals(cookie.getName())){
					password=cookie.getValue();
				}
			}
			
		}
		if(username!=null&&password!=null){
			UserServiceServlet service=new UserServiceServlet();
			User user=null;
			try {
				user=service.getLoginUser(username, password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(user!=null){
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
			}else{
				//不写
			}
		}
		
		chain.doFilter(request, response);
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
