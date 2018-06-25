//修改用户界面
package com.tsinghua;

import javax.servlet.http.*;
import java.io.*;


public class Update extends HttpServlet{

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
			pw.println("<h1>修改用户界面</h1><br>");
			pw.println("<form action=updatecl>");
			pw.println("<table border=1>");
			pw.println("<tr><td>id</td><td><input readonly type=text name=uId value="+req.getParameter("uId")+"></td></tr>");
			pw.println("<tr><td>username</td><td><input readonly type=text value="+req.getParameter("uName")+"></td></tr>");
			pw.println("<tr><td>password</td><td><input type=text name=uPasswd value="+req.getParameter("uPasswd")+"></td></tr>");
			pw.println("<tr><td>email</td><td><input type=text name=uEmail value="+req.getParameter("uEmail")+"></td></tr>");
			pw.println("<tr><td>grade</td><td><input type=text name=uGrade value="+req.getParameter("uGrade")+"></td></tr>");	
			pw.println("<tr><td>myPic</td><td><input type=text name=uMyPic value="+req.getParameter("uMyPic")+"></td></tr>");
			pw.println("<tr><td colspan=2><input type=submit value=修改用户></td></tr>");
			pw.println("</table></form>");
			pw.println("<a href=wel>返回管理用户界面</a>");
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