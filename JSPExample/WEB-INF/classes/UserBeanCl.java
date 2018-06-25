//����һ�������ࣨ����uers��<---->����UserBean
//ҵ���߼�������
package com.tsinghua;

import java.sql.*;
import java.util.*;
public class UserBeanCl {
	    
		private Connection ct=null;
		private PreparedStatement ps=null;
		private ResultSet rs=null;
		private int pageCount=0;//���м�ҳ�����������)
		
		//�����û���ͷ��
		public String findPic(String u){
			String b=null;
			try{
				//�õ�����
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
		//�޸��û�
		public boolean updateUser(String id,String passwd,String email,String grade,String myPic){
			boolean b=false;
			String sql=null;
			try{
				//�õ�rowCount
				ConnDB cd=new ConnDB();
				ct=cd.getConn();
				sql="update users set passwd='"+passwd+"',email='"+email+"',grade="+grade+",myPic='"+myPic+"' where userId='"+id+"'";
				ps=ct.prepareStatement(sql);
				int num=ps.executeUpdate();
				if(num==1){
					//ɾ���ɹ�
					b=true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.closeOpen();
			}
			return b;
		}
		//ɾ���û�
		public boolean delUser(String id){
			boolean b=false;
			try{
				//�õ�rowCount
				ConnDB cd=new ConnDB();
				ct=cd.getConn();
				String sql="delete from users where userId='"+id+"'";
				ps=ct.prepareStatement(sql);
				int num=ps.executeUpdate();
				if(num==1){
					//ɾ���ɹ�
					b=true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.closeOpen();
			}
			return b;
		}
		//����pageCount
		public int getPageCount(){
			return this.pageCount;
		}
		//��ҳ��ʾ
		public ArrayList getResultByPage(int pageNow,int pageSize){
			ArrayList al=new ArrayList();
			try{
				int rowCount=0;//���м�����¼
			
				//�õ�rowCount
				ConnDB cd=new ConnDB();
				ct=cd.getConn();
				
				ps=ct.prepareStatement("select count(*) from users");
				rs=ps.executeQuery();
			
				if(rs.next()){
					rowCount=rs.getInt(1);
				}
				
				//����pageCount
				if(rowCount%pageSize==0){
					pageCount=rowCount/pageSize;
				}else{
					pageCount=rowCount/pageSize+1;
				}
				
				ps=ct.prepareStatement("select top "+pageSize+" * from users where userId not in(select top "+pageSize*(pageNow-1)+" userId from users)");
				
				rs=ps.executeQuery();
				while(rs.next()){
					//��rs�е�ÿ����¼��װ��UserBena ub��
					UserBean ub=new UserBean();
					ub.setUserId(rs.getInt(1));
					ub.setUserName(rs.getString(2));
					ub.setPasswd(rs.getString(3));
					ub.setEmail(rs.getString(4));
					ub.setGrade(rs.getInt(5));
					ub.setMyPic(rs.getString(6));
					//��ub���뵽����ArrayList��
					al.add(ub);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.closeOpen();
			}
			
			return al;
		}
		//��֤�û�
		public boolean checkUser(String u,String p){
			boolean b=false;
			try{
				//�õ�����
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