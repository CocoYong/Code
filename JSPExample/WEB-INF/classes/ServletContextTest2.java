//向ServletContext中得到属性
package com.tsinghua;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;


public class ServletContextTest2 extends HttpServlet{

    //处理get请求
    //req：用于获得客户端（浏览器）的信息
    //res：用于向客户端（浏览器）返回信息
    public void doGet(HttpServletRequest req,HttpServletResponse res){
    	//业务处理
		try{
			//处理中文乱码
			res.setContentType("text/html;charset=gbk");
			PrintWriter pw=res.getWriter();
			
			//1、 得到ServletContext
			ServletContext sc=this.getServletContext();
			//2、 读取属性
			String info=(String)sc.getAttribute("myInfo");
			pw.println("获得ServletContext中的一个属性myInfo，该值是一串字符串:"+info);
			
			//比较session
			HttpSession hs=req.getSession(true);
			String val=(String)hs.getAttribute("test");
			pw.println("<br>session中的test="+val+"<br>");
		
	
		}catch(Exception e){
			e.printStackTrace();
		}
    }
    //处理Post请求
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		
		this.doGet(req,res);
	}
}