<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
    <title>OpenLayers</title>
    
    <style>
        html, body, #map {
            padding: 0;
            margin: 0;
            width: 100%;
            height: 400px;
        }
    </style>
</head>

<body>

    <div id="map" class="map"></div>
    <form>
        <label>cluster distance</label>
        <input id="distance" type="range" min="0" max="100" step="1" value="40">
    </form>
    
    <script src="<%=request.getContextPath()%>/resources/js/index.js"></script>
	
	<script>
		var distance = document.getElementById('distance');
		var count = 20000;
		var features = new Array(count);
		var e = 4500000;
	
	</script>




</body>

</html>