//操作失败界面
package com.tsinghua;

import javax.servlet.http.*;
import java.io.*;


public class Err extends HttpServlet{

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
			pw.println("<h1>很遗憾，操作失败</h1>");
			pw.println("<a href=main>返回主界面</a>&nbsp;&nbsp;&nbsp;<a href=wel>返回管理用户界面</a>");
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