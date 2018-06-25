//��ServletContext���������
package com.tsinghua;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;


public class ServletContextTest1 extends HttpServlet{

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
			//2�� �������
			sc.setAttribute("myInfo","���ǳ���");
			pw.println("��ServletContext�����һ������myInfo����ֵ��һ���ַ��������ǳ���");
			
			//�Ƚ�session
			HttpSession hs=req.getSession(true);
			hs.setAttribute("test","�й���");
			hs.setMaxInactiveInterval(60*3);
			pw.println("<br>��session�����test���ԣ�����ֵ��  �й���");
			
			//��ȻҲ������ServletContext�з���һ������	
		    //Cat myCat=new Cat("����",30);
		    //sc.setAttribute("cat1",myCat);
	 
		}catch(Exception e){
			e.printStackTrace();
		}
    }
    //����Post����
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		
		this.doGet(req,res);
	}
}