//�û���֤

package com.tsinghua;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class LoginCl extends HttpServlet{

	//��дinit����
	public void init(){
		try {
			//ֻ�ᱻ����һ��
			//�����ҳ���ʴ����Ĺ���
			//����һ��FielReader
			FileReader f=new FileReader("f:\\myCount.txt");
			BufferedReader br=new BufferedReader(f);
			//����һ��
			String numVal=br.readLine();
			br.close();
			
			//��timesֵ���뵽servletcontext��
			this.getServletContext().setAttribute("visitTimes",numVal);
    		System.out.print("init������");
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	//��дdestroy����
	public void destroy(){
		try {
			
			//�ٽ��µĴ���д��ȥ
			FileWriter w=new FileWriter("f:\\myCount.txt");
			BufferedWriter bw=new BufferedWriter(w);
			//����һ��
			bw.write(this.getServletContext().getAttribute("visitTimes").toString());
			bw.close();
				
    		System.out.println("destroy����������");
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
   //����get����
	//req:���ڻ�ÿͻ��ˣ������������Ϣ
	//res:������ͻ��ˣ��������������Ϣ
	public void doGet(HttpServletRequest req,HttpServletResponse res){
		
		//����ҵ���߼�
		Connection ct=null;
		Statement sm=null;
		ResultSet rs=null;

		try{
			String u=req.getParameter("username");
			String p=req.getParameter("passwd");
			
			//����UserBeanCl,1������һ������
			UserBeanCl ubc=new UserBeanCl();

			//2�� ʹ��UserBeanCl�ķ���
			if(ubc.checkUser(u,p)){
				//�û�����
				String keep=req.getParameter("keep");
					
				if(keep!=null){
						
					//���û��������뱣���ڿͻ��ˣ�Cookie����
					//����Cookie
					Cookie name=new Cookie("myname",u);
					Cookie pass=new Cookie("mypasswd",p);
					//����ʱ��
					 name.setMaxAge(14*24*3600);
					 pass.setMaxAge(14*24*3600);
					 //��д���ͻ���
					 res.addCookie(name);
					 res.addCookie(pass);
				}
				//����֤�ɹ�����Ϣд��session
				//�õ�session
				HttpSession hs=req.getSession(true);
				//�޸�session���ڵ�ʱ��
				hs.setMaxInactiveInterval(60);//�÷����������
				hs.setAttribute("uname",u);
				
				//��servletcontext�е�visittimes�����ж�Ӧ��ֵ++
				int Times=Integer.parseInt(this.getServletContext().getAttribute("visitTimes").toString());
				Times++;
				this.getServletContext().setAttribute("visitTimes",Times+"");
				//��ת
				res.sendRedirect("main");//дurl
								
			}else{
				//���Ϸ�
				//��ת
				res.sendRedirect("login");
			}	
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				
				if(rs!=null){
					rs.close();
				}
				if(sm!=null){
					sm.close();
				}
				if(ct!=null){
					ct.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	//����Post����
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		
		this.doGet(req,res);
	}
    
    
}