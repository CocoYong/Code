//这是一个处理类（处理uers表）<---->操作UserBean
//业务逻辑在这里
package com.tsinghua;

import java.sql.*;
import java.util.*;
public class UserBeanCl {
	    
		private Connection ct=null;
		private PreparedStatement ps=null;
		private ResultSet rs=null;
		private int pageCount=0;//共有几页（计算出来的)
		
		//查找用户的头像
		public String findPic(String u){
			String b=null;
			try{
				//得到连接
				ConnDB cd=new ConnDB();
				ct=cd.getConn();
				ps=ct.prepareStatement("select top 1 myPic from users where username=?");
				
				ps.setString(1,u);
				rs=ps.executeQuery();
				
				if(rs.next()){
					b=rs.getString(1);
				}
					
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.closeOpen();
			}
			return b;
		}
		//修改用户
		public boolean updateUser(String id,String passwd,String email,String grade,String myPic){
			boolean b=false;
			String sql=null;
			try{
				//得到rowCount
				ConnDB cd=new ConnDB();
				ct=cd.getConn();
				sql="update users set passwd='"+passwd+"',email='"+email+"',grade="+grade+",myPic='"+myPic+"' where userId='"+id+"'";
				ps=ct.prepareStatement(sql);
				int num=ps.executeUpdate();
				if(num==1){
					//删除成功
					b=true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.closeOpen();
			}
			return b;
		}
		//删除用户
		public boolean delUser(String id){
			boolean b=false;
			try{
				//得到rowCount
				ConnDB cd=new ConnDB();
				ct=cd.getConn();
				String sql="delete from users where userId='"+id+"'";
				ps=ct.prepareStatement(sql);
				int num=ps.executeUpdate();
				if(num==1){
					//删除成功
					b=true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.closeOpen();
			}
			return b;
		}
		//返回pageCount
		public int getPageCount(){
			return this.pageCount;
		}
		//分页显示
		public ArrayList getResultByPage(int pageNow,int pageSize){
			ArrayList al=new ArrayList();
			try{
				int rowCount=0;//共有几条记录
			
				//得到rowCount
				ConnDB cd=new ConnDB();
				ct=cd.getConn();
				
				ps=ct.prepareStatement("select count(*) from users");
				rs=ps.executeQuery();
			
				if(rs.next()){
					rowCount=rs.getInt(1);
				}
				
				//计算pageCount
				if(rowCount%pageSize==0){
					pageCount=rowCount/pageSize;
				}else{
					pageCount=rowCount/pageSize+1;
				}
				
				ps=ct.prepareStatement("select top "+pageSize+" * from users where userId not in(select top "+pageSize*(pageNow-1)+" userId from users)");
				
				rs=ps.executeQuery();
				while(rs.next()){
					//将rs中的每条记录封装到UserBena ub中
					UserBean ub=new UserBean();
					ub.setUserId(rs.getInt(1));
					ub.setUserName(rs.getString(2));
					ub.setPasswd(rs.getString(3));
					ub.setEmail(rs.getString(4));
					ub.setGrade(rs.getInt(5));
					ub.setMyPic(rs.getString(6));
					//将ub放入到集合ArrayList中
					al.add(ub);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.closeOpen();
			}
			
			return al;
		}
		//验证用户
		public boolean checkUser(String u,String p){
			boolean b=false;
			try{
				//得到连接
				ConnDB cd=new ConnDB();
				ct=cd.getConn();
				ps=ct.prepareStatement("select top 1 passwd from users where username=?");
				
				ps.setString(1,u);
				rs=ps.executeQuery();
				
				if(rs.next()){
					String dbPasswd=rs.getString(1);
					
					if(dbPasswd.equals(p)){
						b=true;
					}
				}
					
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.closeOpen();
			}
			return b;
		}
		
		public void closeOpen(){
			try{
				if(rs!=null){
					rs.close();
					rs=null;
				}
				if(ps!=null){
					ps.close();
					ps=null;
				}
				if(ct!=null){
					ct.close();
					ct=null;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
    
    
}