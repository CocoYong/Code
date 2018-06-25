//��ServletContext�еõ�����
package com.tsinghua;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;


public class ServletContextTest2 extends HttpServlet{

    //����get����
    //req�����ڻ�ÿͻ��ˣ������������Ϣ
    //res��������ͻ��ˣ��������������Ϣ
    public void doGet(HttpServletRequest req,HttpServletResponse res){
    	//ҵ����
		try{
			//������������
			res.setContentType("text/html;charset=gbk");
			PrintWriter pw=res.getWriter();
			
			//1�� �õ�ServletContext
			ServletContext sc=this.getServletContext();
			//2�� ��ȡ����
			String info=(String)sc.getAttribute("myInfo");
			pw.println("���ServletContext�е�һ������myInfo����ֵ��һ���ַ���:"+info);
			
			//�Ƚ�session
			HttpSession hs=req.getSession(true);
			String val=(String)hs.getAttribute("test");
			pw.println("<br>session�е�test="+val+"<br>");
		
	
		}catch(Exception e){
			e.printStackTrace();
		}
    }
    //����Post����
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		
		this.doGet(req,res);
	}
}