<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<head>
<title>Trip Guider - Add Intention</title>

<meta charset="utf-8">
<s:head />
<link href="style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="script.js"></script>
</head>
<body >
     <dl class="formbox">
	
	
	
	<s:form action="addIntention" method="get">
	<dd><input id="name"  name="intendPlace" type="text" class="text"  /></dd>
	<dd><input id="name1"  name="intendTime" type="text" class="text"  onclick="WdatePicker()" onfocus="WdatePicker({minDate:'%y-%M-{%d+1}'})" /></dd>
	<dd><input id="name2"  name="intendPrice" type="text" class="text"  /></dd>
	<dd><input id="name3"  name="intendFriendAge" type="text" class="text"  /></dd>
	<dd><input id="contact"  name="intendFriendAge" type="text" class="text"  /></dd>
	<dd><input id="come_from"  name="intendFriendLocation" type="text" class="text"  /></dd>
	<dd><input id="name4"  name="intendFriendHobby" type="text" class="text"  /></dd>
		
		
	<dd>
			<h2>就这样！</h2>
			<div class="btn"><input type="submit" value="提交" /></div>
		</dd>
	
		<s:hidden name="userName" label="userName"/>
		<s:hidden name="passWord" label="passWord"/>
		
	</s:form>
	</dl>
	<br>
	<div text-align:center>
	<a
		href='<s:url action="showIntentionOne">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
				  </s:url>' >查看所有计划
	</a>
	<br>
	<a
		href='<s:url action="login">
		<s:param name="userName" value="userName"/>
		<s:param name="passWord" value="passWord"/>
				  </s:url>'>返回主界面
		</a>
		</div>
</body>
</html>
