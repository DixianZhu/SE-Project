import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import com.opensymphony.xwork2.ActionSupport;

public class LinkNode extends ActionSupport{
	private static final long serialVersionUID = 1L;
	protected static final String[][] String = null;
	private String url = "jdbc:mysql://localhost:3306/trip";
	private String user = "root";
	private String psw = "2121778";
	private String userName;
	private String passWord;
	private String intendPlace;
	private String intendTime;
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

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getPassWord(){
		return passWord;
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
				intendTime = rs.getString("i_time");
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
					String[] temp = new String[4];
					temp[0] = rs.getString("user_name");
					temp[1] = rs.getString("i_place");
					temp[2] = rs.getString("i_time");
					temp[3] = rs.getString("i_price");
					res.add(temp);
				}
				Collections.sort(res, new Comparator<String[]>(){
					@Override
					public int compare(java.lang.String[] o1,
							java.lang.String[] o2) {
						// TODO Auto-generated method stub
						return Math.abs(o1[2].compareTo(intendTime))-Math.abs(o2[2].compareTo(intendTime));
					}
				});
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