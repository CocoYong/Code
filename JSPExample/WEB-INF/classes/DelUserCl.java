package com.tsinghua;

import javax.servlet.http.*;
import java.io.*;


public class DelUserCl extends HttpServlet{

   //处理get请求
	//req:用于获得客户端（浏览器）的信息
	//res:用于向客户端（浏览器）返回信息
	public void doGet(HttpServletRequest req,HttpServletResponse res){
		
		//处理业务逻辑
		try{
			PrintWriter pw=res.getWriter();
			//调用userBean的删除用户的方法
			UserBeanCl ubc=new UserBeanCl();
			//接受从wel.java中传递的id
			String id=req.getParameter("userId");
			if(ubc.delUser(id)){
				//成功
				res.sendRedirect("ok");
			}else{
				//失败
				res.sendRedirect("err");
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//处理Post请求
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		
		this.doGet(req,res);
	}
    
    
}