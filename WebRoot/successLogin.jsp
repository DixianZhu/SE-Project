<%@ page language="java" import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<meta charset="utf-8">

	<head>
		<script type="text/javascript" src="jquery.min.js"></script>
		<script type="text/javascript">
			function slideSwitch() {
				var $current = $("#slideshow div.current");
				// 判断div.current个数为0的时候 $current的取值
				if ($current.length == 0) $current = $("#slideshow div:last");
				// 判断div.current存在时则匹配$current.next(),否则转到第一个div
				var $next = $current.next().length ? $current.next() : $("#slideshow div:first");
				$current.addClass('prev');
				$next.css({
					opacity: 0.0
				}).addClass("current").animate({
					opacity: 1.0
				}, 1000, function() {
					//因为原理是层叠,删除类,让z-index的值只放在轮转到的div.current,从而最前端显示
					$current.removeClass("current prev");
				});
			}
			$(function() {
				$("#slideshow span").css("opacity", "0.7");
				$(".current").css("opacity", "1.0");
				// 设定时间为3秒(1000=1秒)
				setInterval("slideSwitch()", 3000);
			});
		</script>
		<LINK href="style1.css" rel="stylesheet" type="text/css">
	</head>

	<body bgcolor="#FFF8DC">
		<table width="100%" height="100%" border="0" cellpadding="0" ;>
			<td>
				<table width="300px" height="100%" border="0" cellpadding="0" bgcolor="#497F7F">
					<tr>
						<td align="center" valign="top">
							<br />
							<br />
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
					<br/>  <a href='<s:url action="addMoreInfo">

	   				 <s:param name="userName" value="userName"/>

	   				 <s:param name="passWord" value="passWord"/>
					 <s:param name="realName" value="realName"/>
					 <s:param name="gender" value="gender"/>

					</s:url>' class="button orange">添加/修改详细信息</a>
							<br/> <a href="index.jsp" class="button orange" >Exit</a>
						</td>
					</tr>
				</table>
			</td>
			<td>
				<table valign="top" align="left" width="900px" height="100%" border="0" cellpadding="0">

					<div>
						<img src="3.png" style="width: 900px; height:300px ;"/>
						<br />
					</div>
					<div>
						
						<s:form action="search">
							<s:textfield name="myQuery" cssClass="search1"/>
							<s:hidden name="userName" />
							<s:hidden name="passWord" />
							<s:submit cssClass="button1"/>
						</s:form>
					</div>

					<div id="slideshow">
						<div class="current">
							<img src="one.jpg" alt="" />

							<span>法国鲁昂,典型的法国田园风光</span>
						</div>
						<div>
							<img src="two.jpg" alt="" />

							<span>美国密西西比的纳齐兹到田纳西的纳什维尔的一条古道。</span>
						</div>
						<div>
							<img src="three.jpg" alt="" />

							<span>魁北克市是一座法兰西风味浓郁、历史悠久的文化名城。</span>
						</div>
						<div>

							<img src="four.jpg" alt="" />

							<span>“夜上海，夜上海，你是一个不夜城，酒不醉人，人自醉”……</span>
						</div>
						<div>

							<img src="five.jpg" alt="" />

							<span>葡萄牙亚速尔群岛海岸附近的抹香鲸</span>
						</div>
					</div>
				</table>

			</td>
		</table>
	</body>

</html>