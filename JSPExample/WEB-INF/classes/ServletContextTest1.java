//向ServletContext中添加属性
package com.tsinghua;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;


public class ServletContextTest1 extends HttpServlet{

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
			//2、 添加属性
			sc.setAttribute("myInfo","我是超超");
			pw.println("给ServletContext中添加一个属性myInfo，该值是一串字符串：我是超超");
			
			//比较session
			HttpSession hs=req.getSession(true);
			hs.setAttribute("test","中国人");
			hs.setMaxInactiveInterval(60*3);
			pw.println("<br>向session中添加test属性，它的值是  中国人");
			
			//当然也可以在ServletContext中放入一个对象	
		    //Cat myCat=new Cat("李明",30);
		    //sc.setAttribute("cat1",myCat);
	 
		}catch(Exception e){
			e.printStackTrace();
		}
    }
    //处理Post请求
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		
		this.doGet(req,res);
	}
}