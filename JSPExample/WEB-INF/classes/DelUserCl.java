package com.tsinghua;

import javax.servlet.http.*;
import java.io.*;


public class DelUserCl extends HttpServlet{

   //����get����
	//req:���ڻ�ÿͻ��ˣ������������Ϣ
	//res:������ͻ��ˣ��������������Ϣ
	public void doGet(HttpServletRequest req,HttpServletResponse res){
		
		//����ҵ���߼�
		try{
			PrintWriter pw=res.getWriter();
			//����userBean��ɾ���û��ķ���
			UserBeanCl ubc=new UserBeanCl();
			//���ܴ�wel.java�д��ݵ�id
			String id=req.getParameter("userId");
			if(ubc.delUser(id)){
				//�ɹ�
				res.sendRedirect("ok");
			}else{
				//ʧ��
				res.sendRedirect("err");
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//����Post����
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		
		this.doGet(req,res);
	}
    
    
}