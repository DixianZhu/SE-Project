<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Trip Guider-Welcome</title>
<s:head />
</head>
<body>  
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">    
<img src="2.gif" height="100%" width="100%"/>    
</div>		
	<table  width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
	<tr >
		<td valign="bottom">	
		<font size="5" color="#000000"><h1 align="center" >Welcome To Trip Guider</h1>	</font>
		</td>
	</tr>
	<tr align="center" valign="top" width="400">
		<td >
		<table >
		<tr >
		<td  align="center" valign="center" width="300" bgcolor="FFFFBC">
		<h2>Login</h2>
		<font size="2" color="#000000"><s:form action="login" >
			<s:textfield name="userName" label="username" />
			<s:textfield name="passWord" label="password" />
			<s:submit />
		</s:form>
		</font>
		<input type="button" value="Register" onclick="window.location.href='Register.jsp';"/>	
		</td>
		</tr>
		</table>
		</td>
	</tr>
	</table>
</body>
</html>
