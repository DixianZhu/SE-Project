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
		<s:textfield name="intendTime" label="������ʱ��(��ʽXXXX/XX/XX)" />
		<s:textfield name="intendPrice" label="�����Ļ���(�����)" />
		<s:textfield name="intendFriendAge" label="����ͬ�������"/>
		<s:select label="����ͬ����Ա�"
       	name="intendFriendGender"
       	headerKey="��" headerValue="��ѡ��"
       	list="{'��','Ů','��ȷ��'}"
       	required="true"
		 />
		<s:textfield name="intendFriendOccupation" label="����ͬ��Ĺ���"/>
		<s:textfield name="intendFriendLocation" label="����ͬ��ĵ���"/>
		<s:textfield name="intendFriendHobby" label="����ͬ��İ���" />
		<s:hidden name="userName" label="userName"/>
		<s:hidden name="passWord" label="passWord"/>
		<s:submit />
	</s:form>
	<br>
	<a
		href='<s:url action="showIntentionOne">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
				  </s:url>'>�鿴���мƻ�
	</a>
	<br>
	<a
		href='<s:url action="login">
		<s:param name="userName" value="userName"/>
		<s:param name="passWord" value="passWord"/>
				  </s:url>'>����������
		</a>
</body>
</html>
