<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Trip Guider - Add Intention</title>
<s:head />
</head>
<body>
	<h1>Trip Guider - Add Intention</h1>
	<s:form action="addIntention">
		<s:textfield name="intendPlace" label="��ȥ�ľ���" />
		<s:textfield name="intendTimeFloor" label="������ʱ�䣨���磩" />
		<s:textfield name="intendTimeCeiling" label="������ʱ�䣨����" />
		<s:textfield name="intendPrice" label="�����Ļ���(�����)" />
		<s:textfield name="intendFriendAge" label="����ͬ�������"/>
		<s:textfield name="intendFriendGender" label="����ͬ����Ա�"/>
		<s:textfield name="intendFriendOccupation" label="����ͬ��Ĺ���"/>
		<s:textfield name="intendFriendLocation" label="����ͬ��ĵ���"/>
		<s:textfield name="intendFriendHobby" label="����ͬ��İ���" />
		<s:hidden name="userName" label="userName"/>
		<s:submit />
	</s:form>
</body>
</html>
