<%@ page language="java" import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
	<h1>Successful login!</h1>
	your team mates:
	<br>
	<s:iterator value="res" status="itStatus" id='n'>
		<li><s:property value="#itStatus.count" />:
		 �����û���:<s:property value='#n[0]'/>&nbsp;&nbsp;
		 Ŀ�ĵ�:<s:property value='#n[1]'/>&nbsp;&nbsp;
		 ����ʱ��:<s:property value='#n[2]'/>&nbsp;&nbsp;
		��������:<s:property value='#n[3]'/>&nbsp;&nbsp;&nbsp;&nbsp;
	</s:iterator>
	<br><a
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
	