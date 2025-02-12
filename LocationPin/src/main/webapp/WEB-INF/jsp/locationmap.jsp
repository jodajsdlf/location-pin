<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ include file="/WEB-INF/jsp/header.jsp"%>

<style>
/* 🔴 Kakao 스타일 현재 위치 마커 */
.custom-marker {
    position: relative;
    width: 20px;
    height: 20px;
}

.custom-marker .dot {
    width: 12px;
    height: 12px;
    background-color: red;
    border-radius: 50%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.custom-marker .pulse {
    width: 20px;
    height: 20px;
    background-color: rgba(255, 0, 0, 0.4);
    border-radius: 50%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    animation: pulse-animation 1.5s infinite ease-in-out;
}

@keyframes pulse-animation {
    0% {
        transform: translate(-50%, -50%) scale(1);
        opacity: 0.8;
    }
    100% {
        transform: translate(-50%, -50%) scale(2);
        opacity: 0;
    }
}
</style>

<main id="js-page-content" role="main" class="page-content"
	style="width: 100%; height: 100%;">
	<div class="fs-lg fw-300 p-5 bg-white border-faded rounded mb-g"
		style="width: 95%; margin: 0 auto;">
		<div class="table-responsive">
			<div>
				<h1 style="text-align: center;">오송 가게 List</h1>
			</div>   
			<div id="map" style="width: 100%; height: 500px;"></div>
			<div id="location-info" style="margin-top: 10px; font-size: 16px;">위치 정보를 가져오는 중...</div> 
		</div>
	</div>
</main>
 
<script type="text/javascript">
    var container = document.getElementById('map'); // 지도 컨테이너
    var options = {
        center: new kakao.maps.LatLng(36.6216265505843, 127.318973483028), // 초기 중심 위치
        level: 3
    };

    var map = new kakao.maps.Map(container, options); // 지도 생성

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var lat = position.coords.latitude; // 위도
            var lng = position.coords.longitude; // 경도
            
            // 위치 정보를 HTML 요소에 표시
            var locationInfo = document.getElementById('location-info');
            locationInfo.innerHTML = "현재 위치: 위도 " + lat + ", 경도 " + lng;

            var locPosition = new kakao.maps.LatLng(lat, lng); // 현재 위치 설정

            // 🔴 Kakao 지도 스타일의 빨간 원형 마커 (커스텀 오버레이 사용)
            var content = `
                <div class="custom-marker">
                    <div class="pulse"></div>
                    <div class="dot"></div>
                </div>
            `;

            var overlay = new kakao.maps.CustomOverlay({
                position: locPosition,
                content: content,
                yAnchor: 1 // 위치 조정
            });

            overlay.setMap(map); // 마커 지도에 표시
            map.setCenter(locPosition); // 지도 중심 이동
        }, function (error) {
            var locationInfo = document.getElementById('location-info');
            locationInfo.innerHTML = "위치 정보를 가져오는 데 실패했습니다: " + error.message;
        });
    } else {
        alert("이 브라우저는 Geolocation을 지원하지 않습니다.");
    }
</script>


</html>
