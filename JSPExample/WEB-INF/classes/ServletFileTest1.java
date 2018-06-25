//演示如何在Servlet中操作文件
//演示如何读取文件的内容
package com.tsinghua;

import java.io.*;
import javax.servlet.http.*;

public class ServletFileTest1 extends HttpServlet{

   public void doGet(HttpServletRequest req,HttpServletResponse res){
		try {
		    //处理中文乱码
			res.setContentType("text/html;charset=gbk");
			PrintWriter pw=res.getWriter();
			
			//创建一个FielReader
			FileReader f=new FileReader("f:\\myCount.txt");
			BufferedReader bw=new BufferedReader(f);
			//读出一行
			String numVal=bw.readLine();
			bw.close();
			pw.println("从文件中读取的数据是："+numVal);
			
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
   }
   //处理Post请求
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		
		this.doGet(req,res);
	}
}