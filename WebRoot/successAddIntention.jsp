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
			<td>��ȥ�ľ���</td>
			<td><s:property value="intendPlace"/></td>
		</tr>
		<tr>
			<td>������ʱ�䣨���磩</td>
			<td><s:property value="intendTimeFloor"/></td>
		</tr>
		<tr>
			<td>������ʱ�䣨����</td>
			<td><s:property value="intendTimeCeiling"/></td>
		</tr>
		<tr>
			<td>�����Ļ���</td>
			<td><s:property value="intendPrice"/></td>
		</tr>
		<tr>
			<td>����ͬ�������</td>
			<td><s:property value="intendFriendAge"/></td>
		</tr>
		<tr>
			<td>����ͬ����Ա�</td>
			<td><s:property value="intendFriendGender"/></td>
		</tr>
		<tr>
			<td>����ͬ��Ĺ���</td>
			<td><s:property value="intendFriendOccupation"/></td>
		</tr>
		<tr>
			<td>����ͬ��ĵ���</td>
			<td><s:property value="intendFriendLocation"/></td>
		</tr>
		<tr>
			<td>����ͬ��İ���</td>
			<td><s:property value="intendFriendHobby"/></td>
		</tr>
	</table>
	<br> <a href="index.jsp">Exit</a>
	
</body>
</html>
