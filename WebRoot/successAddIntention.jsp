<%@ page language="java" import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
<link rel="stylesheet" href="bootstrap.css" type="text/css">
<meta charset="utf-8">
	<table align="center" valign="center" width="100%"  border="0" cellpadding="0">
	<tr>
	<td align="center" valign="center">
	<br/><br/><br/><br/>
	<h1><s:property value="typeString"/></h1>
	<br/>
	<br/>
	<br/>
	<font size="5" color="#000000">Hello! These are your intention information:</font>
	<br/><br/>
	<table border='0' >
		<tr>
			<td>想去的景点</td>
			<td><s:property value="intendPlace"/></td>
		</tr>
		<tr>
			<td>期望的时间</td>
			<td><s:property value="intendTime"/></td>
		</tr>
		<tr>
			<td>期望的花费</td>
			<td><s:property value="intendPrice"/></td>
		</tr>
		<tr>
			<td>期望同伴的年龄</td>
			<td><s:property value="intendFriendAge"/></td>
		</tr>
		<tr>
			<td>期望同伴的性别</td>
			<td><s:property value="intendFriendGender"/></td>
		</tr>
		<tr>
			<td>期望同伴的工作</td>
			<td><s:property value="intendFriendOccupation"/></td>
		</tr>
		<tr>
			<td>期望同伴的地域</td>
			<td><s:property value="intendFriendLocation"/></td>
		</tr>
		<tr>
			<td>期望同伴的爱好</td>
			<td><s:property value="intendFriendHobby"/></td>
		</tr>
		<tr>
			<td>组队情况</td>
			<td><s:property value="teamName"/></td>
		</tr>
	</table>
	<table border='0' >
		<tr>
			<td>我的申请1</td>
			<td><s:property value="apply1"/></td>
			<td><a href='<s:url action="clear">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
		<s:param name="clearType" value="'apply'"/>
		<s:param name="clearFlag" value="'1'"/>
				  </s:url>'>撤销
		</a></td>
		</tr>
		<tr>
			<td>我的申请2</td>
			<td><s:property value="apply2"/></td>
			<td><a href='<s:url action="clear">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
		<s:param name="clearType" value="'apply'"/>
		<s:param name="clearFlag" value="'2'"/>
				  </s:url>'>撤销
		</a></td>
		</tr>
		<tr>
			<td>我的申请3</td>
			<td><s:property value="apply3"/></td>
			<td><a href='<s:url action="clear">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
		<s:param name="clearType" value="'apply'"/>
		<s:param name="clearFlag" value="'3'"/>
				  </s:url>'>撤销
		</a></td>
		</tr>
	</table>
	<table border='0' >
		<tr>
			<td>我的邀请1</td>
			<td><s:property value="invite1"/></td>
			<td><a href='<s:url action="clear">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
		<s:param name="clearType" value="'invite'"/>
		<s:param name="clearFlag" value="'1'"/>
				  </s:url>'>撤销
		</a></td>
		</tr>
		<tr>
			<td>我的邀请2</td>
			<td><s:property value="invite2"/></td>
			<td><a href='<s:url action="clear">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
		<s:param name="clearType" value="'invite'"/>
		<s:param name="clearFlag" value="'2'"/>
				  </s:url>'>撤销
		</a></td>
		</tr>
		<tr>
			<td>我的邀请3</td>
			<td><s:property value="invite3"/></td>
			<td><a href='<s:url action="clear">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
		<s:param name="clearType" value="'invite'"/>
		<s:param name="clearFlag" value="'3'"/>
				  </s:url>'>撤销
		</a></td>
		</tr>
	</table>
	入队申请：
	<s:iterator value="applySet" status="itStatus" id="n">
		<li><s:property value="#itStatus.count" />:
		 申请用户:<s:property value="#n[0]" />&nbsp;&nbsp;
		期望出发时间:<s:property value="#n[1]" />&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href='<s:url action="admitTeam">
		<s:param name="teamName" value="userName" />
		<s:param name="userName" value="#n[0]" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
		<s:param name="addTeamFlag" value="'Yes'"/>
				  </s:url>'>同意申请 
		</a>
	</li></s:iterator>
	<br>
	<br>
	入队邀请：
	<s:iterator value="inviteSet" status="itStatus" id="n">
		<li><s:property value="#itStatus.count" />:
		 申请用户:<s:property value="#n[0]" />&nbsp;&nbsp;
		期望出发时间:<s:property value="#n[1]" />&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href='<s:url action="admitTeam">
		<s:param name="teamName" value="#n[0]"/>
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
		<s:param name="addTeamFlag" value="'No'"/>
				  </s:url>'>同意邀请 
		</a>
	</li></s:iterator>
	<br>
	<a
			href='<s:url action="linkNode">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace" />
				  </s:url>'>寻找队友
				</a>
				<br>
	<a
			href='<s:url action="showTeam">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace" />
		<s:param name="teamName" value="teamName" />
				  </s:url>'>我的队友
				</a>
				<br><a
		href='<s:url action="quitTeam">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
		<s:param name="intendTime" value="intendTime"/>
		<s:param name="intendPrice" value="intendPrice"/>
		<s:param name="intendFriendAge" value="intendFriendAge"/>
		<s:param name="intendFriendGender" value="intendFriendGender"/>
		<s:param name="intendFriendOccupation" value="intendFriendOccupation"/>
		<s:param name="intendFriendLocation" value="intendFriendLocation"/>
		<s:param name="intendFriendHobby" value="intendFriendHobby"/>
		<s:param name="teamName" value="teamName"/>
		<s:param name="apply1" value="apply1"/>
		<s:param name="apply2" value="apply2"/>
		<s:param name="apply3" value="apply3"/>
		<s:param name="invite1" value="invite1"/>
		<s:param name="invite2" value="invite2"/>
		<s:param name="invite3" value="invite3"/>
		<s:param name="applySet" value="applySet"/>
		<s:param name="inviteSet" value="inviteSet"/>
				  </s:url>'>退出队伍
	</a>
				<br><a
		href='<s:url action="showIntentionOne">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
				  </s:url>'>返回上一页
	</a>
	<br>
	<a
		href='<s:url action="login">
		<s:param name="userName" value="userName"/>
		<s:param name="passWord" value="passWord"/>
				  </s:url>'>返回主界面
		</a>
		</td></tr></table>
</body>
</html>
