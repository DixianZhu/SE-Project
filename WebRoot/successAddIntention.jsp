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
			<td>������ʱ��</td>
			<td><s:property value="intendTime"/></td>
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
	<br>
	<a
			href='<s:url action="linkNode">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace" />
				  </s:url>'>Ѱ�Ҷ���
				</a>
				<br><a
		href='<s:url action="showIntentionOne">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
				  </s:url>'>�鿴���мƻ�
	</a>
	<br>
	<a
		href='<s:url action="login">
		<s:param name="userName" value="userName"/>
		<s:param name="passWord" value="passWord"/>
				  </s:url>'>����������
		</a>
</body>
</html>
