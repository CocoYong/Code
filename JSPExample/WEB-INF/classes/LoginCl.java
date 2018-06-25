//用户验证

package com.tsinghua;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class LoginCl extends HttpServlet{

	//重写init函数
	public void init(){
		try {
			//只会被调用一次
			//添加网页访问次数的功能
			//创建一个FielReader
			FileReader f=new FileReader("f:\\myCount.txt");
			BufferedReader br=new BufferedReader(f);
			//读出一行
			String numVal=br.readLine();
			br.close();
			
			//将times值放入到servletcontext中
			this.getServletContext().setAttribute("visitTimes",numVal);
    		System.out.print("init被调用");
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	//重写destroy函数
	public void destroy(){
		try {
			
			//再将新的次数写回去
			FileWriter w=new FileWriter("f:\\myCount.txt");
			BufferedWriter bw=new BufferedWriter(w);
			//读出一行
			bw.write(this.getServletContext().getAttribute("visitTimes").toString());
			bw.close();
				
    		System.out.println("destroy函数被调用");
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
   //处理get请求
	//req:用于获得客户端（浏览器）的信息
	//res:用于向客户端（浏览器）返回信息
	public void doGet(HttpServletRequest req,HttpServletResponse res){
		
		//处理业务逻辑
		Connection ct=null;
		Statement sm=null;
		ResultSet rs=null;

		try{
			String u=req.getParameter("username");
			String p=req.getParameter("passwd");
			
			//调用UserBeanCl,1、创建一个对象
			UserBeanCl ubc=new UserBeanCl();

			//2、 使用UserBeanCl的方法
			if(ubc.checkUser(u,p)){
				//用户存在
				String keep=req.getParameter("keep");
					
				if(keep!=null){
						
					//将用户名和密码保存在客户端（Cookie）中
					//创建Cookie
					Cookie name=new Cookie("myname",u);
					Cookie pass=new Cookie("mypasswd",p);
					//设置时间
					 name.setMaxAge(14*24*3600);
					 pass.setMaxAge(14*24*3600);
					 //回写到客户端
					 res.addCookie(name);
					 res.addCookie(pass);
				}
				//将验证成功的信息写入session
				//得到session
				HttpSession hs=req.getSession(true);
				//修改session存在的时间
				hs.setMaxInactiveInterval(60);//该方法按秒计算
				hs.setAttribute("uname",u);
				
				//将servletcontext中的visittimes属性中对应的值++
				int Times=Integer.parseInt(this.getServletContext().getAttribute("visitTimes").toString());
				Times++;
				this.getServletContext().setAttribute("visitTimes",Times+"");
				//跳转
				res.sendRedirect("main");//写url
								
			}else{
				//不合法
				//跳转
				res.sendRedirect("login");
			}	
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				
				if(rs!=null){
					rs.close();
				}
				if(sm!=null){
					sm.close();
				}
				if(ct!=null){
					ct.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	//处理Post请求
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		
		this.doGet(req,res);
	}
    
    
}