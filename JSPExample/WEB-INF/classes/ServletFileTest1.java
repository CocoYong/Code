//��ʾ�����Servlet�в����ļ�
//��ʾ��ζ�ȡ�ļ�������
package com.tsinghua;

import java.io.*;
import javax.servlet.http.*;

public class ServletFileTest1 extends HttpServlet{

   public void doGet(HttpServletRequest req,HttpServletResponse res){
		try {
		    //������������
			res.setContentType("text/html;charset=gbk");
			PrintWriter pw=res.getWriter();
			
			//����һ��FielReader
			FileReader f=new FileReader("f:\\myCount.txt");
			BufferedReader bw=new BufferedReader(f);
			//����һ��
			String numVal=bw.readLine();
			bw.close();
			pw.println("���ļ��ж�ȡ�������ǣ�"+numVal);
			
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