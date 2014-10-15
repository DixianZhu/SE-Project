<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<body>
	<h1>Successful delete</h1>
	<br>
	<a href="index.jsp">Exit</a>
	<br>
	<a
		href='<s:url action="showIntentionOne">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
				  </s:url>'>·µ»Ø
	</a>
</body>
</html>
