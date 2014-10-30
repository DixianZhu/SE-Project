import java.sql.*;
import com.opensymphony.xwork2.ActionSupport;

public class Register extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String userName=null;
	private String passWord=null;
	private String realName=null;
	private String gender=null;
	private String age=null;
	private String location=null;
	private String occupation=null;
	private String hobby=null;
	private String url = "jdbc:mysql://localhost:3306/trip";
	private String user = "root";
	private String psw = "2121778";

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getPassWord() {
		return passWord;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String contact() throws Exception {
		return SUCCESS;
	}

	public String try_user_name() throws Exception {
		System.out.println("userName is " + userName);
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		if (userName.length() > 20)
			return "overflow";
		if (userName.length() < 7)
			return "usernameShort";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, psw);
			if (!conn.isClosed())
				System.out.println("Success connecting to the Database!");
			else
				System.out.println("Fail connecting to the Database!");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from member where user_name = '"
					+ userName + "'");
			if (!rs.next()) {
				return SUCCESS;
			} else {
				return "exist";
			}
		} catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}

	public String execute() throws Exception {
		System.out.println("userName is " + userName);
		Connection conn = null;
		int addCount = 0;
		Statement stmt = null;
		if (passWord.length() > 20 || realName.length() > 20
				|| age.length() > 3 || location.length() > 20
				|| occupation.length() > 20 || hobby.length() > 50) {
			return "overflow";
		}
		if (passWord.length() < 7) {
			return "passwordShort";
		}
		if (realName.length()==0){
			return "noRealName";
		}else{
			System.out.println("realname length is"+realName.length());
			System.out.println("realname is "+realName);
		}
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, psw);
			if (!conn.isClosed())
				System.out.println("Success connecting to the Database!");
			else
				System.out.println("Fail connecting to the Database!");
			stmt = conn.createStatement();
			ResultSet rs=null;
			rs = stmt.executeQuery("select * from member where user_name = '"
					+ userName + "'");
			if (rs.next()) {
				return "exist";
			}
			addCount = stmt
					.executeUpdate("insert into member(user_name,pass_word,real_name,gender,age,location,occupation,hobby)"
							+ "values('"
							+ userName
							+ "','"
							+ passWord
							+ "','"
							+ realName
							+ "','"
							+ gender
							+ "','"
							+ age
							+ "','"
							+ location
							+ "','"
							+ occupation
							+ "','"
							+ hobby
							+ "')");
			if (addCount != 0) {
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