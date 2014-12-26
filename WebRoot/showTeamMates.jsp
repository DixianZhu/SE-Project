<%@ page language="java" import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
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
<body>
	<h1><s:property value="typeString"/></h1>
	
	<table class="bordered" cellpadding="10">
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
		<td><s:property value="#itStatus.count" /></td>
		<td><a
		href='<s:url action="seeOthersInfo">
		<s:param name="userName" value="#n[0]" />
		<s:param name="tempUserName" value="userName"/>
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
				  </s:url>'><s:property value='#n[0]'/></a></td>
		<td><s:property value='#n[1]'/></td>
		<td><s:property value='#n[2]'/></td>
		<td><s:property value='#n[3]'/></td>
		<td><s:property value='#n[4]'/></td>
		<td><a
		href='<s:url action="applyTeam">
		<s:param name="teamName" value="#n[0]" />
		<s:param name="intendPlace" value="intendPlace" />
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
				  </s:url>'><s:property value="#n[5]"/>
		</a></td>
		<td><a
		href='<s:url action="inviteTeam">
		<s:param name="teamName" value="#n[0]" />
		<s:param name="intendPlace" value="intendPlace" />
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
				  </s:url>'><s:property value="#n[6]"/>
		</a></td>
	</tr>
	</s:iterator>
	</table>
	<br><a
		href='<s:url action="showIntentionTwo">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="intendPlace"/>
				  </s:url>'><img src="iconpng.png" />
	</a>
	<br> <dd style="height:20px"></dd>
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
	</body>
</html>
	