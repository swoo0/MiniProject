<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>FORCE WAVE</title>

	<!-- AdminLTE -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Tempusdominus Bootstrap 4 -->
<%-- 	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css"> --%>
	<!-- iCheck -->
<%-- 	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/icheck-bootstrap/icheck-bootstrap.min.css"> --%>
	<!-- JQVMap -->
<%-- 	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/jqvmap/jqvmap.min.css"> --%>
	<!-- overlayScrollbars -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
	<!-- Daterange picker -->
<%-- 	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/daterangepicker/daterangepicker.css"> --%>
	<!-- summernote -->
<%-- 	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css"> --%>
	
	<!-- 카카오지도 API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bfc1f59f75ca7c1959a90dcd3251e809&libraries=services,clusterer,drawing"></script>
	
	<style>
		html, body {width:100%;height:100%;margin:0;padding:0;} 
		.map_wrap {position:relative;overflow:hidden;width:100%;height:100%;}
		.radius_border{border:1px solid #919191;border-radius:5px;}     
		.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
		.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
		.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
		.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
		.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
		.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
		.custom_typecontrol .selected_btn:hover {color:#fff;}   
		.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
		.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
		.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
		.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}            
		
		.wrap {position: absolute;left: -178px;bottom: -33px;width: 652px;height: 252px;margin-left: -72px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	    .wrap * {padding: 0;margin: 0;}
	    .wrap .info {width: 650px;height: 240px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	    .info .title {padding: 3px 0 0 10px;height: 30px;background: rgb(201, 203, 207);border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
 	    .info .close {position: absolute;top: 7px;right: 12px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
 	    .info .close:hover {cursor: pointer;}
	    .info .body {position: relative;overflow: hidden;}
	    .info .desc {position: relative;margin: 5px 0 0 265px;height: 200px;}
	    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap; font-size: 18px;}
 	    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px; font-size: 18px;}
 	    .info .chartDiv {position: absolute;top: 6px;left: 5px;width: 250px;height: 240x;border: 1px solid #ddd;color: #888;overflow: hidden;} 
 	    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	    .info .link {color: #5085BB;}
		
		.emdInfo .title {padding: 3px 0 0 10px; width:200px;height: 30px;background: rgb(201, 203, 207);border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
		.emdInfo .size {margin:10px;}
		
		.area {
		    position: absolute;
		    background: #fff;
		    border: 1px solid #888;
		    border-radius: 3px;
		    font-size: 20px;
		    top: -5px;
		    left: 15px;
		    padding:2px;
		}
		
		#category {
		    position: absolute;
/* 		    bottom: 10px; */
/* 		    right: 10px; */
		    top: 7px;
		    left: 10px;
		    border-radius: 5px;
		    border: 1px solid #909090;
		    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
		    background: #fff;
		    overflow: hidden;
		    z-index: 2;
		    padding: 0;
		}
		#category li {
		    float: left;
		    list-style: none;
		    width: 70px;
		    border-right: 1px solid #acacac;
		    padding: 6px 0;
		    text-align: center;
		    cursor: pointer;
		}
		#category li.on {
		    background: rgb(221, 219, 219);
		}
		#category li:hover {
		    background: #ffe6e6;
		    border-left: 1px solid #acacac;
		    margin-left: -1px;
		}
		#category li:last-child{
		    margin-right: 0;
		    border-right: 0;
		}
		#category li span {
		    display: block;
		    margin: 0 auto 3px;
		    width: 30px;
		    height: 30px;
		}
		
		#category li .subway-c {
		    background-image:url("<%=request.getContextPath() %>/resources/images/subway.png");
		    background-size: 32px 32px;
		}
		#category li .school-c {
		    background-image:url("<%=request.getContextPath() %>/resources/images/school.png");
		    background-size: 31px 32px;
		}
		#category li .park-c {
		    background-image:url("<%=request.getContextPath() %>/resources/images/park.png");
		    background-size: 31px 32px;
		}
		#category li .mall-c {
		    background-image:url("<%=request.getContextPath() %>/resources/images/mall.png");
		    background-size: 31px 32px;
		}
		#category li .hospital-c {
		    background-image:url("<%=request.getContextPath() %>/resources/images/hospital.png");
		    background-size: 31px 32px;
		}
		#category li .animal-c {
		    background-image:url("<%=request.getContextPath() %>/resources/images/animal.png");
		    background-size: 31px 32px;
		}
		#category li .building-c {
		    background-image:url("https://t1.kakaocdn.net/localimg/localimages/07/mapapidoc/markerStar.png");
		    background-size: 30px 35px;
		}

	</style>
</head>

<body class="hold-transition sidebar-mini layout-fixed">

<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="<%=request.getContextPath()%>/resources/images/logo_forcewave.png" alt="Forcewave_logo" width="200" height="100">
  </div>

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
  
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
      	<span id="txt"></span>
      </li>
<!--       <li class="nav-item d-none d-sm-inline-block"> -->
<!--         <a href="#" class="nav-link">home</a> -->
<!--       </li> -->
<!--       <li class="nav-item d-none d-sm-inline-block"> -->
<!--         <a href="#" class="nav-link">Contact</a> -->
<!--       </li> -->
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
	  <!-- 전체화면 버튼 -->
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <!-- 오른쪽 사이드 메뉴바 버튼 -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link" data-widget="control-sidebar" data-controlsidebar-slide="true" href="#" role="button"> -->
<!--           <i class="fas fa-th-large"></i> -->
<!--         </a> -->
<!--       </li> -->
    </ul>
  </nav><!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-light-primary elevation-4">
  
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
      <img class="brand-image elevation-3" src="<%=request.getContextPath()%>/resources/images/logo_forcewave.png" alt="Logo" style="opacity: .8">
      <span class="brand-text font-weight-light">FORCE WAVE</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar" style="position:relative;">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-2 pb-2 mb-2 d-flex">
        <div style="text-align:center; font-size:1.4em;">
          <span class="d-block">&nbsp;&nbsp;안양시 주택 입지 분석</span>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
<!--           Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
<!--           <li class="nav-header">시군구</li> -->
<!--           <li class="nav-item"> -->
<!--             <div class="nav-link"> -->
<!--               <i class="far fa-circle nav-icon"></i> -->
<!-- 			  <select id="sgg" name="sgg" class="form-control custom-select" style="width:165px"> -->
<!-- 			  	<option value="">만안구</option> -->
<!-- 			  	<option value="">동안구</option> -->
<!-- 			  </select> -->
<!--             </div> -->
<!--           </li> -->
          
<!--           <li class="nav-header">읍면동</li> -->
<!--           <li class="nav-item"> -->
<!--             <div class="nav-link"> -->
<!--               <i class="far fa-circle nav-icon"></i> -->
<!-- 				<select id="emd" name="emd" class="form-control custom-select" style="width:165px"> -->
<!-- 					<option value="">안양동</option> -->
<!-- 					<option value="">석수동</option> -->
<!-- 					<option value="">박달동</option> -->
<!-- 					<option value="">비산동</option> -->
<!-- 					<option value="">관양동</option> -->
<!-- 					<option value="">평촌동</option> -->
<!-- 					<option value="">호계동</option> -->
<!-- 			  </select> -->
<!--             </div> -->
<!--           </li> -->
		  <li class="nav-header" style="font-size:1.2em;">세권</li>
		  <li class="nav-item">
            <div class="nav-link d-flex">
		      <i class="nav-icon far fa-plus-square"></i>
		     	<form role="form" method="post" action="building/search" name="searchBuilding">
			      <div class="form-group d-flex flex-wrap ml-2 mb-1">
			        <div class="form-check ml-2 mb-2 mr-2">
			          <input type="checkbox" class="form-check-input searchType" name="subway" value="subway" onchange="onChange(this);">
			          <label class="form-check-label">역세권</label>
			        </div>
			        <div class="form-check ml-2 mb-2 mr-2">
			          <input type="checkbox" class="form-check-input searchType" name="school" value="school" onchange="onChange(this);">
			          <label class="form-check-label">학세권</label>
			        </div>
			        <div class="form-check ml-2 mb-2 mr-2">
			          <input type="checkbox" class="form-check-input searchType" name="park" value="park" onchange="onChange(this);">
			          <label class="form-check-label">숲세권</label>
			        </div>
			        <div class="form-check ml-2 mb-2 mr-2">
			          <input type="checkbox" class="form-check-input searchType" name="mall" value="mall" onchange="onChange(this);">
			          <label class="form-check-label">몰세권</label>
			        </div>
			        <div class="form-check ml-2 mr-2">
			          <input type="checkbox" class="form-check-input searchType" name="hospital" value="hospital" onchange="onChange(this);">
			          <label class="form-check-label">의세권</label>
			        </div>
			        <div class="form-check ml-2 mr-2">
			          <input type="checkbox" class="form-check-input searchType" name="animal24" value="animal24" onchange="onChange(this);">
			          <label class="form-check-label" >견세권</label>
			        </div>
			      </div>
		      </form> 
            </div>
          </li>
          
          <div class="row">
            <div class="col-2 ml-2"></div>
          	<div class="col-4">
          		<button type="button" class="btn btn-primary" id="searchBtn" onclick="search_go();">조&nbsp;&nbsp;회</button>  
          	</div>
          	<div class="col-4">
          		<button type="button" class="btn btn-primary" id="resetBtn" onclick="reset_go();">초기화</button>  
          	</div>
          </div>
       
        </ul>
        
      </nav><!-- /.sidebar-menu -->
      
      <div style="position:absolute; bottom:0px; width:235px; margin-bottom: 7px;">
        <table border="1" style="width:100%;">
        
        	<caption style="caption-side:top;">※ 세권의 기준</caption>
        
        	<tr>
        		<th style="text-align:center;">역세권</th>
        		<td>&nbsp;지하철역 500m</td>
        	</tr>
        	<tr>
        		<th style="text-align:center;">학세권</th>
        		<td>&nbsp;초중고등학교 500m</td>
        	</tr>
        	<tr>
        		<th style="text-align:center;">숲세권</th>
        		<td>&nbsp;근린공원 500m</td>
        	</tr>
        	<tr>
        		<th style="text-align:center;">몰세권</th>
        		<td>&nbsp;대형 쇼핑몰 500m</td>
        	</tr>
        	<tr>
        		<th style="text-align:center;">의세권</th>
        		<td>&nbsp;대형병원 500m</td>
        	</tr>
        	<tr>
        		<th style="text-align:center;">견세권</th>
        		<td>&nbsp;24시 동물병원 500m</td>
        	</tr>
        </table>
      </div> 
      
    </div><!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="height:640px">
    <!-- Main content -->
	<div class="map_wrap" id="mapwrap">
	    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	    <!-- 지도 카테고리 -->
        <ul id="category">
            <li id="subway" data-order="0">
                <span class="category_bg subway-c"></span>
                지하철
            </li>
            <li id="school" data-order="1">
                <span class="category_bg school-c"></span>
                학교
            </li>
            <li id="park" data-order="2">
                <span class="category_bg park-c"></span>
                공원
            </li>
            <li id="mall" data-order="3">
                <span class="category_bg mall-c"></span>
                쇼핑몰
            </li>
            <li id="hospital" data-order="4">
                <span class="category_bg hospital-c"></span>
                대형병원
            </li>
            <li id="animal" data-order="5">
                <span class="category_bg animal-c"></span>
                동물병원
            </li>
            <li id="building" data-order="6">
                <span class="category_bg building-c"></span>
                주택
            </li>
        </ul>
	</div>
  </div> <!-- /.content-wrapper -->
  
  <footer class="main-footer p-2">
    <strong>COPYRIGHT &nbsp;<a href="http://www.forcewave.co.kr/">㈜ FORCE WAVE</a>&nbsp;&nbsp;</strong>
    All Rights Reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b></b>
    </div>
  </footer>
  
</div><!-- ./wrapper -->


<!-- -------------------------------------------------------------------------------------------------------------------------------- -->


<!-- 페이지 로딩 시 베이스 폴리곤 및 세권 마커 가져오기. -->
<script>
	window.onload = function() {
		polygonSetting();
		baseMarkerSetting();
	}
</script>

<!-- 기본 맵 세팅 -->
<script>
	var mapContainer = document.getElementById('map') // 지도를 표시할 div
	var mapCenter = new kakao.maps.LatLng(37.407070047740696, 126.93536661667916);
	
	mapOption = { 	// 지도를 생성할 때 필요한 기본 옵션
	    center: new kakao.maps.LatLng(37.407070047740696, 126.93536661667916), // 지도의 중심좌표
	    level: 7 	// 지도의 레벨(확대, 축소 정도)
	};  
	var map = new kakao.maps.Map(mapContainer, mapOption),
		customOverlay = new kakao.maps.CustomOverlay({}),
		infowindow = new kakao.maps.InfoWindow({removable: true});
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 지도에 표시된 마커 객체를 가지고 있는 배열
	var buildingMarkers = [];
	var subwayMarkers = [];
	var schoolMarkers = [];
	var parkMarkers = [];
	var mallMarkers = [];
	var hospitalMarkers = [];
	var animalMarkers = [];
	
	// 마커 클러스터러를 생성
	var clusterer = new kakao.maps.MarkerClusterer({
	    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	    minLevel: 3 // 클러스터 할 최소 지도 레벨 
	});
	
	// 마커 이미지의 이미지 주소
	var imageSrc = "https://t1.kakaocdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	var subwayImgSrc = "<%=request.getContextPath()%>/resources/images/subway.png"; 
	var schoolImgSrc = "<%=request.getContextPath() %>/resources/images/school.png"; 
	var parkImgSrc = "<%=request.getContextPath() %>/resources/images/park.png"; 
	var mallImgSrc = "<%=request.getContextPath() %>/resources/images/mall.png"; 
	var hospitalImgSrc = "<%=request.getContextPath() %>/resources/images/hospital.png"; 
	var animalImgSrc = "<%=request.getContextPath() %>/resources/images/animal.png"; 
	
	// 마커 이미지 크기
	var imageSmallSize = new kakao.maps.Size(24, 35);
	var imageSize = new kakao.maps.Size(35, 35);
	var imageMiddleSize = new kakao.maps.Size(40, 40);
	var imageBigSize = new kakao.maps.Size(50, 50);
	
	// 마커 이미지를 생성
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSmallSize); 
	var subwayImg = new kakao.maps.MarkerImage(subwayImgSrc, imageBigSize); 
	var schoolImg = new kakao.maps.MarkerImage(schoolImgSrc, imageSize); 
	var parkImg = new kakao.maps.MarkerImage(parkImgSrc, imageMiddleSize); 
	var mallImg = new kakao.maps.MarkerImage(mallImgSrc, imageMiddleSize); 
	var hospitalImg = new kakao.maps.MarkerImage(hospitalImgSrc, imageSize); 
	var animalImg = new kakao.maps.MarkerImage(animalImgSrc, imageSize); 

</script>


<!-- 행정구역 폴리곤 생성 함수 -->
<script>
	function polygonSetting() {
		// geojson 형태의 파일 불러오기
		$.getJSON("<%=request.getContextPath() %>/resources/json/anyang_emd.json", function(geojson) {
			var data = geojson.features;
		    var coordinates = [];     // 좌표 저장할 배열
		    var name = '';            // 행정 구 이름
		    
		    $.each(data, function(index, val) {
		        coordinates = val.geometry.coordinates;
		        name = val.properties.EMD_NM;
		        
		        displayArea(coordinates, name);
		    })
		})
		
		var polygons = [];   // function 안 쪽에 지역변수로 넣으니깐 폴리곤 하나 생성할 때마다 배열이 비어서 클릭했을 때 전체를 못 없애줌.  그래서 전역변수로 만듦.
		
		// 행정구역 폴리곤(다각형) 표시하기
		function displayArea(coordinates, name) {
			var path = [];     // 폴리곤 그려줄 path
			var points = [];   // 중심좌표 구하기 위한 지역구 좌표들
		  
			$.each(coordinates[0], function(index, coordinate) {	// console.log(coordinates)를 확인해보면 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
				var point = new Object(); 
				point.x = coordinate[1];
				point.y = coordinate[0];
				points.push(point);
				path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));		//new kakao.maps.LatLng가 없으면 인식을 못해서 path 배열에 추가
			})
		  
			// 폴리곤 생성
			var polygon = new kakao.maps.Polygon({
				map : map, // 다각형을 표시할 지도 객체
			    path : path,
			    strokeWeight : 4,
			    strokeColor : '#004c80',
			    strokeOpacity : 0.3,
			    fillColor : '#fff',
			    fillOpacity : 0.3
			});
		  
			polygons.push(polygon);    // 폴리곤 제거하기 위한 배열
			
			// 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경
			// 지역명을 표시하는 커스텀오버레이를 지도위에 표시
			
			kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
				// 지도 레벨이 3보다 클 때만 이벤트 발생.
				if (map.getLevel() > 4) {
					polygon.setOptions({fillColor: '#09f'});
					customOverlay.setContent('<div class="area">' + name + '</div>');
					customOverlay.setPosition(mouseEvent.latLng); 
					customOverlay.setMap(map);
				}
			});

			// 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경
			kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
			    customOverlay.setPosition(mouseEvent.latLng); 
			});
			
			// 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경
			kakao.maps.event.addListener(polygon, 'mouseout', function() {
				polygon.setOptions({fillColor: '#fff'});
			    customOverlay.setMap(null);
			}); 
			
			// 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 해당 지역 총면적을 띄웁니다.
			kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
				var content = '<div class="emdInfo">' + 
				            '   <div class="title">' + name + '</div>' +
				            '   <div class="size"> 총 면적 : 약 ' + Math.floor(polygon.getArea()) + ' m<sup>2</sup></div>' +
				            '</div>';
				infowindow.setContent(content); 
				infowindow.setPosition(mouseEvent.latLng); 
				infowindow.setMap(map);
			});
		}
		
	}
</script>


<!-- 베이스 마커 생성 함수 -->
<script> 
	function baseMarkerSetting() {
		$.ajax({
			url : "<%=request.getContextPath() %>/subway",
			type : "GET",
			success : function(positions) {
				$(positions).map(function(i, position) {
					addSubwayMarker(position);
				});
			},
			error : function(request, status, error) {
				Swal.fire({
					text: '에러가 발생되었습니다. 에러코드' + error,
					icon: 'error',
					confirmButtonColor: '#007bff',
					confirmButtonText: '확인'
				})
			}
		});
		$.ajax({
			url : "<%=request.getContextPath() %>/school",
			type : "GET",
			success : function(positions) {
				$(positions).map(function(i, position) {
					addSchoolMarker(position);
				});
			},
			error : function(request, status, error) {
				Swal.fire({
					text: '에러가 발생되었습니다. 에러코드' + error,
					icon: 'error',
					confirmButtonColor: '#007bff',
					confirmButtonText: '확인'
				})
			}
		});
		$.ajax({
			url : "<%=request.getContextPath() %>/park",
			type : "GET",
			success : function(positions) {
				$(positions).map(function(i, position) {
					addParkMarker(position);
				});
			},
			error : function(request, status, error) {
				Swal.fire({
					text: '에러가 발생되었습니다. 에러코드' + error,
					icon: 'error',
					confirmButtonColor: '#007bff',
					confirmButtonText: '확인'
				})
			}
		});
		$.ajax({
			url : "<%=request.getContextPath() %>/mall",
			type : "GET",
			success : function(positions) {
				$(positions).map(function(i, position) {
					addMallMarker(position);
				});
			},
			error : function(request, status, error) {
				Swal.fire({
					text: '에러가 발생되었습니다. 에러코드' + error,
					icon: 'error',
					confirmButtonColor: '#007bff',
					confirmButtonText: '확인'
				})
			}
		});
		$.ajax({
			url : "<%=request.getContextPath() %>/hospital",
			type : "GET",
			success : function(positions) {
				$(positions).map(function(i, position) {
					addHospitalMarker(position);
				});
			},
			error : function(request, status, error) {
				Swal.fire({
					text: '에러가 발생되었습니다. 에러코드' + error,
					icon: 'error',
					confirmButtonColor: '#007bff',
					confirmButtonText: '확인'
				})
			}
		});
		$.ajax({
			url : "<%=request.getContextPath() %>/animal",
			type : "GET",
			success : function(positions) {
				$(positions).map(function(i, position) {
					addAnimalMarker(position);
				});
			},
			error : function(request, status, error) {
				Swal.fire({
					text: '에러가 발생되었습니다. 에러코드' + error,
					icon: 'error',
					confirmButtonColor: '#007bff',
					confirmButtonText: '확인'
				})
			}
		});
	}
	
	// 각 세권별 마커를 생성하여 지도위에 표시하는 함수
	function addSubwayMarker(position) {
	    // 마커 생성
	    var marker = new kakao.maps.Marker({
	    	position : new kakao.maps.LatLng(position.y, position.x),
	    	title : position.line.substring(1) + ' ' + position.nm + '역',
	        image : subwayImg 	// 마커 이미지
	    });
	    // 생성된 마커를 배열에 추가
	    subwayMarkers.push(marker);
	}
	function addSchoolMarker(position) {
	    var marker = new kakao.maps.Marker({
	    	position : new kakao.maps.LatLng(position.y, position.x),
	    	title : position.nm,
	        image : schoolImg
	    });
	    schoolMarkers.push(marker);
	}
	function addParkMarker(position) {
	    var marker = new kakao.maps.Marker({
	    	position : new kakao.maps.LatLng(position.y, position.x),
	    	title : position.nm,
	        image : parkImg
	    });
	    parkMarkers.push(marker);
	}
	function addMallMarker(position) {
	    var marker = new kakao.maps.Marker({
	    	position : new kakao.maps.LatLng(position.y, position.x),
	    	title : position.nm,
	        image : mallImg
	    });
	    mallMarkers.push(marker);
	}
	function addHospitalMarker(position) {
	    var marker = new kakao.maps.Marker({
	    	position : new kakao.maps.LatLng(position.y, position.x),
	    	title : position.nm,
	        image : hospitalImg
	    });
	    hospitalMarkers.push(marker);
	}
	function addAnimalMarker(position) {
	    var marker = new kakao.maps.Marker({
	    	position : new kakao.maps.LatLng(position.y, position.x),
	    	title : position.nm,
	        image : animalImg
	    });
	    animalMarkers.push(marker);
	}
</script>


<!-- 체크박스 및 조회, 초기화 버튼 이벤트 -->
<script>
	// 체크박스의 onChange 이벤트 함수 - 마커 보이기 & 감추기
	function onChange(chkBox) {
		if ($(chkBox).is(':checked') == true) {
			if ($(chkBox).val() == "subway") showMarkers("subway");
			if ($(chkBox).val() == "school") showMarkers("school");
			if ($(chkBox).val() == "park") showMarkers("park");
			if ($(chkBox).val() == "mall") showMarkers("mall");
			if ($(chkBox).val() == "hospital") showMarkers("hospital");
			if ($(chkBox).val() == "animal24") showMarkers("animal24");
		} else {
			if ($(chkBox).val() == "subway") hideMarkers("subway");
			if ($(chkBox).val() == "school") hideMarkers("school");
			if ($(chkBox).val() == "park") hideMarkers("park");
			if ($(chkBox).val() == "mall") hideMarkers("mall");
			if ($(chkBox).val() == "hospital") hideMarkers("hospital");
			if ($(chkBox).val() == "animal24") hideMarkers("animal24");
		}
	}
	
	// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수
	function showMarkers(type) {
		if (type == "subway") setSubwayMarkers(map);
		if (type == "school") setSchoolMarkers(map);
		if (type == "park") setParkMarkers(map);
		if (type == "mall") setMallMarkers(map);
		if (type == "hospital") setHospitalMarkers(map);
		if (type == "animal24") setAnimalMarkers(map);
	}
	// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수
	function hideMarkers(type) {
		if (type == "subway") setSubwayMarkers(null);
		if (type == "school") setSchoolMarkers(null);
		if (type == "park") setParkMarkers(null);
		if (type == "mall") setMallMarkers(null);
		if (type == "hospital") setHospitalMarkers(null);
		if (type == "animal24") setAnimalMarkers(null);
	}
	
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수
	function setSubwayMarkers(map) {
	    for (var i = 0; i < subwayMarkers.length; i++) {
	    	subwayMarkers[i].setMap(map);
	    }            
	}
	function setSchoolMarkers(map) {
	    for (var i = 0; i < schoolMarkers.length; i++) {
	    	schoolMarkers[i].setMap(map);
	    }            
	}
	function setParkMarkers(map) {
	    for (var i = 0; i < parkMarkers.length; i++) {
	    	parkMarkers[i].setMap(map);
	    }            
	}
	function setMallMarkers(map) {
	    for (var i = 0; i < mallMarkers.length; i++) {
	    	mallMarkers[i].setMap(map);
	    }            
	}
	function setHospitalMarkers(map) {
	    for (var i = 0; i < hospitalMarkers.length; i++) {
	    	hospitalMarkers[i].setMap(map);
	    }            
	}
	function setAnimalMarkers(map) {
	    for (var i = 0; i < animalMarkers.length; i++) {
	    	animalMarkers[i].setMap(map);
	    }            
	}
	

	// 조회 버튼
	function search_go() {
		// 기존 마커클러스터 초기화
		clusterer.clear();
		
		let searchTypeMap = {
			"subway" : $("input[name=subway]:checked").val(),
			"school" : $("input[name=school]:checked").val(),
			"park" : $("input[name=park]:checked").val(),
			"mall" : $("input[name=mall]:checked").val(),
			"hospital" : $("input[name=hospital]:checked").val(),
			"animal24" : $("input[name=animal24]:checked").val()
		}
	    
		$.ajax({
			url : "<%=request.getContextPath() %>/building/search",
			type : "POST",
			data : JSON.stringify(searchTypeMap),
			contentType : "application/json",
			success : function(points) {
				addClusterer(points);
			},
			error : function(request, status, error) {
				Swal.fire({
					text: '에러가 발생되었습니다. 에러코드' + error,
					icon: 'error',
					confirmButtonColor: '#007bff',
					confirmButtonText: '확인'
				})
			}
		});
		
	}

	// 마커 클러스터 추가 
	function addClusterer(points) {
		
		buildingMarkers = $(points).map(function(i, position) {
			var averageComma = Number(position.average).toLocaleString();
			var totalComma = Number(position.total).toLocaleString();
			var pyeongComma = Number(position.pyeong).toLocaleString();
			var average1Comma = Number(position.average1).toLocaleString();
			var average2Comma = Number(position.average2).toLocaleString();
			var average3Comma = Number(position.average3).toLocaleString();
			var average4Comma = Number(position.average4).toLocaleString();

			// 차트 그리기용 데이터
			data = [];
			data.push(position.average4);
			data.push(position.average3);
			data.push(position.average2);
			data.push(position.average1);
			data.push(position.average);
			
		 	var str = '<div class="wrap">' + 
				          '    <div class="info">' + 
				          '        <div class="title">' + position.nm + 
// 				          '            <div class="close" onclick="closeInfoWindow(infowindow);" title="닫기"></div>' + 
				          '        </div>' + 
				          '        <div class="body">' + 
				          '            <div class="chartDiv">' +
				          '                <canvas id="myChart" width="250" height="195"></canvas>' +
				          '            </div>' +
				          '            <div class="desc">' +
				          '                <div class="ellipsis">' + '주소 : ' + position.dongNm + ' ' + position.addr +  '</div>' +
				          '                <div class="jibun ellipsis">' + '평균공시가격 : ' + averageComma +  '원</div>' +
				          '                <div class="jibun ellipsis">' + '전체공시가격 : ' + totalComma +  '원</div>' +
				          '                <div class="jibun ellipsis">' + '단위면적가격 : ' + pyeongComma +  '원</div>' +
				          '                <div class="jibun ellipsis">' + '기준연월 : ' + position.baseYear + '.' + position.baseMonth +  '</div>' +
				          '            </div>' +
				          '        </div>' +
				          '    </div>' +
				          '</div>';
	    	
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: str 	// 인포윈도우에 표시할 내용
		    });		  

			var marker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(position.y, position.x),
// 				title : str, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage // 마커 이미지
			});
			
			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow, data));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			
			return marker;
	    });

	    // 클러스터러에 마커들을 추가합니다
	    clusterer.addMarkers(buildingMarkers);
	}
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow, data) {
	    return function() {
	        infowindow.open(map, marker);
	        addChart(data);
	    };
	}
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
	// 리셋 버튼
	function reset_go() {
		// 마커클러스터 초기화
		clusterer.clear();
	
		// 체크박스 해제 및 마커 hide처리
		$("input:checkbox:checked").each(function() {
			$(this).prop("checked", false);
			hideMarkers("subway");
			hideMarkers("school");
			hideMarkers("park");
			hideMarkers("mall");
			hideMarkers("hospital");
			hideMarkers("animal24");
		});
		
		// 중심 좌표로 이동
		map.setCenter(mapCenter);
		
		// 맵 확대 레벨 초기화
		map.setLevel(7);
	}	
</script>



<!-- Chart.js -->
<script>

function addChart(data) {
	
	var ctx = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	        labels: ['2017', '2018', '2019', '2020', '2021'],
	        datasets: [{
	            label: '연도별 평균공시가격',
	            data: data,
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            fill: false,
	            borderWidth: 1,
	            tension:0.1
	        }]
	    },
	    options: {
	    	responsive: false,
	        scales: {
	            yAxes: [{
	            	ticks: {
	  	              beginAtZero: false,
	  	              maxTicksLimit: 5,
	  	              callback: function(value, index) {
	  	                if(value.toString().length > 8) return (Math.floor(value / 100000000)).toLocaleString("ko-KR") + "억";
	  	                else if(value.toString().length > 4) return (Math.floor(value / 10000)).toLocaleString("ko-KR") + "만";
	  	                else return value.toLocaleString("ko-KR"); 
	  	              }
	            	}
	            }]
	        }
	    }
	});
	
}
</script>


<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<%-- <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/sparklines/sparkline.js"></script> --%>
<!-- JQVMap -->
<%-- <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jqvmap/jquery.vmap.min.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jqvmap/maps/jquery.vmap.usa.js"></script> --%>
<!-- jQuery Knob Chart -->
<%-- <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery-knob/jquery.knob.min.js"></script> --%>
<!-- daterangepicker -->
<%-- <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/moment/moment.min.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/daterangepicker/daterangepicker.js"></script> --%>
<!-- Tempusdominus Bootstrap 4 -->
<%-- <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script> --%>
<!-- Summernote -->
<%-- <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script> --%>
<!-- overlayScrollbars -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.js"></script>
<!-- AdminLTE Dashboard -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/pages/dashboard.js"></script>

</body>
</html>
