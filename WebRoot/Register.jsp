<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<title>Register</title>
<body>
	<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">    
	<img src="1.jpg" height="100%" width="100%"/>    
	</div>	
	<table  width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td align="center" valign="bottom" width="400">
	<font size="5" color="#000000"><h1 align="center" ><h1>Please type in your user name</h1></font>
	</td>
	</tr>
	<tr>
	<td align="center" valign="top" width="400"> 
	<s:form action="register_one" >
	<s:textfield name="userName" label="user name"/><br>
	<s:submit />
	</s:form>
	</td>
	</tr>
	</table>
</body>
</html>
