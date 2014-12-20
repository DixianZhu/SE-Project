<!doctype html>
<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Trip Guider-Welcome</title>
<link rel="stylesheet" href="bootstrap.css" type="text/css">
<meta charset="utf-8">
<s:head />
</head>
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
<table valign="bottom" align="center" border="0" width="800" height="150">
		<tr > 
			<th scope="row"><font size="7" color="#000000"><p>Welcome To Trip Guider</p></font></th>
		</tr>
</table>
<table width="500" border="0" align="center" valign="top">
    <tr>
    <th scope="row" height="500">
      <table width="500" height="311" valign="top" align="center">
		<tr valign="center" style="background-image:url(kuang.png)" >
		<td width="300" height="150"  align="center" valign="center" >
		<font size="6" color="#000000"><p>Login</p></font>
		<br/><br/>
		<s:form action="login" >
			<s:textfield name="userName" label="username" />
			<s:password name="passWord" label="password" />
			<s:submit   style="	
						width: 30%;
						display: inline-block;
						text-align: center;
						text-decoration: none;
						font: 13px/100% Arial, Helvetica, sans-serif;
						padding: .5em 2em .55em;
						text-shadow: 0 1px 1px rgba(0, 0, 0, .3);
						-webkit-border-radius: .5em;
						-moz-border-radius: .5em;
						border-radius: .5em;
						-webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, .2);
						-moz-box-shadow: 0 1px 5px rgba(0, 0, 0, .2);
						box-shadow: 0 1px 5px rgba(0, 0, 0, .2);" />
		</s:form >

		<a href='RegisterMoreInfo.jsp'>Don't have an account?</a>	
		</td>
		</tr>
		</table>
      <p style="color: #000">&nbsp;</p>
      <p>&nbsp;</p></th>
  </tr>
  <tr>
    <th height="21" scope="row">&nbsp;</th>
  </tr>
</table>

</body>
</html>
