<%@ page language="java" import="java.util.*,java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="bootstrap.css" type="text/css">
<meta charset="utf-8">
<body bgcolor="#FFF8DC">
	<table width="80%" height="80%" border="0" cellspacing="0"
		cellpadding="0">
				<tr>
					<td align="center" valign="center" width="100"></td>
					<td>楼层</td>
					<td>评论人</td>
					<td>目的地</td>
					<td>出发时间</td>
					<td>评论</td> 
					</tr>
				<s:iterator value="res" status="itStatus" id='n'>
					<tr>
					<td align="center" valign="center" width="100"></td>
					<td><s:property value="#itStatus.count" /></td>
					<td><s:property value='#n[0]' /></td>
					<td><s:property value='#n[1]' /></td>
					<td><s:property value='#n[2]' /></td>
					<td><s:property value='#n[3]' /></td> 
					<td><a
						href='<s:url action="deleteCommition">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="num" value="#itStatus.count" />
				  </s:url>'>删除
					</a></td>
					</tr>
				</s:iterator>
				</table>
				<table>
					<tr>
					<td align="center" valign="center" width="100"></td>
						<td align="center" valign="center" width="300" bgcolor="FFFFBC">
							<h2>添加新评论</h2> <font size="2" color="#000000">
							<s:form action="addCommition">
									<s:hidden name="userName" />
									<s:hidden name="passWord" />
									<s:textfield name="intendPlace" label="地点" value="" />
									<s:textfield name="intendTime" label="时间" value="" onclick="WdatePicker()"/>
									<s:textfield name="commition" label="comment" value="" />
									<s:submit />
								</s:form> </font>
						</td>
						<td align="center" valign="center" width="200"></td>
						<td >
						<a href='<s:url action="login">	
							<s:param name="userName" value="userName"/>
							<s:param name="passWord" value="passWord"/>
				  			</s:url>'><img src="iconpng.png" />
				  		</a>	
						</td>
				</table>
</body>
</html>
