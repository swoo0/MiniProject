<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>FORCE WAVE</title>
	
	<!-- GIS 관련 -->
	<!-- OpenLayers 3.14.2 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/ol3/v3.14.2/ol.css" type="text/css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/ol3/v3.14.2/ol-debug.js"></script>
	<!-- Proj4js 2.3.6 -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/proj4js/2.3.6/proj4.js"></script>
	<!-- Layer Switcher (walkermatt) -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/ol3/walkermatt/ol3-layerswitcher.css" type="text/css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/ol3/walkermatt/ol3-layerswitcher.js"></script>
	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css" type="text/css">

	<!-- 추가 -->
	<!-- AdminLTE -->
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
	<!-- Theme style -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
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
        <a href="index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fas fa-search"></i>
        </a>
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>
	  <!-- 전체화면 버튼 -->
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <!-- 오른쪽 사이드 메뉴바 버튼 -->
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-controlsidebar-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav><!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-light-primary elevation-4">
  
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img class="brand-image elevation-3" src="<%=request.getContextPath()%>/resources/images/logo_forcewave.png" alt="Logo" style="opacity: .8">
      <span class="brand-text font-weight-light">FORCE WAVE</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-2 pb-2 mb-2 d-flex">
        <div class="info">
          <span class="d-block" style="font-size:1.4em;">안양시 주택 입지 분석</span>
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
		  
		  <li class="nav-header">세권</li>
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
      
      <div style="position: fixed; bottom: 0; width:235px; margin-bottom: 5px">
        <table border="1" style="width:100%;">
        
        	<caption style="caption-side:top;">범례</caption>
        
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
		<div class="map_wrap">
		    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
<!-- 		    지도타입 컨트롤 div 입니다 -->
<!-- 		    <div class="custom_typecontrol radius_border"> -->
<!-- 		        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span> -->
<!-- 		        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span> -->
<!-- 		    </div> -->
<!-- 		    지도 확대, 축소 컨트롤 div 입니다 -->
<!-- 		    <div class="custom_zoomcontrol radius_border">  -->
<!-- 		        <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>   -->
<!-- 		        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span> -->
<!-- 		    </div> -->
		</div>
  </div> <!-- /.content-wrapper -->
  
  
  <footer class="main-footer p-2">
    <strong>COPYRIGHT &nbsp;<a href="http://www.forcewave.co.kr/">㈜ FORCE WAVE</a>&nbsp;&nbsp;</strong>
    All Rights Reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b></b>
    </div>
  </footer>
  
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside><!-- /.control-sidebar -->
  
</div><!-- ./wrapper -->

<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
<script>
window.onload = function() {
	baseMarkerSetting();
}

function baseMarkerSetting() {
	// 지하철역 마커 표시 하기.
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

// 마커를 생성하고 지도위에 표시하는 함수
function addSubwayMarker(position) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
    	position : new kakao.maps.LatLng(position.y, position.x),
        image : subwayImg // 마커 이미지
    });
    // 생성된 마커를 배열에 추가합니다
    subwayMarkers.push(marker);
}
function addSchoolMarker(position) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
    	position : new kakao.maps.LatLng(position.y, position.x),
        image : schoolImg // 마커 이미지
    });
    // 생성된 마커를 배열에 추가합니다
    schoolMarkers.push(marker);
}
function addParkMarker(position) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
    	position : new kakao.maps.LatLng(position.y, position.x),
        image : parkImg // 마커 이미지
    });
    // 생성된 마커를 배열에 추가합니다
    parkMarkers.push(marker);
}
function addMallMarker(position) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
    	position : new kakao.maps.LatLng(position.y, position.x),
        image : mallImg // 마커 이미지
    });
    // 생성된 마커를 배열에 추가합니다
    mallMarkers.push(marker);
}
function addHospitalMarker(position) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
    	position : new kakao.maps.LatLng(position.y, position.x),
        image : hospitalImg // 마커 이미지
    });
    // 생성된 마커를 배열에 추가합니다
    hospitalMarkers.push(marker);
}
function addAnimalMarker(position) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
    	position : new kakao.maps.LatLng(position.y, position.x),
        image : animalImg // 마커 이미지
    });
    // 생성된 마커를 배열에 추가합니다
    animalMarkers.push(marker);
}

// 지하철 마커 보이기 & 감추기
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

// 마커 이미지의 이미지 주소
var subwayImgSrc = "<%=request.getContextPath()%>/resources/img/subway.png"; 
var schoolImgSrc = "<%=request.getContextPath() %>/resources/img/school.png"; 
var parkImgSrc = "<%=request.getContextPath() %>/resources/img/park.png"; 
var mallImgSrc = "<%=request.getContextPath() %>/resources/img/mall.png"; 
var hospitalImgSrc = "<%=request.getContextPath() %>/resources/img/hospital.png"; 
var animalImgSrc = "<%=request.getContextPath() %>/resources/img/animal.png"; 

// 마커 이미지 크기
var imageBigSize = new kakao.maps.Size(50, 50);
var imageSize = new kakao.maps.Size(35, 35); 

// 마커 이미지를 생성
var subwayImg = new kakao.maps.MarkerImage(subwayImgSrc, imageBigSize); 
var schoolImg = new kakao.maps.MarkerImage(schoolImgSrc, imageSize); 
var parkImg = new kakao.maps.MarkerImage(parkImgSrc, imageBigSize); 
var mallImg = new kakao.maps.MarkerImage(mallImgSrc, imageSize); 
var hospitalImg = new kakao.maps.MarkerImage(hospitalImgSrc, imageSize); 
var animalImg = new kakao.maps.MarkerImage(animalImgSrc, imageSize); 

</script>


<script type="text/javascript">

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = { // 지도를 생성할 때 필요한 기본 옵션
    center: new kakao.maps.LatLng(37.398013477648334, 126.93536661667916), // 지도의 중심좌표
    level: 6 // // 지도의 레벨(확대, 축소 정도)
};  
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 각 세권별 마커 표시
// 지도에 표시된 마커 객체를 가지고 있는 배열
var subwayMarkers = [];
var schoolMarkers = [];
var parkMarkers = [];
var mallMarkers = [];
var hospitalMarkers = [];
var animalMarkers = [];

// 마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 3 // 클러스터 할 최소 지도 레벨 
});

// 빌딩 마커 전역변수 선언.
var buildingMarkers = null;


<!-- 조회 버튼. -->
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
</script>


<script>
function addClusterer(points) {
	
	// 마커 이미지의 이미지 주소
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    // 마커 이미지 크기
    var imageSize = new kakao.maps.Size(24, 35); 
    // 마커 이미지를 생성   
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	
    buildingMarkers = $(points).map(function(i, position) {
    	
    	var str = "건물명 : " + position.nm + '\n' +
    			  "주소 : " +  position.dongNm + " " + position.addr + '\n' +
    			  "기준년월 : " +  position.baseYear + '.' + position.baseMonth + '\n' +
    			  "평균공시가격 : " +  position.average + '\n' +
    			  "전체공시가격 : " +  position.total + '\n' +
    			  "단위면적가격 : " +  position.pyeong + '\n' +
    			  "산정공동주택호수 : " +  position.roomCnt + '\n' +
    			  "과년도1평균공시가격 : " +  position.average1 + '\n' +
    			  "과년도2평균공시가격 : " +  position.average2 + '\n' +
    			  "과년도3평균공시가격 : " +  position.average3 + '\n' +
    			  "과년도4평균공시가격 : " +  position.average4 + '\n';
    	
        return new kakao.maps.Marker({
            position : new kakao.maps.LatLng(position.y, position.x),
	        title : str, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지
        });
    });

    // 클러스터러에 마커들을 추가합니다
    clusterer.addMarkers(buildingMarkers);
}


<!-- 리셋 버튼. -->
function reset_go() {
	// 마커클러스터 마커 제거
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
}

function resetClusterer() {
	clusterer.removeMarkers(buildingMarkers);
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
<%-- <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/chart.js/Chart.min.js"></script> --%>
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

<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/pages/dashboard.js"></script>

</body>
</html>
