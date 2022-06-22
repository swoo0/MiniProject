<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 예시 -->

<script>
var view = new ol.View({
		center : [ 14129881.51978185, 4494741.861425608 ],
		zoom : 11
	});
	
	var tileSource = new ol.source.TileWMS({
		url : 'http://127.0.0.1:8080/geoserver/wms',
		params : {
			VERSION : '1.3.0',
			LAYERS : 'mini:anyang_umd',
			//LAYERS : 'seoul:admin_emd,seoul:subway,seoul:subway_station',
			WIDTH : 256,
			HEIGHT : 256,
 			STYLES : 'ANYANG_UMD',
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
	
</script>


<script>

	var view = new ol.View({
		center : [ 14138984.363280362, 4514923.621443103 ],
		zoom : 11
	});
	
	var map = new ol.Map({
		layers : [
			new ol.layer.Tile({
				source : new ol.source.OSM()
			})
		],
		/*logo: {
			href: 'http://design.ubuntu.com/wp-content/uploads/ubuntu-logo32.png',
			src: 'http://design.ubuntu.com/wp-content/uploads/ubuntu-logo32.png'
		},*/
		target : 'map',
		view : view
	});

	var wfsGetFeatureUrl = 'http://127.0.0.1:8081/geoserver/wfs?' + 
		'service=WFS' + 
		'&version=1.1.0' + 
		'&request=GetFeature' + 
		'&typeName=admin_emd' + 
		'&srsName=EPSG:3857' + 
		'&outputFormat=text/javascript' + 
		'&format_options=callback:responseJSON';
			
	$.ajax({
		url : wfsGetFeatureUrl,
		type: 'GET',
		dataType: 'jsonp',
		jsonpCallback: 'responseJSON'
	}).done(function(getFeatureResult) {
		if (getFeatureResult.features != undefined) {
			var vectorLayer = new ol.layer.Vector({
				source: new ol.source.Vector({
					features: (new ol.format.GeoJSON()).readFeatures(getFeatureResult)
				})
			});
			map.addLayer(vectorLayer);
		}
	}).success(function(response) {
		console.log("success");
	}).fail(function(response) {
		console.log("fail");
	});	

</script>

</body>
</html>