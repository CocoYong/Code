
package com.tsinghua;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class Wel extends HttpServlet{

   //����get����
	//req:���ڻ�ÿͻ��ˣ������������Ϣ
	//res:������ͻ��ˣ��������������Ϣ
	public void doGet(HttpServletRequest req,HttpServletResponse res){
		
		Connection ct=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		//��������
		res.setContentType("text/html;charset=gbk"); 
		PrintWriter pw=null;
			
		try{
			pw=res.getWriter();
			//�õ�session
			HttpSession hs=req.getSession(true);
			String myName=(String)hs.getAttribute("uname");
			String name="";
			String passwd="";
			//�ж�
		
			if(myName==null){
				
				//���session��û���û���Ϣ���ٿ���cookie����û��
					//�ӿͻ��˵õ����е�cookie��Ϣ
	    		Cookie []allCookies=req.getCookies();
	    		
	    		int i=0;
	    		if(allCookies!=null){
	    			//���ж�ȡCookie
	    			for(i=0;i<allCookies.length;i++){
	    				//����ȡ��
	    				Cookie temp=allCookies[i];
	    				if(temp.getName().equals("myname")){
	    					//�õ�Cookie��ֵ
	    					name=temp.getValue();
	    				}else if(temp.getName().equals("mypasswd")){
	    					passwd=temp.getValue();
	    				}
	    			}
	    			if(!name.equals("")&&!equals("")){
	    				//��loginclȥ��֤
	    				res.sendRedirect("logincl?username="+name+"&passwd="+passwd);
	    					return;
	    			}
	    		}
				
				
				//�Ƿ���¼,���ص�¼����
				res.sendRedirect("login");	
				return ;
			}	
				
			//�õ���LoginCl���ݵ��û���
			String u=req.getParameter("uname");
			//�õ���LoginCl���ݵ��û���
			String p=req.getParameter("uPasswd");
			
			//��servlet����ʾͼƬ
			pw.println("<html>");
			pw.println("<body bgcolor=#D5D4FE>");
			
			//����UserBeanCl
			UserBeanCl ubc=new UserBeanCl();
		String pName=ubc.findPic(myName);
			pw.println("<img src=imgs/3.jpg>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ӭ����"+myName+"<img src=imgs/"+pName+"><hr><center>");
			
			pw.println("<h1>�����û�</h1>");
			pw.println("<br><a href=login>�������µ�¼</a>");
		
			
			
			//===========��ҳ�Ĺ���================
			int pageSize=3;//һҳ��ʾ������¼
			int pageNow=1;//ϣ����ʾ�ڼ�ҳ
		
			
			//��̬�Ľ���pageNow
			String sPageNow=req.getParameter("pageNow");
			if(sPageNow!=null){
				pageNow=Integer.parseInt(sPageNow);
			}
			
			ArrayList al=ubc.getResultByPage(pageNow,pageSize);
			//��ʾ�����
		
			pw.println("<table border=1>");
			pw.println("<tr bgcolor=pink><th>id</th><th>username</th><th>password</th><th>email</th><th>grade</th><th>myPic</th><th>�޸��û�</th><th>ɾ���û�</th></tr>");
			//����һ����ɫ����
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
				pw.println("<td><a href=update?uId="+ub.getUserId()+"&uName="+ub.getUserName()+"&uPasswd="+ub.getPasswd()+"&uEmail="+ub.getEmail()+"&uGrade="+ub.getGrade()+"&uMyPic="+ub.getMyPic()+">�޸��û�</a></td>");
				pw.println("<td><a href=delusercl?userId="+ub.getUserId()+" onclick=\"return window.confirm('��ȷ��Ҫɾ�����û���')\">ɾ���û�</a></td>");
				pw.println("</tr>");
			}
			pw.println("</table>");
			
			int pageCount=ubc.getPageCount();
			//��ʾ������
			//��һҳ
			if(pageNow>1){
				pw.println("<a href=wel?pageNow="+1+">��ҳ</a>");
				pw.println("<a href=wel?pageNow="+(pageNow-1)+">��һҳ</a>");
			}
			
			for(int i=pageNow;i<=pageNow+4;i++){
					
				pw.println("<a href=wel?pageNow="+i+">"+i+"</a>");
				if(i>pageCount)
					break;
			}
			
			//��һҳ
			if(pageNow<pageCount){
				pw.println("<a href=wel?pageNow="+(pageNow+1)+">��һҳ</a>");
				pw.println("<a href=wel?pageNow="+pageCount+">ĩҳ</a>");
			}
			//�ƶ���ת��ĳһҳ
			//����ʵ��һ����
			//����Ҫ���ǵ����⣺1�� ����ҳ���ķ�Χ 2������Ĳ������� 
			pw.println("<br><form action=wel>");
			pw.println("<input type=text  name=pageNow>");
			pw.println("<input type=submit value=Go>");
			pw.println("</form>");
			
			//����ҳ�����ʵĴ���
			pw.println("<br>����ҳ��������"+this.getServletContext().getAttribute("visitTimes").toString()+"��");
			pw.println("<br>����ip="+req.getRemoteAddr());
			
			pw.println("<br>���Ļ�����="+req.getRemoteHost());
			pw.println("</center><hr><img src=imgs/logo1.gif>");
			pw.println("</body>");
			pw.println("</html>");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//����Post����
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		
		this.doGet(req,res);
	}
}
