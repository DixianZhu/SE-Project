<%@ page language="java" import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
	<h1><s:property value="typeString"/></h1>
	
	<br>
	<s:iterator value="res" status="itStatus" id='n'>
		<li><s:property value="#itStatus.count" />:
		 队友用户名:<s:property value='#n[0]'/>&nbsp;&nbsp;
		 目的地:<s:property value='#n[1]'/>&nbsp;&nbsp;
		 出发时间:<s:property value='#n[2]'/>&nbsp;&nbsp;
		期望花费:<s:property value='#n[3]'/>&nbsp;&nbsp;
		队伍:<s:property value='#n[4]'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a
		href='<s:url action="applyTeam">
		<s:param name="teamName" value="#n[0]" />
		<s:param name="intendPlace" value="intendPlace" />
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
				  </s:url>'><s:property value="#n[5]"/>
		</a>
				<a
		href='<s:url action="inviteTeam">
		<s:param name="teamName" value="#n[0]" />
		<s:param name="intendPlace" value="intendPlace" />
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
				  </s:url>'><s:property value="#n[6]"/>
		</a>
	</s:iterator>
	<br><a
		href='<s:url action="showIntentionTwo">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
				  </s:url>'>返回上一页
	</a>
	<br><a
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
	</body>
</html>
	