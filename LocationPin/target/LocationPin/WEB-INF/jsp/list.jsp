<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ include file="/WEB-INF/jsp/header.jsp"%>


<main id="js-page-content" role="main" class="page-content"
	style="width: 100%; height: 100%;">
	<div class="fs-lg fw-300 p-5 bg-white border-faded rounded mb-g"
		style="width: 95%; margin: 0 auto;">
		<div class="table-responsive">
			<div>
				<h1 style="text-align: center;">청주 List</h1>
			</div>
			<%-- <form action="list.do" method="get"  class="search-form"  id="search-form">
		    <div class="float-left input-group">
		        <select class="custom-select" id="searchType" aria-label="Default select example">
		            <option value="device" ${paging.sch.searchType == 'device'? 'selected' : '' }>장치명</option>
		        </select>
		        <input type="text" class="form-control" placeholder="Search" id="searchName" name="searchName" value="${paging.sch.searchName}">
		        <span class="input-group-append">
		            <button class="btn btn-outline-dark" type="submit" id="search-button">
		                <i class="fal fa-search"></i>
		            </button>
		        </span>
		    </div>
		</form> --%>
			<table class="table text-center table-hover" id="dataTable">
				<colgroup>
					<col width='8%'>
					<col width='20%'>
					<col width='20%'>
					<col width='20%'>
					<col width='20%'> 
				</colgroup>
				<thead class="">
					<tr>
						<th>번호</th>
						<th>x</th>
						<th>y</th> 
						<th>등록 일시</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${list}">
						<tr class="cursor-pointer datas-item" align='center'>
							<td>${result.num}</td>
							<td>${result.x}</td>
							<td>${result.y}</td>  
							<td>${result.rdate}</td>
							<td>
								<form class="delete-form" method="post">
									<input type="hidden" name="num" value="${result.num}" /> 
								</form>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- / table -->
			<!-- pagination -->
			<nav class="d-flex justify-content-center">
				<ul class="pagination" style="margin-bottom: 0px; height: 35px">
					<c:choose>
						<c:when test="${paging.sch.pageNum != 1}">
							<li class="page-item"><a class="page-link" href="#"
								data-pagenum='1'>시작</a></li>
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${paging.prev }">
							<li class="page-item"><a class="page-link" href="#"
								data-pagenum='${paging.startPage - 1 }'>«</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><p class="page-link">«</p></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="num" begin="${paging.startPage }"
						end="${paging.endPage }">
						<li class="page-item ${paging.sch.pageNum eq num ? 'active' : ''}">
							<a class="page-link " href="#" data-pagenum="${num }">${num }</a>
						</li>
					</c:forEach>

					<c:choose>
						<c:when test="${paging.next }">
							<li class="page-item"><a class="page-link" href="#"
								data-pagenum='${paging.endPage + 1}'>»</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><p class="page-link">»</p></li>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${paging.totalPage != paging.sch.pageNum}">
							<li class="page-item"><a class="page-link" href="#"
								data-pagenum='${paging.totalPage}'>마지막</a></li>
						</c:when>
					</c:choose>
				</ul>
			</nav>
			<!-- /pagination -->
		</div>
	</div>
</main>

<script>
$(document).on('submit', '.delete-form', function (e) {
    e.preventDefault(); // 기본 폼 제출 방지
    var form = $(this);
    var num = form.find('input[name="num"]').val();

    $.ajax({
        url: 'delete.do',
        type: 'POST',
        data: {
            num: num
        },
        dataType: 'text',
        success: function (response) {
            if (response.trim() === '"SUCCESS"') {
                toastr.success('삭제를 완료하였습니다.');
                let pageNum = $(".page-item.active a").data('pagenum'); // 현재 페이지 번호 가져오기
                let searchName = "${paging.sch.searchName}"; // 검색어 가져오기
                location.href = "list.do?pageNum=" + pageNum + "&searchName=" + searchName;
            } else {
                toastr.error('삭제 실패: ' + response);
            }
        },
        error: function () {
            toastr.error('서버 오류가 발생했습니다.');
        }
    });
});


$(document).on('click', '.page-link', function (e) {
    e.preventDefault(); // 기본 링크 동작 방지
    let pageNum = $(this).data('pagenum'); // 클릭한 버튼의 페이지 번호
    let currentNum = $(".page-item.active a").data('pagenum'); // 현재 페이지 번호

    if (currentNum !== pageNum && pageNum > 0) {
        let searchName = "${paging.sch.searchName}"; // 검색어 가져오기
        location.href = "list.do?pageNum=" + pageNum + "&searchName=" + searchName;
    }
});

	<c:if test="${msg == 'delete'}">
	//토스트 
	toastr.options = {
		"closeButton" : true,
		"debug" : false,
		"newestOnTop" : false,
		"progressBar" : true,
		"positionClass" : "toast-top-center",
		"preventDuplicates" : false,
		"showDuration" : "300",
		"hideDuration" : "100",
		"timeOut" : "1500",
		"extendedTimeOut" : "1000",
		"showEasing" : "swing",
		"hideEasing" : "linear",
		"showMethod" : "fadeIn",
		"hideMethod" : "fadeOut"
	}
	// toastr.error('error');// toastr.warning('warning');//  toastr.success('success');// toastr.info('info');
	toastr.success('삭제를 완료하였습니다.');
	</c:if>
</script>
</body>
<!-- END Body -->
</html>