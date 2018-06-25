//这是一个UserBean<---->users表映射
//他的一个对象<---->useres表的一条记录
//数据

package com.tsinghua;


public class UserBean {

    private int userId;
    private String userName;
    private String passwd;
    private String email;
    private int grade;
    private String myPic;

	
	public void setUserId(int userId) {
		this.userId = userId; 
	}

	public int getUserId() {
		return (this.userId); 
	}

	
	public void setUserName(String userName) {
		this.userName = userName; 
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd; 
	}

	public void setEmail(String email) {
		this.email = email; 
	}

	public void setGrade(int grade) {
		this.grade = grade; 
	}

	public void setMyPic(String myPic) {
		this.myPic = myPic; 
	}

	public String getUserName() {
		return (this.userName); 
	}

	public String getPasswd() {
		return (this.passwd); 
	}

	public String getEmail() {
		return (this.email); 
	}

	public int getGrade() {
		return (this.grade); 
	}

	public String getMyPic() {
		return (this.myPic); 
	}


}
	

	

	
