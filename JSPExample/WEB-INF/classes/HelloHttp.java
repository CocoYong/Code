//这是第三个开发servlet的方法（通过继承HttpServlet）

package com.tsinghua;

import javax.servlet.http.*;
import java.io.*;

public class HelloHttp extends HttpServlet{
	//处理get请求
	//req:用于获得客户端（浏览器）的信息
	//res:用于向客户端（浏览器）返回信息
	public void doGet(HttpServletRequest req,HttpServletResponse res){
		
		//处理业务逻辑
		try{
			PrintWriter pw=res.getWriter();
			pw.println("hello,HttpServlet!");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//处理Post请求
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		
		this.doGet(req,res);
	}
 
    
    
}