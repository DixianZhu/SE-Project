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
		#r-result{width:100%;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=QK2UF1IGRcMzCdYmj74GH9vx"></script>
	<title>中文测试</title>
</head>
<body>
	<div style="margin:0 auto; border:#000000 solid 1px; width:200px; float:left" id="r-result"></div>
	<div style="margin:0 auto; border:#000000 solid 1px; width:880px; float:left" id="allmap"></div>
</body>
</html> 
<script  type="text/javascript" >
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var place = "<s:text name='intendPlace'/>";  
	map.centerAndZoom(place, 11);
	var local = new BMap.LocalSearch(place, {
		renderOptions: {map: map, panel: "r-result",autoViewport: true},pageCapacity: 5
	});
	     
	local.search("景点");
	var navigationControl = new BMap.NavigationControl({
    // 靠左上角位置
    anchor: BMAP_ANCHOR_TOP_LEFT,
    // LARGE类型
    type: BMAP_NAVIGATION_CONTROL_LARGE,
    // 启用显示定位
    enableGeolocation: true
  });
  map.addControl(navigationControl);
  // 添加定位控件
  var geolocationControl = new BMap.GeolocationControl();
  geolocationControl.addEventListener("locationSuccess", function(e){
    // 定位成功事件
    var address = '';
    address += e.addressComponent.province;
    address += e.addressComponent.city;
    address += e.addressComponent.district;
    address += e.addressComponent.street;
    address += e.addressComponent.streetNumber;
    alert("当前定位地址为：" + address);
  });
  geolocationControl.addEventListener("locationError",function(e){
    // 定位失败事件
    alert(e.message);
  });
  map.addControl(geolocationControl);
  map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
  map.enableScrollWheelZoom(true);
  
  var stCtrl = new BMap.PanoramaControl(); //构造全景控件
  stCtrl.setOffset(new BMap.Size(20, 20));
  map.addControl(stCtrl);//添加全景控件
</script>
