<%@ page language="java" import="java.util.*,java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
	<h1>Successful login!</h1>
	<br>user name is
	<s:property value="userName" />
	Hello! These are your information:
	<br>
	<table border='1'>
		<tr>
			<td>����</td>
			<td><s:property value="realName" /></td>
		</tr>
		<tr>
			<td>�Ա�</td>
			<td><s:property value="gender" /></td>
		</tr>
		<tr>
			<td>����</td>
			<td><s:property value="age" /></td>
		</tr>
		<tr>
			<td>�ص�</td>
			<td><s:property value="location" /></td>
		</tr>
		<tr>
			<td>ְҵ</td>
			<td><s:property value="occupation" /></td>
		</tr>
		<tr>
			<td>����</td>
			<td><s:property value="hobby" /></td>
		</tr>
	</table>
	<br>
	<a
		href='<s:url action="contactUserName">
	    <s:param name="userName" value="userName"/>
	</s:url>'>add
		A intention</a>
	<br>
	<a
		href='<s:url action="showIntentionOne">
	    <s:param name="userName" value="userName"/>
	</s:url>'>show
		my all intentions</a>
	<br>
	<a href="index.jsp">Exit</a>

</body>
</html>
