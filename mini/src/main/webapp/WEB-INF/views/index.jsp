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
		        <div class="form-group d-flex flex-wrap ml-2 mb-1">
		          <div class="form-check ml-2 mb-2 mr-2">
		            <input class="form-check-input" type="checkbox" onchange="onChange(this)">
		            <label class="form-check-label">역세권</label>
		          </div>
		          <div class="form-check ml-2 mb-2 mr-2">
		            <input class="form-check-input" type="checkbox" onchange="onChange(this)">
		            <label class="form-check-label">학세권</label>
		          </div>
		          <div class="form-check ml-2 mb-2 mr-2">
		            <input class="form-check-input" type="checkbox" onchange="onChange(this)">
		            <label class="form-check-label">숲세권</label>
		          </div>
		          <div class="form-check ml-2 mb-2 mr-2">
		            <input class="form-check-input" type="checkbox" onchange="onChange(this)">
		            <label class="form-check-label">몰세권</label>
		          </div>
		          <div class="form-check ml-2 mr-2">
		            <input class="form-check-input" type="checkbox" onchange="onChange(this)">
		            <label class="form-check-label">의세권</label>
		          </div>
		          <div class="form-check ml-2 mr-2">
		            <input class="form-check-input" type="checkbox" onchange="onChange(this)">
		            <label class="form-check-label">견세권</label>
		          </div>
		        </div>
            </div>
          </li>
		    
        </ul>
      </nav><!-- /.sidebar-menu -->
    </div><!-- /.sidebar -->
    
  </aside>

<!-- 
역세권 - 지하철 500m
학세권 - 초중고 500m
숲세권 - 근린공원 500m
몰세권 - 대형마트 500m
의세권 - 대형병원 500m
견세권 - 24시동물병원 500m
 -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="height:640px">

    <!-- Main content -->
	<div id="map"></div>
	
  </div>
  <!-- /.content-wrapper -->
  
  
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



<script type="text/javascript">
	var view = new ol.View({
		center : [ 14129881.51978185, 4494741.861425608 ],
		zoom : 11
	});
	
	var tileSource = new ol.source.TileWMS({
		url : 'http://127.0.0.1:8080/geoserver/wms',
		params : {
			VERSION : '1.3.0',
			LAYERS : 'mini:lsmd_adm_sect_umd_41',
			//LAYERS : 'seoul:admin_emd,seoul:subway,seoul:subway_station',
			WIDTH : 256,
			HEIGHT : 256,
 			STYLES : 'LSMD_ADM_SECT_UMD_41',
			CRS : 'EPSG:5174',
			TILED : true
		},
		serverType : 'geoserver'
	});
	
	var layers = [
		new ol.layer.Tile({
			source : new ol.source.OSM()
		}), new ol.layer.Tile({
			source : tileSource
		})
	];
	
	var map = new ol.Map({
		target : 'map',
		view : view,
		layers : layers
	});
	
	//map.getLayers().getArray()[1].getSource().updateParams({'CQL_FILTER': 'POP2007 > 40000'});
</script>

<script>

<!-- 체크박스 등록 및 해제 -->
function onChange(e) {
	$(e).change(function() {
		console.log(e.checked);
		
// 		if (e.checked == ture) {
		
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
