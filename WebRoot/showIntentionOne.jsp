<%@ page language="java" import="java.util.*,java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
	These are your intention:
	<br>
	<s:iterator value="res" status="itStatus" id='n'>
		<li><s:property value="#itStatus.count" />:
		 Ŀ�ĵ�:<s:property value='#n[0]'/>&nbsp;&nbsp;
		 �������ʱ��:<s:property value='#n[1]'/>&nbsp;&nbsp;
		��ٳ���ʱ��:<s:property value='#n[2]'/>&nbsp;&nbsp;&nbsp;&nbsp;
		<a
			href='<s:url action="showIntentionTwo">
		<s:param name="userName" value="userName" />
		<s:param name="intendPlace" value="#n[0]" />
				  </s:url>'>��ϸ��Ϣ
				</a>
	</s:iterator>
	<br>
	<a href="index.jsp">exit</a>
</body>
</html>
