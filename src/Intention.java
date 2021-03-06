import java.sql.*;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;

public class Intention extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String intendPlace;
	private String intendTime;
	private String intendPrice;
	private String intendFriendAge;
	private String intendFriendGender;
	private String intendFriendOccupation;
	private String intendFriendLocation;
	private String intendFriendHobby;
	private String teamName;
	private String tempUserName;
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
	private String typeString;
	private String apply1;
	private String apply2;
	private String apply3;
	private String invite1;
	private String invite2;
	private String invite3;
	private String word;
	
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
	public String getApply1(){
		return apply1;
	}
	public String getApply2(){
		return apply2;
	}
	public String getApply3(){
		return apply3;
	}
	public void setApply1(String apply1){
		this.apply1=apply1;
	}
	public void setApply2(String apply2){
		this.apply2=apply2;
	}
	public void setApply3(String apply3){
		this.apply3=apply3;
	}
	public String getInvite1(){
		return invite1;
	}
	public String getInvite2(){
		return invite2;
	}
	public String getInvite3(){
		return invite3;
	}
	public void setInvite1(String invite1){
		this.invite1=invite1;
	}
	public void setInvite2(String invite2){
		this.invite2=invite2;
	}
	public void setInvite3(String invite3){
		this.invite3=invite3;
	}
	private ArrayList<String[]> res = new ArrayList<String[]>();
	private ArrayList<String[]> applySet = new ArrayList<String[]>();
	private ArrayList<String[]> inviteSet = new ArrayList<String[]>();
	private ArrayList<String[]> broadcast = new ArrayList<String[]>();
	public String getWord(){
		return word;
	}
	public void setWord(String word){
		this.word=word;
	}
	public String getTypeString(){
		return typeString;
	}
	public void setTypeString(String typeString){
		this.typeString=typeString;
	}
	public void setTeamName(String teamName){
		this.teamName=teamName;
	}
	public String getTeamName(){
		return teamName;
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

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}
	public void setTempUserName(String tempUserName) {
		this.tempUserName = tempUserName;
	}

	public String getTempUserName() {
		return tempUserName;
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
	public ArrayList<String[]> getApplySet() {
		return applySet;
	}
	public ArrayList<String[]> getInviteSet() {
		return inviteSet;
	}
	public ArrayList<String[]> getBroadcast(){
		return broadcast;
	}

	public String contactUserName() throws Exception {
		System.out.println("contact :"+userName);
		return SUCCESS;
	}
	
	public String seeOthersInfo() throws Exception {
		System.out.println("tempUserName is :"+tempUserName);
		System.out.println("passWord is :"+passWord);
		System.out.println();
		Login tempL=new Login();
		tempL.setUserName(userName);
		tempL.seeOthersInfo();
		this.realName=tempL.getRealName();
		this.gender=tempL.getGender();
		this.age=tempL.getAge();
		this.location=tempL.getLocation();
		this.occupation=tempL.getOccupation();
		this.hobby=tempL.getHobby();
		System.out.println("intention :The realName is :"+realName);
		System.out.println("intention :The age is :"+age);
		showIntentionOne();
		return SUCCESS;
	}
	public String showIntentionOne() throws Exception {
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
					.executeQuery("select * from intention where user_name = '"
							+ userName + "'");
			if (rs.next()) {
				do {
					String[] temp = new String[2];
					temp[0] = rs.getString("i_place");
					System.out.println(temp[0]);
					temp[1] = rs.getString("i_time");
					res.add(temp);
				} while (rs.next());
				return SUCCESS;
			} else {
				return "noIntention";
			}
		} catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}

	public String showIntentionTwo() throws Exception {
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		System.out.println("i2:The userName is:" + userName);
		System.out.println("i2:The intendPlace is:" + intendPlace);
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
				apply1 = rs.getString("apply1");
				apply2 = rs.getString("apply2");
				apply3 = rs.getString("apply3");
				invite1= rs.getString("invite1");
				invite2= rs.getString("invite2");
				invite3= rs.getString("invite3");
				rs = stmt
						.executeQuery("select * from intention where (apply1 = '"
								+ userName + "' or apply2 = '" + userName + "' or apply3 = '" + userName + "') and i_Place = '" + intendPlace + "'");
				while(rs.next()){
					String []temp = new String[2];
					temp[0]=rs.getString("user_name");
					temp[1]=rs.getString("i_time");
					applySet.add(temp);
				}
				rs = stmt
						.executeQuery("select * from intention where (invite1 = '"
								+ userName + "' or invite2 = '" + userName + "' or invite3 = '" + userName + "') and i_Place = '" + intendPlace + "'");
				while(rs.next()){
					String []temp = new String[2];
					temp[0]=rs.getString("user_name");
					temp[1]=rs.getString("i_time");
					inviteSet.add(temp);
				}
				typeString="查看旅游意向";
				rs = stmt
						.executeQuery("select * from chat where team_username = '"
								+ teamName + "'and i_Place = '" + intendPlace + "'");
				int count=0;
				while(rs.next())
				{
					count++;
					String []temp = new String[2];
					temp[0]=rs.getString("user_name");
					temp[1]=rs.getString("word");
					broadcast.add(temp);
				}
				if(count>10)
				{
					return deleteChat(broadcast.get(0));
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
	private String deleteChat(String[] dWord) throws Exception{
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
			deleteCount=stmt.executeUpdate("delete from chat where user_name = '"
					+ dWord[0] + "' and i_place = '" + intendPlace + "' and team_username = '" + teamName + "' and word ='" + dWord[1] + "'");
			System.out.println(deleteCount);
			if (deleteCount != 0) {
				return SUCCESS;
			} else {
				return ERROR;
			}
		}catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}
    public String addChat() throws Exception{
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
			int count=0;
			count=stmt.executeUpdate("insert into chat(user_name,team_username,i_place,word)"
			+ "values('"
			+ userName
			+ "','"
			+ teamName
			+ "','"
			+ intendPlace
			+ "','"
			+ word + "')");
			if(count==0) return ERROR;
			return showIntentionTwo();
		}catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
    }
	public String deleteIntention() throws Exception {
		Connection conn = null;
		int deleteCount = 0;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, psw);
			if (!conn.isClosed())
				System.out.println("Success connecting to the Database!");
			else
				System.out.println("Fail connecting to the Database!");
			stmt = conn.createStatement();
			deleteCount = stmt.executeUpdate("delete from intention where user_name = '"
					+ userName + "' and i_place = '" + intendPlace + "'");
			System.out.println(deleteCount);
			if (deleteCount != 0) {
				showIntentionOne();
				return SUCCESS;
			} else {
				return ERROR;
			}
		}catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}
	
	
	public String addIntention() throws Exception {
		Connection conn = null;
		int addCount = 0;
		Statement stmt = null;
		System.out.println("The userName is:" + userName);
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
					.executeQuery("select * from intention where user_name = '"
							+ userName + "'and i_Place = '" + intendPlace + "'");
			if (rs.next()) {
				return "exist";
			}
		
			addCount = stmt
					.executeUpdate("insert into intention(user_name,i_place,i_time,i_price,i_friend_gender,i_friend_age,i_friend_location,i_friend_occupation,i_friend_hobby)"
							+ "values('"
							+ userName
							+ "','"
							+ intendPlace
							+ "','"
							+ intendTime
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
			if (addCount == 1){
				typeString="成功添加旅游意向";
				return SUCCESS;
			}
			else
				return ERROR;
		} catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}
}