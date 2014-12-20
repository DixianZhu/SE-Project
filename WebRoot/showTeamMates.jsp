<%@ page language="java" import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<style type="text/css">
		body {
			width: 600px;
			margin: 40px auto;
			font-family: 'trebuchet MS', 'Lucida sans', Arial;
			font-size: 14px;
			color: #444;
		}
		table {
			*border-collapse: collapse;
			/* IE7 and lower */
			
			border-spacing: 0;
			width: 100%;
		}
		.bordered {
			border: solid #ccc 1px;
			-moz-border-radius: 6px;
			-webkit-border-radius: 6px;
			border-radius: 6px;
			-webkit-box-shadow: 0 1px 1px #ccc;
			-moz-box-shadow: 0 1px 1px #ccc;
			box-shadow: 0 1px 1px #ccc;
		}
		.bordered tr:hover {
			background: #fbf8e9;
			-o-transition: all 0.1s ease-in-out;
			-webkit-transition: all 0.1s ease-in-out;
			-moz-transition: all 0.1s ease-in-out;
			-ms-transition: all 0.1s ease-in-out;
			transition: all 0.1s ease-in-out;
		}
		.bordered td,
		.bordered th {
			border-left: 1px solid #ccc;
			border-top: 1px solid #ccc;
			padding: 10px;
			text-align: left;
		}
		.bordered th {
			background-color: #dce9f9;
			background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
			background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
			background-image: -moz-linear-gradient(top, #ebf3fc, #dce9f9);
			background-image: -ms-linear-gradient(top, #ebf3fc, #dce9f9);
			background-image: -o-linear-gradient(top, #ebf3fc, #dce9f9);
			background-image: linear-gradient(top, #ebf3fc, #dce9f9);
			-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
			-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
			box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
			border-top: none;
			text-shadow: 0 1px 0 rgba(255, 255, 255, .5);
		}
		.bordered td:first-child,
		.bordered th:first-child {
			border-left: none;
		}
		.bordered th:first-child {
			-moz-border-radius: 6px 0 0 0;
			-webkit-border-radius: 6px 0 0 0;
			border-radius: 6px 0 0 0;
		}
		.bordered th:last-child {
			-moz-border-radius: 0 6px 0 0;
			-webkit-border-radius: 0 6px 0 0;
			border-radius: 0 6px 0 0;
		}
		.bordered th:only-child {
			-moz-border-radius: 6px 6px 0 0;
			-webkit-border-radius: 6px 6px 0 0;
			border-radius: 6px 6px 0 0;
		}
		.bordered tr:last-child td:first-child {
			-moz-border-radius: 0 0 0 6px;
			-webkit-border-radius: 0 0 0 6px;
			border-radius: 0 0 0 6px;
		}
		.bordered tr:last-child td:last-child {
			-moz-border-radius: 0 0 6px 0;
			-webkit-border-radius: 0 0 6px 0;
			border-radius: 0 0 6px 0;
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
	</style>

	<body>
		<table class="bordered">
			<tr>
				<th>
					<h1><s:property value="typeString"/></h1>
				</th>
			</tr>
		</table>
		<table class="bordered">
			<th>编号</th>
			<th>用户名</th>
			<th>目的地</th>
			<th>期望时间</th>
			<th>期望花费</th>
			<th>组队情况</th>
			<th>是否可申请</th>
			<th>是否可邀请</th>
			<s:iterator value="res" status="itStatus" id='n'>
				<tr>
					<td><s:property value="#itStatus.count" />
					</td>
					<td><s:property value='#n[0]' />
					</td>
					<td><s:property value='#n[1]' />
					</td>
					<td><s:property value='#n[2]' />
					</td>
					<td><s:property value='#n[3]' />
					</td>
					<td><s:property value='#n[4]' />
					</td>
					<td>
						<a href='<s:url action="applyTeam">

		<s:param name="teamName" value="#n[0]" />

		<s:param name="intendPlace" value="intendPlace" />

		<s:param name="userName" value="userName" />

		<s:param name="passWord" value="passWord"/>

				  </s:url>'><s:property value="#n[5]" />
						</a>
					</td>
					<td>
						<a href='<s:url action="inviteTeam">

		<s:param name="teamName" value="#n[0]" />

		<s:param name="intendPlace" value="intendPlace" />

		<s:param name="userName" value="userName" />

		<s:param name="passWord" value="passWord"/>

				  </s:url>'><s:property value="#n[6]" />
						</a>
					</td>
				</tr>
			</s:iterator>
		</table>
		<table>
			<tr>
				<td>
					<br><a href='<s:url action="showIntentionTwo">

		<s:param name="userName" value="userName" />

		<s:param name="passWord" value="passWord"/>

		<s:param name="intendPlace" value="intendPlace"/>

</s:url>' class="button orange"> 返回上一页

	</a>
				</td>
				<td>
					<br><a href='<s:url action="showIntentionOne">

		<s:param name="userName" value="userName" />

		<s:param name="passWord" value="passWord"/>

				  </s:url>' class="button orange" >查看所有计划

	</a>
				</td>
				<td>
						<br>
		<a href='<s:url action="login">

		<s:param name="userName" value="userName"/>

		<s:param name="passWord" value="passWord"/>

				  </s:url>' class="button orange">返回主界面

		</a>
				</td>
			</tr>

		</table>

		
	
	</body>

</html>