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
				// �ж�div.current����Ϊ0��ʱ�� $current��ȡֵ
				if ($current.length == 0) $current = $("#slideshow div:last");
				// �ж�div.current����ʱ��ƥ��$current.next(),����ת����һ��div
				var $next = $current.next().length ? $current.next() : $("#slideshow div:first");
				$current.addClass('prev');
				$next.css({
					opacity: 0.0
				}).addClass("current").animate({
					opacity: 1.0
				}, 1000, function() {
					//��Ϊԭ���ǲ��,ɾ����,��z-index��ֵֻ������ת����div.current,�Ӷ���ǰ����ʾ
					$current.removeClass("current prev");
				});
			}
			$(function() {
				$("#slideshow span").css("opacity", "0.7");
				$(".current").css("opacity", "1.0");
				// �趨ʱ��Ϊ3��(1000=1��)
				setInterval("slideSwitch()", 3000);
			});
		</script>
		<LINK href="style1.css" rel="stylesheet" type="text/css">
	</head>

	<body bgcolor="#FFF8DC">
		<table width="100%" height="100%" border="0" cellpadding="0" ;>
			<td>
				<table width="300px" height="100%" border="0" cellpadding="0" bgcolor="#787878">
					<tr>
						<td align="center" valign="top">
							<br />
							<br />
							<h1>Welcome</h1>
							<fieldset>
								<legend> ������Ϣ</legend>
								<p>
									<label>������</label>
									<s:property value="realName" />
								</p>
								<p>
									<label>�Ա�:</label>
									<s:property value="gender" />
								</p>
								<p>
									<label>����:</label>
									<s:property value="age" />
								</p>
								<p>
									<label>�ص�:</label>
									<s:property value="location" />
								</p>
								<p>
									<label>ְҵ:</label>
									<s:property value="occupation" />
								</p>


								<p>
									<label>����:</label>
									<s:property value="hobby" />
								</p>
							</fieldset>
							
							<br/> <a href='<s:url action="contactUserName">

	    						<s:param name="userName" value="userName"/>

	    						<s:param name="passWord" value="passWord"/>

								</s:url>' class="button orange">���һ������������</a>
							<br/> <a href='<s:url action="showIntentionOne">

	   						 <s:param name="userName" value="userName"/>

	   						 <s:param name="passWord" value="passWord"/>

							</s:url>' class="button orange">��������������</a>
							<br/> <a href='<s:url action="showCommition">

	  					  <s:param name="userName" value="userName"/>			

	  						  <s:param name="passWord" value="passWord"/>

							</s:url>' class="button orange">��ɾ�ҵ�����</a>
							<br/> <a href='<s:url action="showOthersCommition">

	   				 <s:param name="userName" value="userName"/>

	   				 <s:param name="passWord" value="passWord"/>

					</s:url>' class="button orange">�鿴��������</a>
					<br/>  <a href='<s:url action="addMoreInfo">

	   				 <s:param name="userName" value="userName"/>

	   				 <s:param name="passWord" value="passWord"/>
					 <s:param name="realName" value="realName"/>
					 <s:param name="gender" value="gender"/>

					</s:url>' class="button orange">���/�޸���ϸ��Ϣ</a>
							<br/> <a href="index.jsp" class="button orange" >Exit</a>
						</td>
					</tr>
				</table>
			</td>
			<td>
				<table valign="top" align="left" width="900px" height="100%" border="0" cellpadding="0">

					<div>
						<img src="3.png" style="width: 900px; height:300px ;"/>
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
							<img src="1.jpg" alt="" />

							<span>��ӭ����DIVCSS5</span>
						</div>
						<div>
							<img src="2.jpg" alt="" />

							<span>DIVCSS5�ṩ������Դ</span>
						</div>
						<div>
							<img src="3.jpg" alt="" />

							<span>Yes, thd third.</span>
						</div>
						<div>

							<img src="4.jpg" alt="" />

							<span>1.2.3.4...</span>
						</div>
						<div>

							<img src="5.jpg" alt="" />

							<span>ѧCSS��DIVCSS5</span>
						</div>
					</div>
				</table>

			</td>
		</table>
	</body>

</html>