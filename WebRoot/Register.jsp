<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<title>Register</title>

<body>
    This is C4 change 1
	<h1>Please type in your user name</h1>
	<s:form action="register_one" >
<s:textfield name="userName" label="user name"/><br>
		<s:submit />
	</s:form>
</body>
</html>
