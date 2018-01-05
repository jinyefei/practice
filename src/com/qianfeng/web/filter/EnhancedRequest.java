package com.qianfeng.web.filter;

import java.io.UnsupportedEncodingException;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EnhancedRequest extends HttpServletRequestWrapper {

	HttpServletRequest request;
	private boolean flag = true;

	public EnhancedRequest(HttpServletRequest request) {
		 super(request);
		this.request=request;
	}
	@Override
	public String getParameter(String name) {
		String namevalue = this.request.getParameter(name);
		String str_enc = null;
		if(namevalue!=null){
		try {
			str_enc = new String(namevalue.getBytes("iso8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}}
		return str_enc;
	}
	
	@Override
	public String[] getParameterValues(String name) {
		String[] namevalues = this.request.getParameterValues(name);
		if(namevalues!=null){
		try {
			for(int i = 0 ;i< namevalues.length; i++){  
                //对每一个元素进行转码  
				namevalues[i] = new String(namevalues[i].getBytes("ISO-8859-1"),"utf-8");   
                }  
             
            }catch (UnsupportedEncodingException e) {
			e.printStackTrace();
            }
		}
		//返回增强值  
        return namevalues; 
	}
	
	@Override
    public Map<String, String[]> getParameterMap() {

        Map<String, String[]> map = request.getParameterMap();

        if (flag) {
            for (Map.Entry<String, String[]> entry : map.entrySet()) {
                String[] value = entry.getValue();
                for (int i = 0; i < value.length; i++) {
                    try {
                        value[i] = new String(value[i].getBytes("iso-8859-1"),"UTF-8");
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                }
            }
            flag = false;
        }

        return map;
    }
}
