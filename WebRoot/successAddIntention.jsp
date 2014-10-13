<%@ page language="java" import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
	<h1>Successful login!</h1>
	Hello! These are your intention information:
	<br>
	<table border='1' >
		<tr>
			<td>想去的景点</td>
			<td><s:property value="intendPlace"/></td>
		</tr>
		<tr>
			<td>期望的时间（最早）</td>
			<td><s:property value="intendTimeFloor"/></td>
		</tr>
		<tr>
			<td>期望的时间（最晚）</td>
			<td><s:property value="intendTimeCeiling"/></td>
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
	</table>
	<br> <a href="index.jsp">Exit</a>
	
</body>
</html>
