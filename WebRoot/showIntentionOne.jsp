<%@ page language="java" import="java.util.*,java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>

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
.blue {
 color: #19667d;

 background: #70c9e3; /* Old browsers */
 background: -moz-linear-gradient(top,  #70c9e3 0%, #39a0be 100%); /* FF3.6+ */
 background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#70c9e3), color-stop(100%,#39a0be)); /* Chrome,Safari4+ */
 background: -webkit-linear-gradient(top,  #70c9e3 0%,#39a0be 100%); /* Chrome10+,Safari5.1+ */
 background: -o-linear-gradient(top,  #70c9e3 0%,#39a0be 100%); /* Opera 11.10+ */
 background: -ms-linear-gradient(top,  #70c9e3 0%,#39a0be 100%); /* IE10+ */
 background: linear-gradient(top,  #70c9e3 0%,#39a0be 100%); /* W3C */
}

</style>
</head>
<meta charset="utf-8">
<body bgcolor="#FFF8DC">
<h2>These are your intention:</h2>
<table class="bordered">
<thead>

    <tr>
        <th>编号</th>        
        <th>目的地</th>
        <th>出发时间</th>
		<th>#</th>
		<th>#</th>
		<th>#</th>
    </tr>
    </thead>
	     
	<s:iterator value="res" status="itStatus" id='n'>
	
	<tr>
		<td><s:property value="#itStatus.count" /></td>
		<td><s:property value='#n[0]' /></td>
		<td><s:property value='#n[1]' /></td>
		<td><a
			href='<s:url action="showIntentionTwo">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="#n[0]" />
				  </s:url>' class="button orange">详细信息
		</a></td> 
		<td><a
			href='<s:url action="mapPlace">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="#n[0]" />
				  </s:url>' class="button orange">查看地图
		</a></td> 
		<td><a
			href='<s:url action="deleteIntention">
		<s:param name="userName" value="userName" />
		<s:param name="passWord" value="passWord"/>
		<s:param name="intendPlace" value="#n[0]" />
				  </s:url>' class="button orange">删除
		</a></td>
		</tr>
	</s:iterator>
	</table>
	
	<a
		href='<s:url action="contactUserName">
	    <s:param name="userName" value="userName"/>
	    <s:param name="passWord" value="passWord"/>
	</s:url>' class="button blue" >添加一个新旅游意向</a>
		<br>
	<a
		href='<s:url action="login">
		<s:param name="userName" value="userName"/>
		<s:param name="passWord" value="passWord"/>
				  </s:url>' class="button blue">返回主界面
		</a>
		</td>
	</tr>
	</table>
</body>
</html>
