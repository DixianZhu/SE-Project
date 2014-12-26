<%@ page language="java" import="java.util.*,java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>

<meta charset="utf-8">
<head>
<style type="text/css">
      body {
    width: 600px;
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
#shadow, #text { font: 12px/16px Arial; width: 400px; overflow: hidden; height: 46px; }
#shadow { position: absolute; border-width: 0px; padding: 0px; visibility: hidden; }
#text { resize: none; }

</style>
<script type="text/javascript">
/*
by VILIC VANE
Web www.vilic.info
Email i@vilic.info
*/
window.onload = function () {
var text = document.getElementById("text"); //用户看到的文本框
var shadow = document.getElementById("shadow"); //隐藏的文本框
text.oninput = //非IE的
text.onpropertychange = //IE的
onchange;
function onchange() {
shadow.value = text.value;
setHeight();
setTimeout(setHeight, 0); //针对IE 6/7/8的延迟, 否则有时会有一个字符的出入
function setHeight() { text.style.height = shadow.scrollHeight + "px"; }
}
};
</script>
</head>
<body bgcolor="#FFF8DC">
<table align="center" valign="center" width="1500">
					<tr>					
						<td align="center" valign="center" width="300" bgcolor="#97CBFF">
							<h2>评论与建议</h2> <font size="2" color="#000000">
							<s:form action="addMessage">
									<s:textfield name="userName" label="评论人(可匿名)" value="" />
									<s:textarea  name="message" label="评论与建议" value="" id="text"/>
									<s:submit />
								</s:form> </font>
						</td>
						</tr>
				</table>
	<table class="bordered">
	
<thead>
	
    <tr>
        <th>楼层</th>
        <th>评论人</th>        
		<th>评论</th>
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
				<table>
				<td >
						<a href='index.jsp'>返回
				  		</a>	
						</td>
				</table>
</body>
</html>
