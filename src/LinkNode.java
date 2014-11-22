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
	private String apply1;
	private String apply2;
	private String apply3;
	private String invite1;
	private String invite2;
	private String invite3;
	private String addTeamFlag;
	private int clearFlag;
	private String clearType;
	private ArrayList<String[]> applySet = new ArrayList<String[]>();
	private ArrayList<String[]> inviteSet = new ArrayList<String[]>();
	private ArrayList<String[]> res = new ArrayList<String[]>();

	public void setClearFlag(String clearFlag) {
		this.clearFlag = Integer.parseInt(clearFlag);
	}

	public int getClearFlag() {
		return clearFlag;
	}

	public void setClearType(String clearType){
		this.clearType=clearType;
	}
	public String getClearType(){
		return clearType;
	}
	public ArrayList<String[]> getApplySet() {
		return applySet;
	}

	public ArrayList<String[]> getInviteSet() {
		return inviteSet;
	}

	public void setApplySet(ArrayList<String[]> applySet) {
		this.applySet = applySet;
	}

	public void setInviteSet(ArrayList<String[]> inviteSet) {
		this.inviteSet = inviteSet;
	}

	public String getAddTeamFlag() {
		return addTeamFlag;
	}

	public void setAddTeamFlag(String addTeamFlag) {
		this.addTeamFlag = addTeamFlag;
	}

	public String getApply1() {
		return apply1;
	}

	public String getApply2() {
		return apply2;
	}

	public String getApply3() {
		return apply3;
	}

	public void setApply1(String apply1) {
		this.apply1 = apply1;
	}

	public void setApply2(String apply2) {
		this.apply2 = apply2;
	}

	public void setApply3(String apply3) {
		this.apply3 = apply3;
	}

	public String getInvite1() {
		return invite1;
	}

	public String getInvite2() {
		return invite2;
	}

	public String getInvite3() {
		return invite3;
	}

	public void setInvite1(String invite1) {
		this.invite1 = invite1;
	}

	public void setInvite2(String invite2) {
		this.invite2 = invite2;
	}

	public void setInvite3(String invite3) {
		this.invite3 = invite3;
	}

	public String getTypeString() {
		return typeString;
	}

	public void setTypeString(String typeString) {
		this.typeString = typeString;
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
				apply1 = rs.getString("apply1");
				apply2 = rs.getString("apply2");
				apply3 = rs.getString("apply3");
				invite1 = rs.getString("invite1");
				invite2 = rs.getString("invite2");
				invite3 = rs.getString("invite3");
				teamName = rs.getString("team_username");
				rs = stmt
						.executeQuery("select * from intention where i_Place = '"
								+ intendPlace
								+ "' and user_name != '"
								+ userName + "'");

				boolean flag = false;
				while (rs.next()) {
					flag = true;
					String[] temp = new String[7];
					temp[0] = rs.getString("user_name");
					temp[1] = rs.getString("i_place");
					temp[2] = rs.getString("i_time");
					temp[3] = rs.getString("i_price");
					temp[4] = rs.getString("team_username");
					if (teamName != null) {// ����Լ����ж��� �˴��������߼�
						temp[5] = null;
					} else {// ����Լ�û�ж���
						temp[5] = "�������";
						if (apply1 != null && apply2 != null && apply3 != null) {
							temp[5] = "��������ﵽ����";
						}
						String tempTeamName = temp[4] == null ? temp[0]
								: temp[4];
						if (apply1 != null && apply1.equals(tempTeamName)) {// ����Ѿ���������򲻿�������
							temp[5] = "�ѷ�������";
						} else if (apply2 != null
								&& apply2.equals(tempTeamName)) {
							temp[5] = "�ѷ�������";
						} else if (apply3 != null
								&& apply3.equals(tempTeamName)) {
							temp[5] = "�ѷ�������";
						}

					}
					if (temp[4] == null) {
						if ((invite1 == null || invite1 != null
								&& !invite1.equals(temp[0]))
								&& (invite2 == null || invite2 != null
										&& !invite2.equals(temp[0]))
								&& (invite3 == null || invite3 != null
										&& !invite3.equals(temp[0])))
							temp[6] = "�������";// ����Է�û�ж��飬�˴��������߼�
						else
							temp[6] = "�ѷ�������";// ����Է�û�ж��飬�˴��������߼�
						if (invite1 != null && invite2 != null
								&& invite3 != null && temp[6].equals("�������")) {
							temp[6] = "��������ﵽ����";
						}
					}
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
				typeString = "ƥ����";
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
			if (teamName == null) {
				typeString = "���޶���";
			} else {
				typeString = "�����Ա";
			}
			return SUCCESS;
		} catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}

	public String quitTeam() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, psw);
			if (!conn.isClosed())
				System.out.println("Success connecting to the Database!");
			else
				System.out.println("Fail connecting to the Database!");
			stmt = conn.createStatement();
			int deleteCount = 0;
			if (teamName == null) {
				typeString = "ԭ�����޶���";
				return SUCCESS;
			}
			rs = stmt
					.executeQuery("select * from intention where team_username = '"
							+ teamName
							+ "'and i_Place = '"
							+ intendPlace
							+ "'and user_name != '" + userName + "'");// �ҳ�������Ϣ
			rs.last();
			int Row = rs.getRow();
			if (teamName.equals(userName) && Row >= 1) {// ���˳��߾��Ƕӳ�ʱ,���ӳ���Ϊ�ӳ�
				System.out.println("mark");
				String tempTeam = null;
				rs.beforeFirst();
				String[] users = new String[Row];
				for (int i = 0; rs.next(); i++) {
					users[i] = rs.getString("user_name");
				}
				tempTeam = users[0];
				for (int i = 0; i < Row; i++) {
					stmt.executeUpdate("update intention set team_username = '"
							+ tempTeam + "' where user_name = '" + users[i]
							+ "' and i_place='" + intendPlace + "'");
				}
			} else {
				System.out.println("Debug ....");
			}
			deleteCount = stmt
					.executeUpdate("update intention set team_username = null where user_name = '"
							+ userName + "' and i_place='" + intendPlace + "'");
			System.out.println(deleteCount);
			if (deleteCount == 1) {
				typeString = "�˳�����ɹ�";
				teamName = null;
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

	public String addTeam() {// �����뱻���պ󣬽������߼������ //add userName to the
								// teamName's team
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		String tempUserName = teamName;
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
			if (rs.next()) {// ���޸Ĺ���������Բ����жϣ���Ϊִ�в��� �ж��Ƿ��Ѵ��ڶ���
				String temp = rs.getString("team_username");
				if (temp != null) {
					teamName = temp;
					showTeam();
					typeString = "�Ѵ��ڶ��飡�����˳������ټ����¶���";
					return "existTeam";
				}
				// ��������������ߵ�applyȫ������
				stmt.executeUpdate("update intention set apply1 = null where user_name = '"
						+ userName + "' and i_place = '" + intendPlace + "'");
				stmt.executeUpdate("update intention set apply2 = null where user_name = '"
						+ userName + "' and i_place = '" + intendPlace + "'");
				stmt.executeUpdate("update intention set apply3 = null where user_name = '"
						+ userName + "' and i_place = '" + intendPlace + "'");
			}
			rs = stmt
					.executeQuery("select * from intention where user_name = '"
							+ teamName + "'and i_Place = '" + intendPlace + "'");// �ҳ��ӳ���Ϣ
			if (rs.next()) {
				String tempIn1 = rs.getString("invite1");
				String tempIn2 = rs.getString("invite2");
				String tempIn3 = rs.getString("invite3");
				// �������Ѿ���ӵĶ�Ա������
				if (tempIn1 != null && tempIn1.equals(userName)) {
					stmt.executeUpdate("update intention set Invite1 = null where user_name = '"
							+ teamName
							+ "' and i_place = '"
							+ intendPlace
							+ "'");
				} else if (tempIn2 != null && tempIn2.equals(userName)) {
					stmt.executeUpdate("update intention set Invite2 = null where user_name = '"
							+ teamName
							+ "' and i_place = '"
							+ intendPlace
							+ "'");
				} else if (tempIn3 != null && tempIn3.equals(userName)) {
					stmt.executeUpdate("update intention set Invite3 = null where user_name = '"
							+ teamName
							+ "' and i_place = '"
							+ intendPlace
							+ "'");
				}
				rs = stmt
						.executeQuery("select * from intention where user_name = '"
								+ teamName
								+ "'and i_Place = '"
								+ intendPlace
								+ "'");// �ҳ��ӳ���Ϣ
				rs.next();
				String temp = rs.getString("team_username");
				if (temp == null) {// �ӳ���δ���
					stmt.executeUpdate("update intention set team_username = '"
							+ teamName + "' where user_name = '" + teamName
							+ "' and i_place = '" + intendPlace + "'");
				} else {// �ӳ����ж���
					teamName = temp;
				}
				stmt.executeUpdate("update intention set team_username = '"
						+ teamName + "' where user_name = '" + userName
						+ "' and i_place = '" + intendPlace + "'");
				showTeam();
				System.out.println("flag  " + addTeamFlag);
				if (addTeamFlag.equals("Yes")) {
					userName = tempUserName;
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

	public String applyTeam() {
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
							+ teamName + "'and i_Place = '" + intendPlace + "'");// �ҳ�������Ϣ
			if (rs.next()) {
				String temp = rs.getString("team_username");
				if (temp == null) {// ������δ���
				} else {// �������ж���
					teamName = temp;
				}
				rs = stmt
						.executeQuery("select * from intention where user_name = '"
								+ userName
								+ "'and i_Place = '"
								+ intendPlace
								+ "'");
				rs.next();
				if (rs.getString("apply1") == null) {
					stmt.executeUpdate("update intention set apply1 = '"
							+ teamName + "' where user_name = '" + userName
							+ "' and i_place = '" + intendPlace + "'");
				} else if (rs.getString("apply2") == null) {
					stmt.executeUpdate("update intention set apply2 = '"
							+ teamName + "' where user_name = '" + userName
							+ "' and i_place = '" + intendPlace + "'");
				} else if (rs.getString("apply3") == null) {
					stmt.executeUpdate("update intention set apply3 = '"
							+ teamName + "' where user_name = '" + userName
							+ "' and i_place = '" + intendPlace + "'");
				}
				addLink();
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

	public String inviteTeam() {// userName�Ƕӳ���teamName���������
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
							+ teamName + "'and i_Place = '" + intendPlace + "'");// �ҳ�������Ϣ
			if (rs.next()) {
				rs = stmt
						.executeQuery("select * from intention where user_name = '"
								+ userName
								+ "'and i_Place = '"
								+ intendPlace
								+ "'");
				rs.next();
				if (rs.getString("invite1") == null) {
					stmt.executeUpdate("update intention set invite1 = '"
							+ teamName + "' where user_name = '" + userName
							+ "' and i_place = '" + intendPlace + "'");
				} else if (rs.getString("invite2") == null) {
					stmt.executeUpdate("update intention set invite2 = '"
							+ teamName + "' where user_name = '" + userName
							+ "' and i_place = '" + intendPlace + "'");
				} else if (rs.getString("invite3") == null) {
					stmt.executeUpdate("update intention set invite3 = '"
							+ teamName + "' where user_name = '" + userName
							+ "' and i_place = '" + intendPlace + "'");
				}
				addLink();
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

	public String clear() {
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
				stmt.executeUpdate("update intention set "+clearType+""+clearFlag+" = null where user_name = '" + userName
						+ "' and i_place = '" + intendPlace + "'");
			addLink();
			return SUCCESS;
		} catch (Exception e) {
			System.out.print("connection error!");
			e.printStackTrace();
			return ERROR;
		}
	}
}