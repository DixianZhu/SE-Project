<%@ page language="java" import="java.util.*,java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body bgcolor="#FFF8DC">
<table  width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
	<tr >
	<td align="center" valign="center">	
	�������
	<br>
	<br>
	<table>
	<td>���</td><td>Ŀ�ĵ�</td><td>��ϸ��Ϣ</td>
	<s:iterator value="res" status="itStatus" id='n'>
		<tr>
		<td><s:property value="#itStatus.count" />:</td> 
		<td><s:property	 value='#n[1]' escape="false"/></td>
		<td><s:property value='#n[2]' escape="false"/></td>
	    </tr>
	</s:iterator>
	</table>
	<a
		href='<s:url action="login">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
				  </s:url>'><img src="iconpng.png" />
	</a>
	</td>
	</tr>
	</table>
	
</body>
</html>
