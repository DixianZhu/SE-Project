<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<title>Register</title>

<body>
	<h1>Please type in your user name</h1>
	<s:form action="register_one" >
<s:textfield name="userName" label="user name"/><br>
		<s:submit />
	</s:form>
</body>
</html>
