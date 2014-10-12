import java.sql.*;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;

public class Intention extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String intendPlace;
	private String intendTimeFloor;
	private String intendTimeCeiling;
	private String intendPrice;
	private String intendFriendAge;
	private String intendFriendGender;
	private String intendFriendOccupation;
	private String intendFriendLocation;
	private String intendFriendHobby;
	private String userName;
	private String url = "jdbc:mysql://localhost:3306/trip";
	private String user = "root";
	private String psw = "2121778";
	private ArrayList<String[]> res = new ArrayList<String[]>();

	public void setIntendPlace(String intendPlace) {
		this.intendPlace = intendPlace;
	}

	public String getIntendPlace() {
		return intendPlace;
	}

	public void setIntendTimeFloor(String intendTimeFloor) {
		this.intendTimeFloor = intendTimeFloor;
	}

	public String getIntendTimeFloor() {
		return intendTimeFloor;
	}

	public void setIntendTimeCeiling(String intendTimeCeiling) {
		this.intendTimeCeiling = intendTimeCeiling;
	}

	public String getIntendTimeCeiling() {
		return intendTimeCeiling;
	}

	public void setIntendPrice(String intendPrice) {
		this.intendPrice = intendPrice;
	}

	public String getIntendPrice() {
		return intendPrice;
	}

	public void setIntendFriendAge(String intendFriendAge) {
		this.intendFriendAge = intendFriendAge;
	}

	public String getIntendFriendAge() {
		return intendFriendAge;
	}

	public void setIntendFriendGender(String intendFriendGender) {
		this.intendFriendGender = intendFriendGender;
	}

	public String getIntendFriendGender() {
		return intendFriendGender;
	}

	public void setIntendFriendOccupation(String intendFriendOccupation) {
		this.intendFriendOccupation = intendFriendOccupation;
	}

	public String getIntendFriendOccupation() {
		return intendFriendOccupation;
	}

	public void setIntendFriendLocation(String intendFriendLocation) {
		this.intendFriendLocation = intendFriendLocation;
	}

	public String getIntendFriendLocation() {
		return intendFriendLocation;
	}

	public void setIntendFriendHobby(String intendFriendHobby) {
		this.intendFriendHobby = intendFriendHobby;
	}

	public String getIntendFriendHobby() {
		return intendFriendHobby;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}
	
	public ArrayList<String[]> getRes(){
		return res;
	}
	
	
	
    public String contactUserName() throws Exception{
    	return SUCCESS;
    }
    public String showIntentionOne() throws Exception{
    	Connection conn = null;
		ResultSet rs=null;
		Statement stmt = null;
		System.out.println("The userName is:"+userName);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, psw);
			if (!conn.isClosed())
				System.out.println("Success connecting to the Database!");
			else
				System.out.println("Fail connecting to the Database!");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from intention where user_name = '"
					+ userName + "'");
			String[] temp=new String[3];
	        if(rs.next()){
	        	do{
	        		temp[0]=rs.getString("i_place");
	        		temp[1]=rs.getString("i_time_floor");
	        		temp[2]=rs.getString("i_time_ceiling");
	        		res.add(temp);
	        	}while(rs.next());
	        	return SUCCESS;
	        }else{
	        	return ERROR;
	        }
		} catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
    }
	public String addIntention() throws Exception {
		Connection conn = null;
		int addCount = 0;
		Statement stmt = null;
		System.out.println("The userName is:"+userName);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, psw);
			if (!conn.isClosed())
				System.out.println("Success connecting to the Database!");
			else
				System.out.println("Fail connecting to the Database!");
			stmt = conn.createStatement();
			addCount = stmt
					.executeUpdate("insert into intention(user_name,i_place,i_time_floor,i_time_ceiling,i_price,i_friend_gender,i_friend_age,i_friend_location,i_friend_occupation,i_friend_hobby)"
							+ "values('"
							+ userName
							+ "','"
							+ intendPlace
							+ "','"
							+ intendTimeFloor
							+ "','"
							+ intendTimeCeiling
							+ "','"
							+ intendPrice
							+ "','"
							+ intendFriendGender
							+ "','"
							+ intendFriendAge
							+ "','"
							+ intendFriendLocation
							+ "','"
							+ intendFriendOccupation
							+ "','"
							+ intendFriendHobby + "')");
			if(addCount==1) return SUCCESS;
			else return ERROR;
		} catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}
}