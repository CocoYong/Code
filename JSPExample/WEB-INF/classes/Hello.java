//这是我的第一个servlet，使用实现servlet接口的方式来开发

package com.tsinghua;

import javax.servlet.*;
import java.io.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;

public class Hello implements Servlet{
	
	//该函数用于初始化该servlet(类似于类的构造函数)
	//该函数只会被调用一次（当用户第一次访问该servlet时被调用）
	//
	//
	public void init(ServletConfig parm1) throws ServletException {
		// TODO: Add your code here
		System.out.println("inin it");
	}


	public ServletConfig getServletConfig() {
		// TODO: Add your code here
		return null;
	}

	//用于处理业务逻辑
	//程序员应当把业务逻辑代码写在这里
	//该函数当用户每访问一次时，都会被调用
	//req:用于获得客户端（浏览器）的信息
	//res:用于向客户端（浏览器）返回信息
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		// TODO: Add your code here
		System.out.println("server it");
		
		//从res中得到PrintWriter
		PrintWriter pw=res.getWriter();
		pw.println("hello,world");
		
	}

	
	public String getServletInfo() {
		// TODO: Add your code here
		return "";
	}

	//销毁servlet实例（释放内存）
	//1.reload该servlet（webapp）2、关闭tomcat 3、 关机
	public void destroy() {
		// TODO: Add your code here
		System.out.println("destrory");
		
	} 
	
}
