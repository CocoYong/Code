//这是第二中开发servlet的方法（继承GenericServlet开发）

package com.tsinghua;

import javax.servlet.GenericServlet;
import javax.servlet.*;
import java.io.*;


public class HelloGen extends GenericServlet{
	//重写service方法即可

    public void service(ServletRequest req,ServletResponse res){
    	//返回hello，world！generic
    	try{
    		PrintWriter pw=res.getWriter();
    		pw.println("hello,world!generic");
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
    }
    
    
}