//��ʾ�����Servlet�в����ļ�
//��ʾ��ζ�ȡ�ļ�������
package com.tsinghua;

import java.io.*;
import javax.servlet.http.*;

public class ServletFileTest2 extends HttpServlet{

   public void doGet(HttpServletRequest req,HttpServletResponse res){
		try {
		    //������������
			res.setContentType("text/html;charset=gbk");
			PrintWriter pw=res.getWriter();
			
			//����һ��FielReader
			//�ڴ�����->�����ļ���д�룬�������
			//�ڴ�����<-�����ļ������룬��������
			FileWriter f=new FileWriter("f:\\myCount.txt");
			BufferedWriter bw=new BufferedWriter(f);
			//����һ��
			bw.write("123432");
			bw.close();
			pw.println("���ļ���д�������");
			
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
   }
   //����Post����
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		
		this.doGet(req,res);
	}
}