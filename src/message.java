import java.sql.*;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
public class message extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String userName = null;
	private String message = null;
	private String url = "jdbc:mysql://localhost:3306/trip";
	private String user = "root";
	private String psw = "2121778";
	private ArrayList<String[]> res = new ArrayList<String[]>();
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserName() {
		return userName;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessge() {
		return message;
	}
	public ArrayList<String[]> getRes() {
		return res;
	}
	public String showMessage() throws Exception {
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, psw);
			if (!conn.isClosed())
				System.out.println("Success connecting to the Database!");
			else
				System.out.println("Fail connecting to the Database!");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from message;");
			while(rs.next()) {
				String[] temp = new String[2];
				temp[0] = rs.getString("user_name");
				temp[1] = rs.getString("message");
				res.add(temp);
			} 
			return SUCCESS;
		} catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}
	public String addMessage() throws Exception {
		System.out.println("userName is " + userName);
		Connection conn = null;
		int addCount = 0;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, psw);
			if (!conn.isClosed())
				System.out.println("Success connecting to the Database!");
			else
				System.out.println("Fail connecting to the Database!");
			stmt = conn.createStatement();
			addCount = stmt
					.executeUpdate("insert into message(user_name,message)"
							+ "values('"
							+ userName
							+ "','"
							+ message
							+ "')");
			if (addCount != 0) {
				showMessage();
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}
}