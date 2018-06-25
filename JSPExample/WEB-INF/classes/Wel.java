
package com.tsinghua;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class Wel extends HttpServlet{

   //处理get请求
	//req:用于获得客户端（浏览器）的信息
	//res:用于向客户端（浏览器）返回信息
	public void doGet(HttpServletRequest req,HttpServletResponse res){
		
		Connection ct=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		//中文乱码
		res.setContentType("text/html;charset=gbk"); 
		PrintWriter pw=null;
			
		try{
			pw=res.getWriter();
			//得到session
			HttpSession hs=req.getSession(true);
			String myName=(String)hs.getAttribute("uname");
			String name="";
			String passwd="";
			//判断
		
			if(myName==null){
				
				//如果session中没有用户信息，再看看cookie中有没有
					//从客户端得到所有的cookie信息
	    		Cookie []allCookies=req.getCookies();
	    		
	    		int i=0;
	    		if(allCookies!=null){
	    			//从中读取Cookie
	    			for(i=0;i<allCookies.length;i++){
	    				//依次取出
	    				Cookie temp=allCookies[i];
	    				if(temp.getName().equals("myname")){
	    					//得到Cookie的值
	    					name=temp.getValue();
	    				}else if(temp.getName().equals("mypasswd")){
	    					passwd=temp.getValue();
	    				}
	    			}
	    			if(!name.equals("")&&!equals("")){
	    				//到logincl去验证
	    				res.sendRedirect("logincl?username="+name+"&passwd="+passwd);
	    					return;
	    			}
	    		}
				
				
				//非法登录,返回登录界面
				res.sendRedirect("login");	
				return ;
			}	
				
			//得到从LoginCl传递的用户名
			String u=req.getParameter("uname");
			//得到从LoginCl传递的用户名
			String p=req.getParameter("uPasswd");
			
			//在servlet中显示图片
			pw.println("<html>");
			pw.println("<body bgcolor=#D5D4FE>");
			
			//调用UserBeanCl
			UserBeanCl ubc=new UserBeanCl();
		String pName=ubc.findPic(myName);
			pw.println("<img src=imgs/3.jpg>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎您："+myName+"<img src=imgs/"+pName+"><hr><center>");
			
			pw.println("<h1>管理用户</h1>");
			pw.println("<br><a href=login>返回重新登录</a>");
		
			
			
			//===========分页的功能================
			int pageSize=3;//一页显示几条记录
			int pageNow=1;//希望显示第几页
		
			
			//动态的接受pageNow
			String sPageNow=req.getParameter("pageNow");
			if(sPageNow!=null){
				pageNow=Integer.parseInt(sPageNow);
			}
			
			ArrayList al=ubc.getResultByPage(pageNow,pageSize);
			//显示结果集
		
			pw.println("<table border=1>");
			pw.println("<tr bgcolor=pink><th>id</th><th>username</th><th>password</th><th>email</th><th>grade</th><th>myPic</th><th>修改用户</th><th>删除用户</th></tr>");
			//定义一个颜色数组
			String [] myCol={"silver","pink"};
			for(int i=0;i<al.size();i++){
				UserBean ub=(UserBean)al.get(i);
				pw.println("<tr bgcolor="+myCol[i%2]+">");
				pw.println("<td>"+ub.getUserId()+"</td>");
				pw.println("<td>"+ub.getUserName()+"</td>");
				pw.println("<td>"+ub.getPasswd()+"</td>");
				pw.println("<td>"+ub.getEmail()+"</td>");
				pw.println("<td>"+ub.getGrade()+"</td>");
				pw.println("<td>"+ub.getMyPic()+"</td>");
				pw.println("<td><a href=update?uId="+ub.getUserId()+"&uName="+ub.getUserName()+"&uPasswd="+ub.getPasswd()+"&uEmail="+ub.getEmail()+"&uGrade="+ub.getGrade()+"&uMyPic="+ub.getMyPic()+">修改用户</a></td>");
				pw.println("<td><a href=delusercl?userId="+ub.getUserId()+" onclick=\"return window.confirm('您确认要删除该用户吗？')\">删除用户</a></td>");
				pw.println("</tr>");
			}
			pw.println("</table>");
			
			int pageCount=ubc.getPageCount();
			//显示超链接
			//上一页
			if(pageNow>1){
				pw.println("<a href=wel?pageNow="+1+">首页</a>");
				pw.println("<a href=wel?pageNow="+(pageNow-1)+">上一页</a>");
			}
			
			for(int i=pageNow;i<=pageNow+4;i++){
					
				pw.println("<a href=wel?pageNow="+i+">"+i+"</a>");
				if(i>pageCount)
					break;
			}
			
			//下一页
			if(pageNow<pageCount){
				pw.println("<a href=wel?pageNow="+(pageNow+1)+">下一页</a>");
				pw.println("<a href=wel?pageNow="+pageCount+">末页</a>");
			}
			//制定跳转到某一页
			//这里实际一个表单
			//您需要考虑的问题：1、 输入页数的范围 2、输入的不是数字 
			pw.println("<br><form action=wel>");
			pw.println("<input type=text  name=pageNow>");
			pw.println("<input type=submit value=Go>");
			pw.println("</form>");
			
			//该网页被访问的次数
			pw.println("<br>该网页被访问了"+this.getServletContext().getAttribute("visitTimes").toString()+"次");
			pw.println("<br>您的ip="+req.getRemoteAddr());
			
			pw.println("<br>您的机器名="+req.getRemoteHost());
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
