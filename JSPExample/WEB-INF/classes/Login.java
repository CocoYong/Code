package com.tsinghua;

import javax.servlet.http.*;
import java.io.*;


public class Login extends HttpServlet{

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
			String info=req.getParameter("info");
			if(info!=null){
				pw.println("<h1>����û��������������</h1>");
			}
			pw.println("<h1>��½����</h1>");
			pw.println("<form action=logincl  method=post>");
			pw.println("�û�����<input type=text name=username><br>");
			//&nbsp;������ǿո�
			pw.println("��&nbsp;&nbsp;�룺<input type=password name=passwd><br>");
			pw.println("<input type=checkbox name=keep value=2>2���ڲ����ٵ�¼ <br>");
			pw.println("<input type=submit value=login><br>");
			pw.println("</form>");
			
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