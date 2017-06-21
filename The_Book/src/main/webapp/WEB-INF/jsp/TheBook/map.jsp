<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=EOdSN63msQkLQLeRvJd8"></script>
</head>
<body>
	<div id="map" style="width: 100%; height: 400px;"></div>
	<script>
		var HOME_PATH = window.HOME_PATH || '.';

		var latlngs = 
			[
				new naver.maps.LatLng
				(
					"${selectVO.storewido }",
					"${selectVO.storekyungdo }"
				),
			];

		var map = new naver.maps.Map
			('map', 
				{
					center : new naver.maps.LatLng
							(	
								"${selectVO.storewido }",
								"${selectVO.storekyungdo }"
							),
					zoom : 11
				}
			);

		var marker = new naver.maps.Marker
			(
				{
					position : new naver.maps.LatLng
					(
						"${selectVO.storewido }",
						"${selectVO.storekyungdo }"
					),
					map : map
				}
			);

		function onMouseOver(e) {
			var marker = e.overlay, seq = marker.get('seq');

			marker.setIcon({
				url : HOME_PATH + '/img/example/sp_pins_spot_v3_over.png',
				size : new naver.maps.Size(24, 37),
				anchor : new naver.maps.Point(12, 37),
				origin : new naver.maps.Point(seq * 29, 50)
			});
		}

		function onMouseOut(e) {
			var marker = e.overlay, seq = marker.get('seq');

			marker.setIcon({
				url : HOME_PATH + '/img/example/sp_pins_spot_v3.png',
				size : new naver.maps.Size(24, 37),
				anchor : new naver.maps.Point(12, 37),
				origin : new naver.maps.Point(seq * 29, 0)
			});
		}
	</script>
</body>
</html>