<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>TRAVEL MAKER</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d29d7ed5d29836757df06e0789cba3db&libraries=services"></script>
<script>
	$(function() {

		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [];
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new daum.maps.LatLng(37.5666102, 126.9783881), // 지도의 중심좌표
			level : 4
		// 지도의 확대 레벨
		};
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		//===============================================================================
		var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
		var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
		var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
		var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
		var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		addMark();
		var i = 0;
		var check = true;
		$("#green").click(function() {
			var marktitle = $("#green").attr("title");

			for (i = 0; i < positions.length; i++) {
				if (positions[i].title == marktitle) {
					positions[i].title;
					check = false;
					break;
				} else {
					check = true;
				}
			}
			if (check) {
				positions.push({
					title : 'green',
					latlng : new daum.maps.LatLng(33.451393, 126.570738)
				});
				addMark();
			}
		})

		$("#cacao").click(function() {
			marktitle = $("#cacao").attr("title");
			for (i = 0; i < positions.length; i++) {
				if (positions[i].title == marktitle) {
					check = false;
					break;
				} else {
					check = true;
				}
			}
			if (check) {
				positions.push({
					title : 'cacao',
					latlng : new daum.maps.LatLng(33.450705, 126.570677)
				});
				addMark();
			}
		})
		$("#yunmot").click(function() {
			marktitle = $("#yunmot").attr("title");

			for (i = 0; i < positions.length; i++) {
				if (positions[i].title == marktitle) {
					check = false;
					break;
				} else {
					check = true;
				}
			}
			if (check) {
				positions.push({
					title : 'yunmot',
					latlng : new daum.maps.LatLng(33.450936, 126.569477)
				});
				addMark();
			}
		})
		$("#batt").click(function() {
			marktitle = $("#batt").attr("title");
			for (i = 0; i < positions.length; i++) {
				if (positions[i].title == marktitle) {
					check = false;
					break;
				} else {
					check = true;
				}
			}
			if (check) {
				positions.push({
					title : 'batt',
					latlng : new daum.maps.LatLng(33.450879, 126.569940)
				});
				addMark();
			}
		})
		function addMark() {
			for (var i = 0; i < positions.length; i++) {

				// 마커 이미지의 이미지 크기 입니다
				var imageSize = new daum.maps.Size(24, 35);

				// 마커 이미지를 생성합니다    
				var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

				// 마커를 생성합니다
				var marker = new daum.maps.Marker({
					map : map, // 마커를 표시할 지도
					position : positions[i].latlng, // 마커를 표시할 위치
					title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					image : markerImage
				// 마커 이미지 
				});

				// 마우스로 클릭한 위치입니다 
				var clickPosition = positions[i].latlng;
				// 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
				if (!drawingFlag) {
					// 상태를 true로, 선이 그리고있는 상태로 변경합니다
					drawingFlag = true;

					// 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
					deleteClickLine();

					// 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
					deleteDistnce();
					// 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
					deleteCircleDot();

					// 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
					clickLine = new daum.maps.Polyline({
						map : map, // 선을 표시할 지도입니다 
						path : [ clickPosition ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
						strokeWeight : 3, // 선의 두께입니다 
						strokeColor : '#db4040', // 선의 색깔입니다
						strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle : 'solid' // 선의 스타일입니다
					});

					// 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
					moveLine = new daum.maps.Polyline({
						strokeWeight : 3, // 선의 두께입니다 
						strokeColor : '#db4040', // 선의 색깔입니다
						strokeOpacity : 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle : 'solid' // 선의 스타일입니다    
					});

					// 클릭한 지점에 대한 정보를 지도에 표시합니다
					displayCircleDot(clickPosition, 0);

				} else { // 선이 그려지고 있는 상태이면
					// 그려지고 있는 선의 좌표 배열을 얻어옵니다
					var path = clickLine.getPath();
					// 좌표 배열에 클릭한 위치를 추가합니다
					path.push(clickPosition);

					// 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
					clickLine.setPath(path);
					var distance = Math.round(clickLine.getLength());
					displayCircleDot(clickPosition, distance);
				}

			}
			// 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
			if (drawingFlag) {

				// 마우스무브로 그려진 선은 지도에서 제거합니다
				moveLine.setMap(null);
				moveLine = null;

				// 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
				var path = clickLine.getPath();

				// 선을 구성하는 좌표의 개수가 2개 이상이면
				if (path.length > 1) {
					// 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
					if (dots[dots.length - 1].distance) {
						dots[dots.length - 1].distance.setMap(null);
						dots[dots.length - 1].distance = null;
					}
					var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
					content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

					// 그려진 선의 거리정보를 지도에 표시합니다
					showDistance(content, path[path.length - 1]);

				} else {
					// 선을 구성하는 좌표의 개수가 1개 이하이면 
					// 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
					deleteClickLine();
					deleteCircleDot();
					deleteDistnce();
				}

				// 상태를 false로, 그리지 않고 있는 상태로 변경합니다
				drawingFlag = false;
			}
		}

		//==================거리 측정 ======================================================================

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다

		// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
		// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다

		// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
		function deleteClickLine() {
			if (clickLine) {
				clickLine.setMap(null);
				clickLine = null;
			}
		}
		// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
		// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
		function showDistance(content, position) {

			if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면

				// 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
				distanceOverlay.setPosition(position);
				distanceOverlay.setContent(content);

			} else { // 커스텀 오버레이가 생성되지 않은 상태이면

				// 커스텀 오버레이를 생성하고 지도에 표시합니다
				distanceOverlay = new daum.maps.CustomOverlay({
					map : map, // 커스텀오버레이를 표시할 지도입니다
					content : content, // 커스텀오버레이에 표시할 내용입니다
					position : position, // 커스텀오버레이를 표시할 위치입니다.
					xAnchor : 0,
					yAnchor : 0,
					zIndex : 3
				});
			}
		}
		// 그려지고 있는 선의 총거리 정보와 
		// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
		function deleteDistnce() {
			if (distanceOverlay) {
				distanceOverlay.setMap(null);
				distanceOverlay = null;
			}
		}
		// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
		// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
		function displayCircleDot(position, distance) {
			// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
			var circleOverlay = new daum.maps.CustomOverlay({
				content : '<span class="dot"></span>',
				position : position,
				zIndex : 1
			});
			// 지도에 표시합니다
			circleOverlay.setMap(map);
			if (distance > 0) {
				// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
				var distanceOverlay = new daum.maps.CustomOverlay(
						{
							content : '<div class="dotOverlay">거리 <span class="number">'
									+ distance + '</span>m</div>',
							position : position,
							yAnchor : 1,
							zIndex : 2
						});
				// 지도에 표시합니다
				distanceOverlay.setMap(map);
			}
			// 배열에 추가합니다
			dots.push({
				circle : circleOverlay,
				distance : distanceOverlay
			});
		}
		// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
		function deleteCircleDot() {
			var i;
			for (i = 0; i < dots.length; i++) {
				if (dots[i].circle) {
					dots[i].circle.setMap(null);
				}
				if (dots[i].distance) {
					dots[i].distance.setMap(null);
				}
			}
			dots = [];
		}
		// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
		// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
		// HTML Content를 만들어 리턴하는 함수입니다
		function getTimeHTML(distance) {
			// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
			var walkkTime = distance / 67 | 0;
			var walkHour = '', walkMin = '';
			// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
			if (walkkTime > 60) {
				walkHour = '<span class="number">' + Math.floor(walkkTime / 60)
						+ '</span>시간 '
			}
			walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'
			// 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
			var bycicleTime = distance / 227 | 0;
			var bycicleHour = '', bycicleMin = '';
			// 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
			if (bycicleTime > 60) {
				bycicleHour = '<span class="number">'
						+ Math.floor(bycicleTime / 60) + '</span>시간 '
			}
			bycicleMin = '<span class="number">' + bycicleTime % 60
					+ '</span>분'
			// 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
			var content = '<div style="background-color: white;"><ul class="dotOverlay distanceInfo">';
			content += '    <li>';
			content += '        <span class="label">총거리</span><span class="number">'
					+ distance + '</span>m';
			content += '    </li>';
			content += '    <li>';
			content += '        <span class="label">도보</span>' + walkHour
					+ walkMin;
			content += '    </li>';
			content += '    <li>';
			content += '        <span class="label">자전거</span>' + bycicleHour
					+ bycicleMin;
			content += '    </li>';
			content += '</ul></div>'
			return content;
		}
	});
</script>
<style type="text/css">
* {
	margin: 0px;
}

#plan_planner_maker {
	width: 425px;
	height: 905px;
	float: left;
	background-color: black;
	z-index: 999;
}

#planner_date_box {
	float: left;
	width: 160px;
	height: 905px;
}

#planner_schedule_box {
	float: left;
	width: 265px;
	height: 905px;
	background-color: gray;
}

.clear {
	clear: both;
}

#map {
	float: left;
	width: 1478px;
	height: 905px;
}

.pday_list_day {
	float: left;
}

#pday_list_term {
	float: left;
	margin-left: 30px;
	margin-right: 10px;
}

#pday_list_edit {
	float: left;
}

#pday_list_body, #pday_list_header {
	padding-left: 0px;
	margin-bottom: 0px;
}

#pday_list_header_inner {
	width: 160px;
	height: 50px;
	line-height: 50px;
	border-top: 1px gray solid;
	border-bottom: 1px gray solid;
	color: white;
	list-style-type: none;
	padding-left: 0px;
}

.pday_list_body_inner {
	width: 160px;
	height: 70px;
	line-height: 50px;
	color: white;
	list-style-type: none;
	padding-left: 0px;
	border-bottom: 1px gray solid;
}

.pday_list_day {
	float: left;
	height: 30px;
	font-size: 20px;
	font-weight: bolder;
	margin-left: 30px;
}

.pday_list_week {
	float: left;
	height: 30px;
	margin-left: 15px;
}

.pday_list_date {
	float: left;
	height: 30px;
	margin-left: 30px;
}

.pday_list_city {
	float: left;
	height: 30px;
	margin-left: 15px;
}
</style>
</head>
<body>
	<!-- section -->
	<div id="plan_planner_maker">
		<div id="planner_date_box">
			<ul id="pday_list_header">
				<li id="pday_list_header_inner">
					<div id="pday_list_term">12.5~12.7</div>
					<div id="pday_list_edit">수정</div>
				</li>
			</ul>
			<ul id="pday_list_body">
				<li class="pday_list_body_inner">
					<div class="pday_list_day">DAY1</div>
					<div class="pday_list_week">토요일</div>
					<div class="clear"></div>
					<div class="pday_list_date">12.05</div>
					<div class="pday_list_city">서울</div>
				</li>

				<li class="pday_list_body_inner">
					<div class="pday_list_day">DAY2</div>
					<div class="pday_list_week">일요일</div>
					<div class="clear"></div>
					<div class="pday_list_date">12.06</div>
					<div class="pday_list_city">서울</div>
				</li>

				<li class="pday_list_body_inner">
					<div class="pday_list_day">DAY3</div>
					<div class="pday_list_week">월요일</div>
					<div class="clear"></div>
					<div class="pday_list_date">12.07</div>
					<div class="pday_list_city">서울</div>
				</li>

			</ul>
		</div>

		<div id="planner_schedule_box"></div>
	</div>

	<div id="map"></div>
</body>
</html>