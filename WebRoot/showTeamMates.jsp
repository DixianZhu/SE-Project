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
		 队友用户名:<s:property value='#n[0]'/>&nbsp;&nbsp;
		 目的地:<s:property value='#n[1]'/>&nbsp;&nbsp;
		 最早出发时间:<s:property value='#n[2]'/>&nbsp;&nbsp;
		最迟出发时间:<s:property value='#n[3]'/>&nbsp;&nbsp;
		期望花费:<s:property value='#n[4]'/>&nbsp;&nbsp;&nbsp;&nbsp;
	</s:iterator>
	</body>
</html>
	