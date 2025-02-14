<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ include file="/WEB-INF/jsp/header.jsp"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
/* 🔴 카카오 스타일 현재 위치 마커 */
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

#map {
    width: 100%; /* 지도의 너비를 100%로 설정 */
    height: 600px; /* 지도의 높이를 600px로 설정 */
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
            <div id="map"></div>
            <div id="location-info" style="margin-top: 10px; font-size: 16px;">위치 정보를 가져오는 중...</div> 
        </div>
    </div>
</main>

<!-- 카카오 지도 API 로드 -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=9df4fa9a3b118fde8138b379a431fc4b&libraries=services"></script>

<script type="text/javascript">
// JSON 데이터가 올바르게 전달되었는지 확인 (디버깅용)
console.log("테스트");
console.log('list 데이터:', '${list}');
console.log("테스트");

// JSON 데이터를 안전하게 변환
var locations;
try {
    locations = JSON.parse('${list}');
} catch (error) {
    console.error("JSON 파싱 오류:", error);
    locations = []; // 오류 발생 시 빈 배열로 설정
}

console.log('파싱된 locations:', locations);

window.onload = function() {
    // 지도 초기화 및 마커 추가 코드
    var mapContainer = document.getElementById('map'); // 지도를 표시할 div
    var mapOption = {
        center: new kakao.maps.LatLng(36.6224007325054, 127.316534422255), // 초기 중심 위치
        level: 5 // 초기 확대 레벨
    };
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 가게 목록을 반복하며 마커 추가
    var promises = locations.map(function(location) {
        return new Promise(function(resolve, reject) {
            var geocoder = new kakao.maps.services.Geocoder(); 
            geocoder.addressSearch(location.address, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    var marker = new kakao.maps.Marker({
                        position: coords,
                        map: map
                    });

                    // infowindow를 생성
                    var infowindow = new kakao.maps.InfoWindow();

                    // 닫기 버튼을 포함한 content 설정
                    var content = `
                        <div style="padding:5px;font-size:14px;">
                            <strong>${location.name}</strong><br>${location.address}
                            <button class="btn btn-danger btn-sm" style="margin-top: 5px; cursor: pointer;" onclick="closeInfoWindow(${marker.getPosition()})">닫기</button>
                        </div>`;

                    kakao.maps.event.addListener(marker, 'click', function() {
                        infowindow.setContent(content);
                        infowindow.open(map, marker);
                    });

                    // 버튼 클릭 시 infowindow 닫기
                    window.closeInfoWindow = function(position) {
                        infowindow.close();
                    }; 
                    resolve(); // 성공적으로 처리된 경우 resolve 호출
                } else {
                    console.error("주소 변환 실패:", location.address, "상태:", status); // 실패 로그
                    reject("주소 변환 실패: " + location.address); // 실패한 경우 reject 호출
                }
            });
        });
    });

    // 모든 주소 변환이 완료된 후 위치 정보 업데이트
    Promise.all(promises).then(function() {
        document.getElementById('location-info').innerText = '위치 정보가 모두 로드되었습니다.';
        if (locations.length > 0) {
            var lastLocation = locations[locations.length - 1];
            geocoder.addressSearch(lastLocation.address, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    map.setCenter(coords); // 마지막 위치로 지도 중심 이동
                } else {
                    console.error("마지막 주소 변환 실패:", lastLocation.address, "상태:", status); // 마지막 주소 변환 실패 로그
                }
            });
        }
    }).catch(function(error) {
        console.error("전체 주소 변환 중 오류:", error); // 전체 오류 로그
        document.getElementById('location-info').innerText = '위치 정보 로드 중 오류가 발생했습니다.';
    });
};
</script>

</html>
