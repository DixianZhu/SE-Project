<%@ page language="java" import="java.util.*,java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<link rel="stylesheet" href="bootstrap.css" type="text/css">
<meta charset="utf-8">
<body bgcolor="#FFF8DC">
<table  width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
	<tr >
	<td align="center" valign="center">	
	These are your intention:
	<br>
	<br>
	<table cellpadding="10">
	<s:iterator value="res" status="itStatus" id='n'>
	<tr>
	<td>���</td>
	<td>Ŀ�ĵ�</td>
	<td>����ʱ��</td>

	</tr>
	<tr>
		<td><s:property value="#itStatus.count" /></td>
		<td><s:property value='#n[0]' /></td>
		<td><s:property value='#n[1]' /></td>
		<td><a
			href='<s:url action="showIntentionTwo">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="#n[0]" />
				  </s:url>'>��ϸ��Ϣ
		</a></td> 
		<td><a
			href='<s:url action="deleteIntention">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="#n[0]" />
				  </s:url>'>ɾ��
		</a></td>
		</tr>
	</s:iterator>
	</table>
	
	<a
		href='<s:url action="contactUserName">
	    <s:param name="userName" value="userName"/>
	    <s:param name="passWord" value="passWord"/>
	</s:url>'>���һ������������</a>
		<br>
	<a
		href='<s:url action="login">
		<s:param name="userName" value="userName"/>
		<s:param name="passWord" value="passWord"/>
				  </s:url>'><img src="iconpng.png" />
		</a>
		</td>
	</tr>
	</table>
</body>
</html>
