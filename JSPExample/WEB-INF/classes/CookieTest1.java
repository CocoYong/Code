//��δ���cookie����
package com.tsinghua;

import javax.servlet.http.*;
import java.io.*;


public class CookieTest1 extends HttpServlet{
	//����get����
	public void doGet(HttpServletRequest req,HttpServletResponse res){
		//ҵ����
		try{
			//������������
			res.setContentType("text/html;charset=gbk");
			PrintWriter pw=res.getWriter();
			
			//���û����ʸ�servletʱ���ͽ���Ϣ���������û���cookie��
			//1�����ڷ������˴���һ��cookie
			Cookie myCookie=new Cookie("color1","red");
			//2����cookie���ڵ�ʱ��
			myCookie.setMaxAge(30);
			//���������ʱ�䣬��ôCookie�����ᱻ����
			
			//3����Cookieд�ص��ͻ���
			res.addCookie(myCookie);
			
			pw.println("�Ѿ�������Cookie");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}