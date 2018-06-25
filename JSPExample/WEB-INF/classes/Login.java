package com.tsinghua;

import javax.servlet.http.*;
import java.io.*;


public class Login extends HttpServlet{

   //处理get请求
	//req:用于获得客户端（浏览器）的信息
	//res:用于向客户端（浏览器）返回信息
	public void doGet(HttpServletRequest req,HttpServletResponse res){
		
		//处理业务逻辑
		try{
			//中文乱码
			res.setContentType("text/html;charset=gbk");
			PrintWriter pw=res.getWriter();
			
			//返回登陆界面
			pw.println("<html>");
			pw.println("<body bgcolor=#D5D4FE>");
			
			pw.println("<img src=imgs/3.jpg><hr><center>");
			String info=req.getParameter("info");
			if(info!=null){
				pw.println("<h1>你的用户名或是密码错误！</h1>");
			}
			pw.println("<h1>登陆界面</h1>");
			pw.println("<form action=logincl  method=post>");
			pw.println("用户名：<input type=text name=username><br>");
			//&nbsp;代表的是空格
			pw.println("密&nbsp;&nbsp;码：<input type=password name=passwd><br>");
			pw.println("<input type=checkbox name=keep value=2>2周内不用再登录 <br>");
			pw.println("<input type=submit value=login><br>");
			pw.println("</form>");
			
			pw.println("</center><hr><img src=imgs/logo1.gif>");
			pw.println("</body>");
			pw.println("</html>");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//处理Post请求
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		
		this.doGet(req,res);
	}
    
    
}