<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
		<h1>The intend Place is already exist, you can edit the place</h1>
		<br> <a href="index.jsp">Exit</a>
		<br>
		<a
		href='<s:url action="login">
		<s:param name="userName" value="userName"/>
		<s:param name="passWord" value="passWord"/>
				  </s:url>'>返回主界面
		</a>
</body>
</html>
