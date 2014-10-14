import java.sql.*;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;

public class LinkNode extends ActionSupport{
	private String url = "jdbc:mysql://localhost:3306/trip";
	private String user = "root";
	private String psw = "2121778";
	private String userName;
	private String intendPlace;
	private String intendTimeFloor;
	private String intendTimeCeiling;
	private String intendPrice;
	private String intendFriendAge;
	private String intendFriendGender;
	private String intendFriendOccupation;
	private String intendFriendLocation;
	private String intendFriendHobby;
	private ArrayList<String[]> res = new ArrayList<String[]>();

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
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


	public String addLink() {
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
					.executeQuery("select * from intention where user_name = '"
							+ userName + "'and i_Place = '" + intendPlace + "'");
			if (rs.next()) {
				intendPlace = rs.getString("i_place");
				intendTimeFloor = rs.getString("i_time_floor");
				intendTimeCeiling = rs.getString("i_time_ceiling");
				intendPrice = rs.getString("i_price");
				intendFriendAge = rs.getString("i_friend_age");
				intendFriendGender = rs.getString("i_friend_gender");
				intendFriendLocation = rs.getString("i_friend_location");
				intendFriendOccupation = rs.getString("i_friend_occupation");
				intendFriendHobby = rs.getString("i_friend_hobby");
				rs = stmt
						.executeQuery("select * from intention where i_Place = '"
								+ intendPlace
								+ "' and user_name != '"
								+ userName + "'");
				boolean flag=false;
				while (rs.next()) {
					flag=true;
					String[] temp = new String[5];
					temp[0] = rs.getString("user_name");
					temp[1] = rs.getString("i_place");
					temp[2] = rs.getString("i_time_floor");
					temp[3] = rs.getString("i_time_ceiling");
					temp[4] = rs.getString("i_Price");
					res.add(temp);
				}
				if(!flag){
					return "noRes";
				}
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