<%@ page language="java" import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<meta charset="utf-8">

	<head>
	<style type="text/css">
      body {
    width: 900px;
    margin: 40px auto;
    font-family: 'trebuchet MS', 'Lucida sans', Arial;
    font-size: 14px;
    color: #444;
}

table {
    *border-collapse: collapse; /* IE7 and lower */
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
    
.bordered td, .bordered th {
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
    padding: 10px;
    text-align: left;    
}

.bordered th {
    background-color: #dce9f9;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
    background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
    border-top: none;
    text-shadow: 0 1px 0 rgba(255,255,255,.5); 
}

.bordered td:first-child, .bordered th:first-child {
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

.bordered th:only-child{
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


</style>
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
				<table width="300px" height="100%" border="0" cellpadding="0" bgcolor="#497F7F">
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
							<br/>  <a href='<s:url action="linkNode">
							<s:param name="userName" value="tempUserName" />
							<s:param name="passWord" value="passWord"/>
							<s:param name="intendPlace" value="intendPlace" />
							</s:url>' class="button orange" color="#6495ED">����</a>
							<br/> <a href="index.jsp" class="button orange" >Exit</a>
						</td>
					</tr>
				</table>
			</td>
			<td>
				<table class="bordered">
<thead>

    <tr>
        <th>���</th>        
        <th>Ŀ�ĵ�</th>
        <th>����ʱ��</th>
		<th>  </th>
    </tr>
    </thead>
	     
	<s:iterator value="res" status="itStatus" id='n'>
	
	<tr>
		<td><s:property value="#itStatus.count" /></td>
		<td><s:property value='#n[0]' /></td>
		<td><s:property value='#n[1]' /></td>
		</tr>
	</s:iterator>
	</table>

			</td>
		</table>
	</body>

</html>