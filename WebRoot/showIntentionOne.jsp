<%@ page language="java" import="java.util.*,java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body bgcolor="#FFF8DC">
<table  width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
	<tr >
	<td align="center" valign="center">	
	These are your intention:
	<br>
	<br>
	<s:iterator value="res" status="itStatus" id='n'>
		<li><s:property value="#itStatus.count" />: Ŀ�ĵ�:<s:property
				value='#n[0]' />&nbsp;&nbsp; ����ʱ��:<s:property value='#n[1]' />&nbsp;&nbsp;&nbsp;&nbsp;
			<a
			href='<s:url action="showIntentionTwo">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="#n[0]" />
				  </s:url>'>��ϸ��Ϣ
		</a> <a
			href='<s:url action="deleteIntention">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="#n[0]" />
				  </s:url>'>ɾ��
		</a>
	</s:iterator>
	<br>
	<br>
	<a href="index.jsp">exit</a>
	<br>
	<a
		href='<s:url action="login">
		<s:param name="userName" value="userName"/>
		<s:param name="passWord" value="passWord"/>
				  </s:url>'>����������
		</a>
		</td>
	</tr>
	</table>
</body>
</html>
