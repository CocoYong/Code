//如何读取Cookie案例
package com.tsinghua;

import javax.servlet.http.*;
import java.io.*;

public class CookieTest2 extends HttpServlet{

    //处理get请求
    public void doGet(HttpServletRequest req,HttpServletResponse res){
    	try{
    		res.setContentType("text/html;charset=gbk");
    		PrintWriter pw=res.getWriter();
    		
    		//从客户端得到所有的cookie信息
    		Cookie []allCookies=req.getCookies();
    		
    		int i=0;
    		if(allCookies!=null){
    			//从中读取Cookie
    			for(i=0;i<allCookies.length;i++){
    				//依次取出
    				Cookie temp=allCookies[i];
    				if(temp.getName().equals("color1")){
    					//得到Cookie的值
    					String val=temp.getValue();
    					
    					pw.println("color1="+val);
    					break;
    				}
    			}
    			if(allCookies.length==i){
    				pw.println("Cookie过期！");
    			}
    			
    		}else{
    			pw.println("不存在color1这个Cookie或是过期！");
    		}
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }  
}