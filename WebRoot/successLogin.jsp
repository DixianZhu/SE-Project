<%@ page language="java" import="java.util.*,java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<link rel="stylesheet" href="bootstrap.css" type="text/css">
<meta charset="utf-8">
<body  bgcolor="#FFF8DC" >


	<table width="100%" height="100%"  border="0" cellpadding="0">
		<tr valign="bottom" align="center">
		<td >
		<s:form action="search">
		<s:textfield name="myQuery" label="���뾰��" />
		<s:hidden name="userName"/>
	    <s:hidden name="passWord"/>
		<s:submit />
		<td><a href="map.jsp">�鿴��ͼ</a> </td>
		</s:form>
		</td>
		</tr>
		<tr>
			<td align="center" valign="center">
				<h1>Welcome</h1> <!--s:property value="userName" /--> 
				<br> <font size="5" color="#000000">These are your information: </font> </br> <br>
				</br>
				<table width="400" border='0' bgcolor="#FFF8DC">
					<tr align="center" valign="center">
						<td>����</td>
						<td><s:property value="realName" /></td>
					</tr>
					<tr align="center" valign="center">
						<td>�Ա�</td>
						<td><s:property value="gender" /></td>
					</tr>
					<tr align="center" valign="center">
						<td>����</td>
						<td><s:property value="age" /></td>
					</tr>
					<tr align="center" valign="center">
						<td>�ص�</td>
						<td><s:property value="location" /></td>
					</tr>
					<tr align="center" valign="center">
						<td>ְҵ</td>
						<td><s:property value="occupation" /></td>
					</tr>
					<tr align="center" valign="center">
						<td>����</td>
						<td><s:property value="hobby" /></td>
					</tr>
				</table>
				 <br> <a href='<s:url action="contactUserName">
	    						<s:param name="userName" value="userName"/>
	    						<s:param name="passWord" value="passWord"/>
								</s:url>'>���һ������������</a>
				<br> <a href='<s:url action="showIntentionOne">
	   						 <s:param name="userName" value="userName"/>
	   						 <s:param name="passWord" value="passWord"/>
							</s:url>'>�鿴�ҵ���������������</a>
				<br> <a href='<s:url action="showCommition">
	  					  <s:param name="userName" value="userName"/>			
	  						  <s:param name="passWord" value="passWord"/>
							</s:url>'>��ɾ�ҵ�����</a>
				<br> <a href='<s:url action="showOthersCommition">
	   				 <s:param name="userName" value="userName"/>
	   				 <s:param name="passWord" value="passWord"/>
					</s:url>'>�鿴��������</a>
				<br> <a href="index.jsp">Exit</a>
			</td>
		</tr>
</table>
</body>
</html>
