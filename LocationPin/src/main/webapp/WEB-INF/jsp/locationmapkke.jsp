<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ include file="/WEB-INF/jsp/header.jsp"%>

<style>
/* 🔴 네이버 스타일 현재 위치 마커 */
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

<!-- 네이버 지도 API 로드 -->
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=y8g7z5zn5f"></script>

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

    // 네이버 지도 초기화
    var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(36.6224007325054, 127.316534422255), // 초기 중심 위치
        zoom: 10
    });

    // 가게 목록을 반복하며 마커 추가
    var promises = locations.map(function(location) {
        return new Promise(function(resolve, reject) {
            // 주소를 좌표로 변환
            naver.maps.Service.geocode({
                address: location.address
            }, function(status, response) {
                if (status === naver.maps.Service.Status.OK) {
                    var coords = new naver.maps.LatLng(response.v2.addresses[0].y, response.v2.addresses[0].x);
                    
                    // 마커 생성
                    var marker = new naver.maps.Marker({
                        position: coords,
                        map: map
                    });

                    // 마커에 정보창 추가
                    var infowindow = new naver.maps.InfoWindow({
                        content: `<div style="padding:5px;font-size:14px;">${location.name}<br>${location.address}</div>`
                    });

                    naver.maps.Event.addListener(marker, 'click', function() {
                        infowindow.open(map, marker);
                    });

                    // 지도 중심 이동
                    map.setCenter(coords);
                    resolve(); // 성공적으로 처리된 경우 resolve 호출
                } else {
                    console.error("주소 변환 실패: ", location.address);
                    reject(); // 실패한 경우 reject 호출
                }
            });
        });
    });

    // 모든 주소 변환이 완료된 후 위치 정보 업데이트
    Promise.all(promises).then(function() {
        document.getElementById('location-info').innerText = '위치 정보가 모두 로드되었습니다.';
    }).catch(function() {
        document.getElementById('location-info').innerText = '위치 정보 로드 중 오류가 발생했습니다.';
    });
</script>

</html>
