import java.sql.*;

import com.opensymphony.xwork2.ActionSupport;

public class Login extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String userName;
	private String passWord;
	private String realName;
	private String gender;
	private String age;
	private String location;
	private String occupation;
	private String hobby;
	private String url = "jdbc:mysql://localhost:3306/trip";
	private String user = "root";
	private String psw = "2121778";
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserName(){
		return userName;
	}
	
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getPassWord(){
		return passWord;
	}
	
	public String getRealName(){
		return realName;
	}
	
	public String getGender(){
		return gender;
	}
	public void setGender(String gender){
		this.gender=gender;
	}
	public void setRealName(String realName){
		this.realName=realName;
	}
	
	public String getAge(){
		return age;
	}
	
	public String getLocation(){
		return location;
	}
	
	public String getOccupation(){
		return occupation;
	}
	
	public String getHobby(){
		return hobby;
	}
	
	public String index() throws Exception{
		return SUCCESS;
	}
	public String login(){
		return SUCCESS;
	}
	public String contactUserName() throws Exception {
		System.out.println("contact :"+userName);
		return SUCCESS;
	}
	public String seeOthersInfo() throws Exception {
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, psw);
			if (!conn.isClosed())
				System.out.println("Success connecting to the Database!");
			else
				System.out.println("Fail connecting to the Database!");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from member where user_name = '"
					+ userName + "'");
			if(rs.next()){
				realName=rs.getString("real_name");
				gender=rs.getString("gender");
				age=rs.getString("age");
				location=rs.getString("location");
				occupation=rs.getString("occupation");
				hobby=rs.getString("hobby");
				System.out.println("login :The realName is :"+realName);
				System.out.println("login :The age is :"+age);
				System.out.println("login :The userName is :"+userName);
				return SUCCESS;
			}else{
				return "wrongPassword";
			}
		}catch (Exception e) {
			System.out.println("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}
	public String execute() throws Exception {
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, psw);
			if (!conn.isClosed())
				System.out.println("Success connecting to the Database!");
			else
				System.out.println("Fail connecting to the Database!");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from member where user_name = '"
					+ userName + "'");
			if(!rs.next()){
				return "noAccount";
			}
			rs = stmt.executeQuery("select * from member where user_name = '"
					+ userName + "' and pass_word = '" + passWord + "'");
			if(rs.next()){
				realName=rs.getString("real_name");
				gender=rs.getString("gender");
				age=rs.getString("age");
				location=rs.getString("location");
				occupation=rs.getString("occupation");
				hobby=rs.getString("hobby");
				System.out.println("login :The userName is :"+userName);
				return SUCCESS;
			}else{
				return "wrongPassword";
			}
		}catch (Exception e) {
			System.out.println("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}
}