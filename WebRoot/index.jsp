<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Trip Guider-Welcome</title>
<s:head />
</head>
<body>
        This is B3 change 1
		This is B3 change 2
	<h1>Trip Guider</h1>
	<s:form action="login">
		<s:textfield name="userName" label="username" />
		<s:textfield name="passWord" label="password" />
		<s:submit />
	</s:form>
	<input type="button" value="Register" onclick="window.location.href='Register.jsp';"/>
</body>
</html>
