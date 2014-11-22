<%@ page language="java" import="java.util.*,java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="bootstrap.css" type="text/css">
<meta charset="utf-8">
<body bgcolor="#FFF8DC">
	<table width="100%" height="100%" border="1" cellspacing="0"
		cellpadding="0">
		<tr>
			<td align="center" valign="center">评论: <br> <br>
				<s:iterator value="res" status="itStatus" id='n'>
					<li><s:property value="#itStatus.count" />: 评论人:<s:property
							value='#n[0]' />&nbsp;&nbsp; 目的地:<s:property value='#n[1]' />&nbsp;&nbsp;
						时间:<s:property value='#n[2]' />&nbsp;&nbsp; 评论:<s:property
							value='#n[1]' />&nbsp;&nbsp;&nbsp;&nbsp; <a
						href='<s:url action="deleteCommition">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="num" value="#itStatus.count" />
				  </s:url>'>删除
					</a>
				</s:iterator> <br>
				<br/><br/><br/><br/><br/>
				<table>
					<tr>
						<td align="center" valign="center" width="300" bgcolor="FFFFBC">
							<h2>添加新评论</h2> <font size="2" color="#000000"><s:form action="addCommition">
									<s:hidden name="userName" />
									<s:hidden name="passWord" />
									<s:textfield name="intendPlace" label="地点" value="" />
									<s:textfield name="intendTime" label="时间" value="" onclick="WdatePicker()"/>
									<s:textfield name="commition" label="comment" value="" />
									<s:submit />
								</s:form> </font>
						</td>
					</tr>
				</table> <br> <a href="index.jsp">exit</a> <br> <a
				href='<s:url action="login">
		<s:param name="userName" value="userName"/>
		<s:param name="passWord" value="passWord"/>
				  </s:url>'>返回主界面
			</a>
			</td>
		</tr>
	</table>
</body>
</html>
