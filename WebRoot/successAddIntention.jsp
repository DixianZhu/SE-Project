<%@ page language="java" import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
	<h1><s:property value="typeString"/></h1>
	Hello! These are your intention information:
	<br>
	<table border='1' >
		<tr>
			<td>想去的景点</td>
			<td><s:property value="intendPlace"/></td>
		</tr>
		<tr>
			<td>期望的时间</td>
			<td><s:property value="intendTime"/></td>
		</tr>
		<tr>
			<td>期望的花费</td>
			<td><s:property value="intendPrice"/></td>
		</tr>
		<tr>
			<td>期望同伴的年龄</td>
			<td><s:property value="intendFriendAge"/></td>
		</tr>
		<tr>
			<td>期望同伴的性别</td>
			<td><s:property value="intendFriendGender"/></td>
		</tr>
		<tr>
			<td>期望同伴的工作</td>
			<td><s:property value="intendFriendOccupation"/></td>
		</tr>
		<tr>
			<td>期望同伴的地域</td>
			<td><s:property value="intendFriendLocation"/></td>
		</tr>
		<tr>
			<td>期望同伴的爱好</td>
			<td><s:property value="intendFriendHobby"/></td>
		</tr>
		<tr>
			<td>组队情况</td>
			<td><s:property value="teamName"/></td>
		</tr>
	</table>
	<br>
	<a
			href='<s:url action="linkNode">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace" />
				  </s:url>'>寻找队友
				</a>
				<br>
	<a
			href='<s:url action="showTeam">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace" />
		<s:param name="teamName" value="teamName" />
				  </s:url>'>我的队友
				</a>
				<br><a
		href='<s:url action="quitTeam">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
		<s:param name="intendTime" value="intendTime"/>
		<s:param name="intendPrice" value="intendPrice"/>
		<s:param name="intendFriendAge" value="intendFriendAge"/>
		<s:param name="intendFriendGender" value="intendFriendGender"/>
		<s:param name="intendFriendOccupation" value="intendFriendOccupation"/>
		<s:param name="intendFriendLocation" value="intendFriendLocation"/>
		<s:param name="intendFriendHobby" value="intendFriendHobby"/>
		<s:param name="teamName" value="teamName"/>
				  </s:url>'>退出队伍
	</a>
				<br><a
		href='<s:url action="showIntentionOne">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
				  </s:url>'>返回上一页
	</a>
	<br>
	<a
		href='<s:url action="login">
		<s:param name="userName" value="userName"/>
		<s:param name="passWord" value="passWord"/>
				  </s:url>'>返回主界面
		</a>
	<br> <a href="index.jsp">Exit</a>
</body>
</html>
