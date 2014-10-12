<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
	<h1>Successful login!</h1>
	Hello! These are your information:
	<br>
	<table border='1' >
		<tr>
			<td>姓名</td>
			<td><s:property value="realName"/></td>
		</tr>
		<tr>
			<td>性别</td>
			<td><s:property value="gender"/></td>
		</tr>
		<tr>
			<td>年龄</td>
			<td><s:property value="age"/></td>
		</tr>
		<tr>
			<td>地点</td>
			<td><s:property value="location"/></td>
		</tr>
		<tr>
			<td>职业</td>
			<td><s:property value="occupation"/></td>
		</tr>
		<tr>
			<td>爱好</td>
			<td><s:property value="hobby"/></td>
		</tr>
	</table>
	<br> <a href='<s:url action="contactUserName">
	    <s:param name="userName" value="userName"/>
	</s:url>'>add A intention</a>
	<br> <a href='<s:url action="showIntentionOne">
	    <s:param name="userName" value="userName"/>
	</s:url>'>show my all intentions</a>
	<br> <a href="index.jsp">Exit</a>
	
</body>
</html>
