<%@ page language="java" import="java.util.*,java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body bgcolor="#FFF8DC">
	<table width="50%" height="50%" border="0" cellspacing="0"
		cellpadding="0">
		<h1>请选择景点</h1>
			<s:iterator value="res" status="itStatus" id='n'>
			<tr>
			<td><s:property value="#itStatus.count" /></td>
			<td><s:property value='#n[0]' /></td>
			<td><a
			href='<s:url action="moreOthersCommition">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="#n[0]" />
				  </s:url>'>查看评论
			</a>
			</td>
			</tr>
			</s:iterator> 
	</table>
	<a
					href='<s:url action="login">
					<s:param name="userName" value="userName"/>
					<s:param name="passWord" value="passWord"/>
				  </s:url>'><img src="iconpng.png" />
			</a>
</body>
</html>
