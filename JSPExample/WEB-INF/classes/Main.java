//主界面
package com.tsinghua;

import javax.servlet.http.*;
import java.io.*;


public class Main extends HttpServlet{

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
			
			pw.println("<h1>主界面</h1><br>");
			pw.println("<a href=wel>管理用户</a><br>");
			pw.println("<a href=??>添加用户</a><br>");
			pw.println("<a href=??>查找用户</a><br>");
			pw.println("<a href=??>安全退出</a><br>");
			
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