//如何创建cookie案例
package com.tsinghua;

import javax.servlet.http.*;
import java.io.*;


public class CookieTest1 extends HttpServlet{
	//处理get请求
	public void doGet(HttpServletRequest req,HttpServletResponse res){
		//业务处理
		try{
			//处理中文乱码
			res.setContentType("text/html;charset=gbk");
			PrintWriter pw=res.getWriter();
			
			//当用户访问该servlet时，就将信息创建到该用户的cookie中
			//1、先在服务器端创建一个cookie
			Cookie myCookie=new Cookie("color1","red");
			//2、该cookie存在的时间
			myCookie.setMaxAge(30);
			//如果不设置时间，那么Cookie将不会被保存
			
			//3、将Cookie写回到客户端
			res.addCookie(myCookie);
			
			pw.println("已经创建了Cookie");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}