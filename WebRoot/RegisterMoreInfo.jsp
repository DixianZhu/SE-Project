<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<title>Register</title>

<body>
	<h1>Please type more information of you</h1><br>
	your user name : <s:property value="userName"/>
	<s:form action="register_two">
		<s:hidden name="userName" label="user name"/>
		<br>
		<s:textfield name="passWord" label="pass word"/>
		<br>
		<s:textfield name="realName" label="real name"/>
		<br>
		<s:select label="gender"
       	name="gender"
       	headerKey="-1" headerValue="请选择"
       	list="{'男','女','不确定'}"
       	required="true"
		 />
		<br>
		<s:textfield name="age" label="age"/>
		<br>
		<s:textfield name="location" label="location"/>
		<br>
		<s:textfield name="occupation" label="occupation"/>
		<br>
		<s:textfield name="hobby" label="hobby"/>
		<br>
		<s:submit />
	</s:form>
</body>
</html>
