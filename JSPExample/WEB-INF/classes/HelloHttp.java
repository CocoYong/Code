//���ǵ���������servlet�ķ�����ͨ���̳�HttpServlet��

package com.tsinghua;

import javax.servlet.http.*;
import java.io.*;

public class HelloHttp extends HttpServlet{
	//����get����
	//req:���ڻ�ÿͻ��ˣ������������Ϣ
	//res:������ͻ��ˣ��������������Ϣ
	public void doGet(HttpServletRequest req,HttpServletResponse res){
		
		//����ҵ���߼�
		try{
			PrintWriter pw=res.getWriter();
			pw.println("hello,HttpServlet!");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//����Post����
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		
		this.doGet(req,res);
	}
 
    
    
}