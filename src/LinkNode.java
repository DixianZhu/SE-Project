import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import com.opensymphony.xwork2.ActionSupport;

public class LinkNode extends ActionSupport {
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
	private String typeString;
	private String teamName;
	
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

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getPassWord() {
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
				teamName=rs.getString("team_username");
				rs = stmt
						.executeQuery("select * from intention where i_Place = '"
								+ intendPlace
								+ "' and user_name != '"
								+ userName + "'");

				boolean flag = false;
				while (rs.next()) {
					flag = true;
					String[] temp = new String[5];
					temp[0] = rs.getString("user_name");
					temp[1] = rs.getString("i_place");
					temp[2] = rs.getString("i_time");
					temp[3] = rs.getString("i_price");
					temp[4] = rs.getString("team_username");
					res.add(temp);
				}
				Collections.sort(res, new Comparator<String[]>() {
					@Override
					public int compare(java.lang.String[] o1,
							java.lang.String[] o2) {
						// TODO Auto-generated method stub
						return Math.abs(o1[2].compareTo(intendTime))
								- Math.abs(o2[2].compareTo(intendTime));
					}
				});
				if (!flag) {
					return "noRes";
				}
				typeString="匹配结果";
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

	public String showTeam() {
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		System.out.println(typeString);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, psw);
			if (!conn.isClosed())
				System.out.println("Success connecting to the Database!");
			else
				System.out.println("Fail connecting to the Database!");
			stmt = conn.createStatement();
			rs = stmt
					.executeQuery("select * from intention where team_username = '"
							+ teamName + "'and i_Place = '" + intendPlace + "'");
			while (rs.next()) {
				String[] temp = new String[5];
				temp[0] = rs.getString("user_name");
				temp[1] = rs.getString("i_place");
				temp[2] = rs.getString("i_time");
				temp[3] = rs.getString("i_price");
				temp[4] = rs.getString("team_username");
				res.add(temp);
			}
			if(teamName==null){
				typeString="暂无队伍";
			}else{
				typeString="队伍成员";
			}
			return SUCCESS;
		} catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}
	public String quitTeam(){
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, psw);
			if (!conn.isClosed())
				System.out.println("Success connecting to the Database!");
			else
				System.out.println("Fail connecting to the Database!");
			stmt = conn.createStatement();
			int deleteCount=0;
			deleteCount=stmt
				.executeUpdate("update intention set team_username = null where user_name = '"
							+ userName + "' and i_place='" + intendPlace + "'");
			System.out.println(deleteCount);
			if (deleteCount==1) {
				typeString="退出队伍成功";
				teamName=null;
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
	public String addTeam() {
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
			if(rs.next()){
				String temp=rs.getString("team_username");
				if(temp!=null){
					teamName=temp;
					showTeam();
					typeString="已存在队伍！请先退出队伍再加入新队伍";
					return "existTeam";
				}
			}
			rs = stmt
					.executeQuery("select * from intention where user_name = '"
							+ teamName + "'and i_Place = '" + intendPlace + "'");
			if (rs.next()) {
				String temp = rs.getString("team_username");
				if (temp == null) {
					stmt.executeUpdate("update intention set team_username = '"
							+ teamName + "' where user_name = '" + teamName
							+ "'");
				} else {
					teamName=temp;
				}
				stmt.executeUpdate("update intention set team_username = '"
						+ teamName + "' where user_name = '" + userName + "'");
				showTeam();
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