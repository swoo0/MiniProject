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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
	<!-- iCheck -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
	<!-- JQVMap -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/jqvmap/jqvmap.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
	<!-- overlayScrollbars -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
	<!-- Daterange picker -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/daterangepicker/daterangepicker.css">
	<!-- summernote -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
	
	<!-- 카카오지도 API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bfc1f59f75ca7c1959a90dcd3251e809"></script>
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
          <!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
          <li class="nav-header">시군구</li>
          <li class="nav-item">
            <div class="nav-link">
              <i class="far fa-circle nav-icon"></i>
			  <select id="sgg" name="sgg" class="form-control custom-select" style="width:165px">
			  	<option value="">만안구</option>
			  	<option value="">동안구</option>
			  </select>
            </div>
          </li>
          
          <li class="nav-header">읍면동</li>
          <li class="nav-item">
            <div class="nav-link">
              <i class="far fa-circle nav-icon"></i>
				<select id="emd" name="emd" class="form-control custom-select" style="width:165px">
					<option value="">안양동</option>
					<option value="">석수동</option>
					<option value="">박달동</option>
					<option value="">비산동</option>
					<option value="">관양동</option>
					<option value="">평촌동</option>
					<option value="">호계동</option>
			  </select>
            </div>
          </li>
		  
		  <li class="nav-header">세권</li>
		  <li class="nav-item">
            <div class="nav-link d-flex">
		      <i class="nav-icon far fa-plus-square"></i>
		     	<form role="form" method="post" action="building/search" name="searchBuilding">
			      <div class="form-group d-flex flex-wrap ml-2 mb-1">
			        <div class="form-check ml-2 mb-2 mr-2">
			          <input type="checkbox" class="form-check-input searchType" name="subway" value="subway" onchange="onChange()">
			          <label class="form-check-label">역세권</label>
			        </div>
			        <div class="form-check ml-2 mb-2 mr-2">
			          <input type="checkbox" class="form-check-input searchType" name="school" value="school" onchange="onChange()">
			          <label class="form-check-label">학세권</label>
			        </div>
			        <div class="form-check ml-2 mb-2 mr-2">
			          <input type="checkbox" class="form-check-input searchType" name="park" value="park" onchange="onChange()">
			          <label class="form-check-label">숲세권</label>
			        </div>
			        <div class="form-check ml-2 mb-2 mr-2">
			          <input type="checkbox" class="form-check-input searchType" name="mall" value="mall" onchange="onChange()">
			          <label class="form-check-label">몰세권</label>
			        </div>
			        <div class="form-check ml-2 mr-2">
			          <input type="checkbox" class="form-check-input searchType" name="hospital" value="hospital" onchange="onChange()">
			          <label class="form-check-label">의세권</label>
			        </div>
			        <div class="form-check ml-2 mr-2">
			          <input type="checkbox" class="form-check-input searchType" name="animal24" value="animal24" onchange="onChange()">
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
    </div><!-- /.sidebar -->
  </aside>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="height:640px">
    <!-- Main content -->
		<div class="map_wrap">
		    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
		    <!-- 지도타입 컨트롤 div 입니다 -->
		    <div class="custom_typecontrol radius_border">
		        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
		        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
		    </div>
		    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
		    <div class="custom_zoomcontrol radius_border"> 
		        <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
		        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
		    </div>
		</div>
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
<script type="text/javascript">







var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { // 지도를 생성할 때 필요한 기본 옵션
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // // 지도의 레벨(확대, 축소 정도)
};  

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
function setMapType(maptype) { 
var roadmapControl = document.getElementById('btnRoadmap');
var skyviewControl = document.getElementById('btnSkyview'); 
if (maptype === 'roadmap') {
    map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
    roadmapControl.className = 'selected_btn';
    skyviewControl.className = 'btn';
} else {
    map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
    skyviewControl.className = 'selected_btn';
    roadmapControl.className = 'btn';
}
}

// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
map.setLevel(map.getLevel() + 1);
}

</script>






<script>

<!-- 조회 버튼. -->
function search_go() {
	
// 	$("input:checkbox:checked").each(function() {
// 		console.log($(this).val());
// 	});
	
// 	var subway = $("input[name=subway]:checked").val();
// 	var school = $("input[name=school]:checked").val();
// 	var park = $("input[name=park]:checked").val();
// 	var mall = $("input[name=mall]:checked").val();
// 	var hospital = $("input[name=hospital]:checked").val();
// 	var animal24 = $("input[name=animal24]:checked").val();
	
	let searchTypes = {
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
		data : JSON.stringify(searchTypes),
		contentType : "application/json",
		success : function(result) {
			
			var vectorSource = new ol.source.Vector();
			
			var feature = new ol.Feature({
				
			})
			
			var vectorSource = new ol.source.Vector();
			
			
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

<!-- 리셋 버튼. -->
function reset_go() {
	$("input:checkbox:checked").each(function() {
		$(this).prop("checked", false);
	});
}
</script>



<!-- 체크박스 등록 및 해제 -->
<script>
	function onChange() {
		
		var chk_arr = [];
	
		// 체크된 리스트 가져와서 value 추출
		$("input[name=searchTypes]:checked").each(function() {
			var chk = $(this).val();
			chk_arr.push(chk);
		});
		console.log(chk_arr);
		
	};
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
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/moment/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.js"></script>

<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/pages/dashboard.js"></script>

</body>
</html>
