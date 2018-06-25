//从数据库中得到连接
package com.tsinghua;

import java.sql.*;

public class ConnDB {

    private Connection ct=null;
    public Connection getConn(){
    	try{
    		//加载驱动
			Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
			//得到链接(数据库的url)
			ct=DriverManager.getConnection("jdbc:microsoft:sqlserver://127.0.0.1:1433;databaseName=spdb","sa","sa");
			
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return ct;
    }
}