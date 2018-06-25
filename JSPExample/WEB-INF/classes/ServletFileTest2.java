//演示如何在Servlet中操作文件
//演示如何读取文件的内容
package com.tsinghua;

import java.io.*;
import javax.servlet.http.*;

public class ServletFileTest2 extends HttpServlet{

   public void doGet(HttpServletRequest req,HttpServletResponse res){
		try {
		    //处理中文乱码
			res.setContentType("text/html;charset=gbk");
			PrintWriter pw=res.getWriter();
			
			//创建一个FielReader
			//内存数据->磁盘文件（写入，输出流）
			//内存数据<-磁盘文件（读入，输入流）
			FileWriter f=new FileWriter("f:\\myCount.txt");
			BufferedWriter bw=new BufferedWriter(f);
			//读出一行
			bw.write("123432");
			bw.close();
			pw.println("在文件中写入的数据");
			
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