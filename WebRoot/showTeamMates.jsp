
<%@ page language="java" import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
	<h1><s:property value="typeString"/></h1>
	
	<table cellpadding="10">
	<tr>
		<td>编号</td>
		<td>用户名</td>
		<td>目的地</td>
		<td>期望时间</td>
		<td>期望花费</td>
		<td>组队情况</td>
		<td>是否可申请</td>
		<td>是否可邀请</td>
	</tr>
	<s:iterator value="res" status="itStatus" id='n'>
	<tr>
		<td><s:property value="#itStatus.count" /></td>
		<td><s:property value='#n[0]'/></td>
		<td><s:property value='#n[1]'/></td>
		<td><s:property value='#n[2]'/></td>
		<td><s:property value='#n[3]'/></td>
		<td><s:property value='#n[4]'/></td>
		<td><a
		href='<s:url action="applyTeam">
		<s:param name="teamName" value="#n[0]" />
		<s:param name="intendPlace" value="intendPlace" />
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
				  </s:url>'><s:property value="#n[5]"/>
		</a></td>
		<td><a
		href='<s:url action="inviteTeam">
		<s:param name="teamName" value="#n[0]" />
		<s:param name="intendPlace" value="intendPlace" />
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
				  </s:url>'><s:property value=
				  "#n[6]"/>
		</a></td>
		<td><a
		href='<s:url action="quitTeam">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
		<s:param name="teamName" value="teamName"/>
				  </s:url>'><s:property value="kickFlag"/>
		</a></td>
	</tr>
	</s:iterator>
	</table>
	<br><a
		href='<s:url action="showIntentionTwo">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
				  </s:url>'><img src="iconpng.png" />
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
	