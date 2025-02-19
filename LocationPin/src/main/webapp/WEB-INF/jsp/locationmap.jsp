<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    width: 100%;
    height: 100vh; /* 화면 높이를 꽉 채우도록 설정 */
}
</style>

<script>
console.log(${searchType});
</script>
<main id="js-page-content" role="main" class="page-content" style="width: 100%; height: 100%;">
    <div class="fs-lg fw-300 p-2 bg-white border-faded rounded mb-g"> 
    	<!-- 검색 영역 -->
			<form action="location.do" method="get" class="search-form" id="search-form">
			    <div class="float-left input-group">
					<select class="custom-select" id="searchType" aria-label="Default select example">
			            <option value="all" ${paging.sch.searchType == 'all' ? 'selected' : '' }>전체</option>
			            <option value="name" ${paging.sch.searchType == 'name' ? 'selected' : '' }>매장명</option>
			            <option value="category" ${paging.sch.searchType == 'category' ? 'selected' : '' }>업종</option>
			            <option value="address" ${paging.sch.searchType == 'address' ? 'selected' : '' }>주소</option>
			        </select> 
			        <input type="text" class="form-control" placeholder="Search" id="searchName" value="${paging.sch.searchName}">
			        <span class="input-group-append">
			            <button class="btn btn-outline-dark" type="submit" id="search-button">
			                <i class="fal fa-search"></i>
			            </button>
			        </span>
			    </div>
			</form>
			<!-- /검색 영역 -->
        <div class="table-responsive"> 
            <div id="map"></div> 
        </div>
    </div>
</main>

<script>
	let searchType = '${paging.sch.searchType}';
	let searchName = '${paging.sch.searchName}';
	var optionsData = JSON.parse('${categorycode}'); 
</script>
<!-- 카카오 지도 API 로드 -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=9df4fa9a3b118fde8138b379a431fc4b&libraries=services"></script>

<script type="text/javascript">
// JSON 데이터를 안전하게 변환
var locations = [];
try {
    locations = JSON.parse('<c:out value="${list}" escapeXml="false"/>');
} catch (error) {
    console.error("JSON 파싱 오류:", error);
    locations = [];
} 

window.onload = function() {
    // 지도 초기화
    var mapContainer = document.getElementById('map');
    var mapOption = {
        center: new kakao.maps.LatLng(36.6224007325054, 127.316534422255), 
        level: 5 
    };
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // infowindow 객체를 하나만 선언
    var infowindow = new kakao.maps.InfoWindow();

    // 마커 클릭 시 infowindow 열기
    locations.forEach(function(location) { 
        var coords = new kakao.maps.LatLng(location.latitude, location.longitude);
        var marker = new kakao.maps.Marker({
            position: coords,
            map: map
        });

        // 마커 클릭 시
        kakao.maps.event.addListener(marker, 'click', function() {
            // 기존에 열려있던 infowindow를 닫음
            infowindow.close();

            // 새로운 infowindow를 설정하고 열기
            infowindow.setContent('<div style="padding:10px; font-size:14px; font-weight:400; height:100px; width:300px; box-sizing:border-box;">' +
                        '<span style="font-weight: bold; font-size: 16px;">' + location.name + '</span><br>' +
                        location.address +
                        '<div style="text-align:right; margin-top:10px;">' +
                            '<button class="btn btn-danger btn-sm close-btn" style="cursor:pointer;">닫기</button>' +
                        '</div>' +
                     '</div>');


            infowindow.open(map, marker);

            // 닫기 버튼 이벤트 바인딩
            setTimeout(function() {
                var closeBtn = document.querySelector('.close-btn');
                if (closeBtn) {
                    closeBtn.addEventListener('click', function() {
                        infowindow.close();
                    });
                }
            }, 100);
        });
    });
}
</script>

<script type="text/javascript" src="<%= request.getContextPath() %>/js/locationMap.js"></script>
</html>
