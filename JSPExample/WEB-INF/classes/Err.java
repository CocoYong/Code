//����ʧ�ܽ���
package com.tsinghua;

import javax.servlet.http.*;
import java.io.*;


public class Err extends HttpServlet{

   //����get����
	//req:���ڻ�ÿͻ��ˣ������������Ϣ
	//res:������ͻ��ˣ��������������Ϣ
	public void doGet(HttpServletRequest req,HttpServletResponse res){
		
		//����ҵ���߼�
		try{
			//��������
			res.setContentType("text/html;charset=gbk");
			PrintWriter pw=res.getWriter();
			
			//���ص�½����
			pw.println("<html>");
			pw.println("<body bgcolor=#D5D4FE>");
			pw.println("<img src=imgs/3.jpg><hr><center>");
			pw.println("<h1>���ź�������ʧ��</h1>");
			pw.println("<a href=main>����������</a>&nbsp;&nbsp;&nbsp;<a href=wel>���ع����û�����</a>");
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