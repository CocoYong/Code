//�����ݿ��еõ�����
package com.tsinghua;

import java.sql.*;

public class ConnDB {

    private Connection ct=null;
    public Connection getConn(){
    	try{
    		//��������
			Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
			//�õ�����(���ݿ��url)
			ct=DriverManager.getConnection("jdbc:microsoft:sqlserver://127.0.0.1:1433;databaseName=spdb","sa","sa");
			
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return ct;
    }
}