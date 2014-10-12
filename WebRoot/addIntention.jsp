<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Trip Guider - Add Intention</title>
<s:head />
</head>
<body>
	<h1>Trip Guider - Add Intention</h1>
	<s:form action="addIntention">
		<s:textfield name="intendPlace" label="想去的景点" />
		<s:textfield name="intendTimeFloor" label="期望的时间（最早）" />
		<s:textfield name="intendTimeCeiling" label="期望的时间（最晚）" />
		<s:textfield name="intendPrice" label="期望的花费(人民币)" />
		<s:textfield name="intendFriendAge" label="期望同伴的年龄"/>
		<s:textfield name="intendFriendGender" label="期望同伴的性别"/>
		<s:textfield name="intendFriendOccupation" label="期望同伴的工作"/>
		<s:textfield name="intendFriendLocation" label="期望同伴的地域"/>
		<s:textfield name="intendFriendHobby" label="期望同伴的爱好" />
		<s:hidden name="userName" label="userName"/>
		<s:submit />
	</s:form>
</body>
</html>
