<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<title>Register</title>
<link rel="stylesheet" href="bootstrap.css" type="text/css">
<meta charset="utf-8">
<script type="text/javascript">
function ischange(x)
{
var y=document.getElementById(x).value;
if(y.length<7)
{

document.getElementById("f").style.display='block';
}
else
{
  document.getElementById("f").style.display='none';
}
}
</script>
<body>
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">    
		<img src="3.jpg" height="100%" width="100%"/>    
	</div>
	<table valign="bottom" align="center" border="0">
	<tr><br/><br/><br/><br/></tr>
	<tr >
		<td><font size="6" color="#000000"><p>Please type more information of you</p></font><br></td>
	</tr>
	<tr>
	<td>
		<s:form action="register_two">
		<s:textfield name="userName" label="user name" required="true" onkeyup="ischange(this.id)"/>
		<br>
		<s:textfield name="passWord" label="pass word" required="true"/>
		<br>
		<s:textfield name="realName" label="real name" required="true"/>
		<br>
		<s:select label="gender"
       	name="gender"
       	headerKey="-1" headerValue="请选择"
       	list="{'男','女','不确定'}"
       	required="true"
		 />
		<br>
		<s:textfield name="age" label="age"/>
		<br>
		<s:textfield name="location" label="location"/>
		<br>
		<s:textfield name="occupation" label="occupation"/>
		<br>
		<s:textfield name="hobby" label="hobby"/>
		<br>
		<s:submit />
		</s:form>
				<div  id="f" style="display:none">字符长度应大于7</div>
	</td>
	</tr>
	</table>
</body>
</html>
