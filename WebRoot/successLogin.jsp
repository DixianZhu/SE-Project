<%@ page language="java" import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<meta charset="utf-8">

	<head>
		<style type="text/css">
			body {
						text-align: center;
					}
					.button {
						width: 60%;
						display: inline-block;
						outline: none;
						cursor: pointer;
						text-align: center;
						text-decoration: none;
						font: 18px/80%;
						font-style: normal;
						padding: .5em 2em .55em;
						text-shadow: 0 1px 1px rgba(0, 0, 0, .3);
						-webkit-border-radius: .5em;
						-moz-border-radius: .5em;
						border-radius: .5em;
						-webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, .2);
						-moz-box-shadow: 0 1px 5px rgba(0, 0, 0, .2);
						box-shadow: 0 1px 5px rgba(0, 0, 0, .2);
					}
					.button:hover {
						text-decoration: none;
					}
					.button:active {
						position: relative;
						top: 1px;
					}
					.orange {
						color: #fef4e9;
						border: solid 1px #da7c0c;
						background: #f78d1d;
						background: -webkit-gradient(linear, left top, left bottom, from(#faa51a), to(#f47a20));
						background: -moz-linear-gradient(top, #faa51a, #f47a20);
						filter: progid: DXImageTransform.Microsoft.gradient(startColorstr='#faa51a', endColorstr='#f47a20');
					}
					.orange:hover {
						background: #a52a2a;
						background: -webkit-gradient(linear, left top, left bottom, from(#f88e11), to(#f06015));
						background: -moz-linear-gradient(top, #f88e11, #f06015);
						filter: progid: DXImageTransform.Microsoft.gradient(startColorstr='#f88e11', endColorstr='#f06015');
					}
					.orange:active {
						color: #fcd3a5;
						background: -webkit-gradient(linear, left top, left bottom, from(#f47a20), to(#faa51a));
						background: -moz-linear-gradient(top, #f47a20, #faa51a);
						filter: progid: DXImageTransform.Microsoft.gradient(startColorstr='#f47a20', endColorstr='#faa51a');
					}
					h1 {
						font-size: 40px;
					}
					legend {
						font-size: 20px;
						font-style: normal;
					}
					label {
						font-family: "楷体";
						font-size: 20px;
					}
		</style>
	</head>

	<body bgcolor="#FFF8DC">
		<table width="100%" height="100%" border="0" cellpadding="0">
			<td>
				<table width="300px" height="100%" border="0" cellpadding="0" bgcolor="#787878">
					<tr>
						<td align="center" valign="center">
							<h1>Welcome</h1>
							<fieldset>
								<legend> 个人信息</legend>
								<p>
									<label>姓名：</label>
									<s:property value="realName" />
								</p>
								<p>
									<label>性别:</label>
									<s:property value="gender" />
								</p>
								<p>
									<label>年龄:</label>
									<s:property value="age" />
								</p>
								<p>
									<label>地点:</label>
									<s:property value="location" />
								</p>
								<p>
									<label>职业:</label>
									<s:property value="occupation" />
								</p>


								<p>
									<label>爱好:</label>
									<s:property value="hobby" />
								</p>


							</fieldset>
							<br/> <a href='<s:url action="contactUserName">

	    						<s:param name="userName" value="userName"/>

	    						<s:param name="passWord" value="passWord"/>

								</s:url>' class="button orange">添加一个新旅游意向</a>
							<br/> <a href='<s:url action="showIntentionOne">

	   						 <s:param name="userName" value="userName"/>

	   						 <s:param name="passWord" value="passWord"/>

							</s:url>' class="button orange">旅游意向及组队情况</a>
							<br/> <a href='<s:url action="showCommition">

	  					  <s:param name="userName" value="userName"/>			

	  						  <s:param name="passWord" value="passWord"/>

							</s:url>' class="button orange">增删我的评论</a>
							<br/> <a href='<s:url action="showOthersCommition">

	   				 <s:param name="userName" value="userName"/>

	   				 <s:param name="passWord" value="passWord"/>

					</s:url>' class="button orange">查看景点评论</a>
							<br/> <a href="index.jsp" class="button orange" color="#6495ED">Exit</a>
						</td>
					</tr>
				</table>
			</td>
			<td>
				<table valign="center" align="left" width="900px" height="100%" border="0" cellpadding="0">
					<div>

						<s:form action="search">
							<s:textfield name="myQuery" label="搜一搜你想去地方（限国内）" style="
									   border: 1px dotted #AAAAAA;  
  										 padding:8px 15px 10px 30px;  
   											margin:1px;  
   										font:18px Arial;
" />
							<s:hidden name="userName" />
							<s:hidden name="passWord" />
							<s:submit style="
	background-color:#3bb3e0;
	padding:10px;
	position:relative;
	font-family: 'Open Sans', sans-serif;
	font-size:12px;
	text-decoration:none;
	color:#fff;
	border: solid 1px #186f8f;
	background-image: linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
	background-image: -o-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
	background-image: -moz-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
	background-image: -webkit-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
	background-image: -ms-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
	background-image: -webkit-gradient(
	linear,
	left bottom,
	left top,
	color-stop(0, rgb(44,160,202)),
	color-stop(1, rgb(62,184,229))
	);
	-webkit-box-shadow: inset 0px 1px 0px #7fd2f1, 0px 1px 0px #fff;
	-moz-box-shadow: inset 0px 1px 0px #7fd2f1, 0px 1px 0px #fff;
	box-shadow: inset 0px 1px 0px #7fd2f1, 0px 1px 0px #fff;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	-o-border-radius: 5px;
	border-radius: 5px;
									" />
						</s:form>
					</div>
				</table>

			</td>
		</table>
	</body>

</html>