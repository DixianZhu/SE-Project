<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
	These are your intention:
	<br>
	<s:iterator value="res" status="itStatus" id='n'>
		<li><s:property value="#itStatus.count" />:
		 目的地:<s:property value='#n[0]'/>&nbsp;&nbsp;
		 最早出发时间:<s:property value='#n[1]'/>&nbsp;&nbsp;
		最迟出发时间:<s:property value='#n[2]'/>&nbsp;&nbsp;
	</s:iterator>
	<br>
	<a href="index.jsp">exit</a>
</body>
</html>
