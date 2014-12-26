<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
.button {
 display: inline-block;
 position: relative;
 margin: 10px;
 padding: 0 20px;
 text-align: center;
 text-decoration: none;
 text-shadow: 1px 1px 1px rgba(255,255,255,.22);
 font: bold 12px/25px Arial, sans-serif;

 -webkit-border-radius: 30px;
 -moz-border-radius: 30px;
 border-radius: 30px;

 -webkit-box-shadow: 1px 1px 1px rgba(0,0,0,.29), inset 1px 1px 1px rgba(255,255,255,.44);
 -moz-box-shadow: 1px 1px 1px rgba(0,0,0,.29), inset 1px 1px 1px rgba(255,255,255,.44);
 box-shadow: 1px 1px 1px rgba(0,0,0,.29), inset 1px 1px 1px rgba(255,255,255,.44);

 -webkit-transition: all 0.15s ease;
 -moz-transition: all 0.15s ease;
 -o-transition: all 0.15s ease;
 -ms-transition: all 0.15s ease;
 transition: all 0.15s ease;
}

 .button:hover {
  -webkit-box-shadow: 1px 1px 1px rgba(0,0,0,.29), inset 0px 0px 2px rgba(0,0,0, .5);
  -moz-box-shadow: 1px 1px 1px rgba(0,0,0,.29), inset 0px 0px 2px rgba(0,0,0, .5);
  box-shadow: 1px 1px 1px rgba(0,0,0,.29), inset 0px 0px 2px rgba(0,0,0, .5);
 }

 .button:active {
  -webkit-box-shadow: inset 0px 0px 3px rgba(0,0,0, .8);
  -moz-box-shadow: inset 0px 0px 3px rgba(0,0,0, .8);
  box-shadow: inset 0px 0px 3px rgba(0,0,0, .8);
 }

</style>
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
	<dd style="height:20px"></dd>
	<dd><input id="name"  name="intendPlace" type="text" class="text"  /></dd>
	<dd><input id="name1"  name="intendTime" type="text" class="text"  onclick="WdatePicker()" onfocus="WdatePicker({minDate:'%y-%M-{%d+1}'})" /></dd>
	<dd><input id="name2"  name="intendPrice" type="text" class="text"  /></dd>
	<dd><input id="name3"  name="intendFriendAge" type="text" class="text"  /></dd>
	<dd><input id="contact"  name="intendFriendGender" type="text" class="text"  /></dd>
	<dd><input id="come_from"  name="intendFriendLocation" type="text" class="text"  /></dd>
	<dd><input id="name4"  name="intendFriendHobby" type="text" class="text"  /></dd>
		
		
	<dd >
			<div class="btn"><input type="submit" value="提交" /></div>
			
		</dd>
	
		<s:hidden name="userName" label="userName"/>
		<s:hidden name="passWord" label="passWord"/>
		
	</s:form>
	
   <dd style="height:20px"></dd>
	<dd  class="btn"><a
		href='<s:url action="showIntentionOne">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
				  </s:url>'  class="button blue">查看所有计划
	</a>
	<a
		href='<s:url action="login">
		<s:param name="userName" value="userName"/>
		<s:param name="passWord" value="passWord"/>
				  </s:url>' class="button blue">返回主界面
		</a></dd>
	</dl>
	<br>
</body>
</html>
