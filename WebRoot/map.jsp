<%@ page language="java" import="java.util.*,java.sql.*"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#allmap{width:100%;height:500px;}
		p{margin-left:5px; font-size:14px;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=QK2UF1IGRcMzCdYmj74GH9vx"></script>
	<title>中文测试</title>
</head>
<body>
	<div id="allmap"></div>
</body>
</html>
<script  type="text/javascript" >
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var place = "<s:text name='intendPlace'/>";  
	map.centerAndZoom(place, 11);
	var local = new BMap.LocalSearch(map, {
		renderOptions:{map: map}
	});
	map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
	map.enableScrollWheelZoom(true);
	local.search("酒店");
</script>
