//�����ҵĵ�һ��servlet��ʹ��ʵ��servlet�ӿڵķ�ʽ������

package com.tsinghua;

import javax.servlet.*;
import java.io.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;

public class Hello implements Servlet{
	
	//�ú������ڳ�ʼ����servlet(��������Ĺ��캯��)
	//�ú���ֻ�ᱻ����һ�Σ����û���һ�η��ʸ�servletʱ�����ã�
	//
	//
	public void init(ServletConfig parm1) throws ServletException {
		// TODO: Add your code here
		System.out.println("inin it");
	}


	public ServletConfig getServletConfig() {
		// TODO: Add your code here
		return null;
	}

	//���ڴ���ҵ���߼�
	//����ԱӦ����ҵ���߼�����д������
	//�ú������û�ÿ����һ��ʱ�����ᱻ����
	//req:���ڻ�ÿͻ��ˣ������������Ϣ
	//res:������ͻ��ˣ��������������Ϣ
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		// TODO: Add your code here
		System.out.println("server it");
		
		//��res�еõ�PrintWriter
		PrintWriter pw=res.getWriter();
		pw.println("hello,world");
		
	}

	
	public String getServletInfo() {
		// TODO: Add your code here
		return "";
	}

	//����servletʵ�����ͷ��ڴ棩
	//1.reload��servlet��webapp��2���ر�tomcat 3�� �ػ�
	public void destroy() {
		// TODO: Add your code here
		System.out.println("destrory");
		
	} 
	
}
