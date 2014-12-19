import java.sql.*;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;

public class Commition extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String intendPlace;
	private String intendTime;
	private String commition;
	private String userName;
	private String realName;
	private String passWord;
	private String typeString;
	private String url = "jdbc:mysql://localhost:3306/trip";
	private String user = "root";
	private String psw = "2121778";
	private ArrayList<String[]> res = new ArrayList<String[]>();

	
	public String getTypeString(){
		return typeString;
	}
	public void setTypeString(String typeString){
		this.typeString=typeString;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}

	public void setRealName(String RealName) {
		this.realName = RealName;
	}

	public String getRealName() {
		return realName;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setCommition(String commition) {
		this.commition = commition;
	}

	public String getCommition() {
		return commition;
	}

	public ArrayList<String[]> getRes() {
		return res;
	}

	public void setIntendPlace(String intendPlace) {
		this.intendPlace = intendPlace;
	}

	public String getIntendPlace() {
		return intendPlace;
	}

	public void setIntendTime(String intendTime) {
		this.intendTime = intendTime;
	}

	public String getIntendTime() {
		return intendTime;
	}

	public String contactUserName() throws Exception {
		System.out.println("contact :" + userName);
		return SUCCESS;
	}

	public String showCommition() throws Exception {
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		System.out.println("i1:The userName is:" + userName);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, psw);
			if (!conn.isClosed())
				System.out.println("Success connecting to the Database!");
			else
				System.out.println("Fail connecting to the Database!");
			stmt = conn.createStatement();
			rs = stmt
					.executeQuery("select * from commition where user_name = '"
							+ userName + "'");
			if (rs.next()) {
				do {
					String[] temp = new String[4];
					temp[0] = rs.getString("real_name");
					temp[1] = rs.getString("i_place");
					System.out.println(temp[0]);
					temp[2] = rs.getString("i_time");
					temp[3] = rs.getString("commition");
					res.add(temp);
				} while (rs.next());
			}
			return SUCCESS;
		} catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}

	public String addCommition() throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int markInsert = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, psw);
			if (!conn.isClosed())
				System.out.println("Success connecting to the Database!");
			else
				System.out.println("Fail connecting to the Database!");
			stmt = conn.createStatement();
			ResultSet rs = null;
			rs = stmt
					.executeQuery("select * from member where user_name = '"
							+ userName + "'");
			rs.next();
			realName = rs.getString("real_name");
			rs = stmt.executeQuery("select * from commition where user_name = '"
					+ userName + "' and real_name='" + realName + "' and i_place='" + intendPlace + "' and i_time='" + intendTime + "' and commition='" + commition + "'");
			if(rs.next()){	
				showCommition();
				typeString="已经存在完全相同的评论";
				return "exist";
			}
			markInsert = stmt
					.executeUpdate("insert into commition(user_name,real_name,i_place,i_time,commition)"
							+ "values('"
							+ userName
							+ "','"
							+ realName
							+ "','"
							+ intendPlace
							+ "','"
							+ intendTime
							+ "','"
							+ commition + "')");
			if (markInsert != 0) {
				System.out.println("typeString :" + typeString);
				if(typeString!=null && typeString.equals("moreOthersCommition")){
					moreOthersCommition();
					return "moreOthersCommition";
				}
				else{
					showCommition();
					typeString="成功添加评论";
					return SUCCESS;
				}
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}

	public String deleteCommition() throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int deleteCount = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, psw);
			if (!conn.isClosed())
				System.out.println("Success connecting to the Database!");
			else
				System.out.println("Fail connecting to the Database!");
			stmt = conn.createStatement();
			deleteCount = stmt
					.executeUpdate("delete from commition where user_name = '" + userName
							+ "' and i_place='" + intendPlace + "' and i_time='" + intendTime + "' and commition='" + commition + "'");
			System.out.println("deleteCount = "+deleteCount);
			if (deleteCount != 0) {
				typeString="删除成功";
				System.out.println("realName="+realName);
				if(realName.equals("More")){
					moreOthersCommition();
					System.out.println("others");
					return "others";
				}else{
					showCommition();
					System.out.println("success");
					return SUCCESS;
				}
			}
			return ERROR;
		} catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}
	public String showOthersCommition() throws Exception {
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
			rs = stmt
					.executeQuery("select distinct i_place from commition");
			if (rs.next()) {
				do {
					String []temp = new String[1];
					temp[0]=rs.getString("i_place");
					res.add(temp);
				} while (rs.next());
			}
			return SUCCESS;
		} catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}
	public String moreOthersCommition() throws Exception {
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
			rs = stmt
					.executeQuery("select * from commition where i_place = '"
							+ intendPlace + "'");
			if (rs.next()) {
				do {
					String[] temp = new String[5];
					temp[0] = rs.getString("real_name");
					temp[1] = rs.getString("i_place");
					System.out.println(temp[0]);
					temp[2] = rs.getString("i_time");
					temp[3] = rs.getString("commition");
					if(rs.getString("user_name").equals(userName)) temp[4]="删除";
					res.add(temp);
				} while (rs.next());
			}
			typeString="moreOthersCommition";
			return SUCCESS;
		} catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}
}