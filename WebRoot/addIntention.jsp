<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Trip Guider - Add Intention</title>
<s:head />
</head>
<body>
	<table bgcolor="#FFF8DC" width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
	<tr >
		<td align="center" valign="center">
	<h1>Trip Guider - Add Intention</h1>
	<s:form action="addIntention">
		<s:textfield name="intendPlace" label="想去的景点" />
		<s:textfield name="intendTime" label="期望的时间(格式XXXX/XX/XX)" />
		<s:textfield name="intendPrice" label="期望的花费(人民币)" />
		<s:textfield name="intendFriendAge" label="期望同伴的年龄"/>
		<s:textfield name="intendFriendGender" label="期望同伴的性别"/>
		<s:textfield name="intendFriendOccupation" label="期望同伴的工作"/>
		<s:textfield name="intendFriendLocation" label="期望同伴的地域"/>
		<s:textfield name="intendFriendHobby" label="期望同伴的爱好" />
		<s:hidden name="userName" label="userName"/>
		<s:hidden name="passWord" label="passWord"/>
		<s:submit />
	</s:form>
	<br>
	<a
		href='<s:url action="showIntentionOne">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
				  </s:url>'>查看所有计划
	</a>
	<br>
	<a
		href='<s:url action="login">
		<s:param name="userName" value="userName"/>
		<s:param name="passWord" value="passWord"/>
				  </s:url>'>返回主界面
		</a>
		</td>
		</tr>
		</table>
</body>
</html>
