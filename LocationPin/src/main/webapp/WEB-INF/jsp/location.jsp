<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ include file="/WEB-INF/jsp/header.jsp"%>
<script>
$("#search-form").on("submit", function(e) {
    e.preventDefault();
    this.submit();
});

const form = $('form[name="searchPage"]');

$(document).on("click", ".page-item", function() { 
	let pageNum = $(this).find('.page-link').data('pagenum');
	let nowNum = $(".page-item.active a").data('pagenum');

	if (nowNum != pageNum && pageNum > 0) {
		$("#formPageNum").val(pageNum);

		// Submit the form
		document.searchPage.submit();
	} else {
		return;
	}
});
</script>


<main id="js-page-content" role="main" class="page-content"
	style="width: 100%; height: 100%;">
	<div class="fs-lg fw-300 p-5 bg-white border-faded rounded mb-g"
		style="width: 95%; margin: 0 auto;">
		<div class="table-responsive">
			<div>
				<h1 style="text-align: center;">오송 가게 목록</h1>
			</div>
			<form action="location.do" method="get" class="search-form" id="search-form">
			    <div class="float-left input-group">
			        <select class="custom-select" id="searchType" name="searchType">
			            <option value="all" ${paging.sch.searchType == 'all' ? 'selected' : '' }>전체</option>
			            <option value="name" ${paging.sch.searchType == 'name' ? 'selected' : '' }>매장명</option>
			            <option value="category" ${paging.sch.searchType == 'category' ? 'selected' : '' }>업종</option>
			            <option value="address" ${paging.sch.searchType == 'address' ? 'selected' : '' }>주소</option>
			        </select> 
			        <input type="text" class="form-control" placeholder="Search" id="searchName" name="searchName" value="${paging.sch.searchName}">
			        <span class="input-group-append">
			            <button class="btn btn-outline-dark" type="submit" id="search-button">
			                <i class="fal fa-search"></i>
			            </button>
			        </span>
			    </div>
			</form>
			
			<div class="list_box mb-1" style="display: flex; align-items: center;">
			    <i class="fal fa-list-ul"></i>
			    <p style="margin: 0; padding-left: 0.5rem;">검색 건수</p>
			    <span style="color:#db0c0c; font-weight: bold; margin: 0; padding-left: 0.2rem;">${total}</span>
			    <p style="margin: 0; padding-left: 0.2rem;">건</p>
			</div>

			<table class="table text-center table-hover" id="dataTable">
				<colgroup>
					<col width='8%'>
					<col width='20%'>
					<col width='20%'>
					<col width='20%'>
				</colgroup>
				<thead class="">
					<tr>
						<th>번호</th>
						<th>매장명</th>
						<th>업종</th>
						<th>주소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${list}">
						<tr class="cursor-pointer datas-item" align='center'>
							<td>${result.num}</td>
							<td>${result.name}</td>
							<td>${result.category}</td>
							<td>${result.address}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<c:if test="${total != 0}">
			<nav class="pagination-wrapper">
				<ul class="pagination" style="margin-bottom: 0px; height: 35px">
					<c:choose>
						<c:when test="${paging.sch.pageNum != 1}">
							<li class="page-item">
								<p class="page-link" data-pagenum='1'>«</p>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><p class="page-link">«</p></li>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${paging.prev }">
							<li class="page-item">
								<p class="page-link" data-pagenum='${paging.startPage - 1 }'>‹</p>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled">
								<p class="page-link">‹</p>
							</li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="num" begin="${paging.startPage }"
						end="${paging.endPage }">
						<li class="page-item ${paging.sch.pageNum eq num ? 'active' : ''}">
							<p class="page-link " data-pagenum="${num }">${num }</p>
						</li>
					</c:forEach>

					<c:choose>
						<c:when test="${paging.next }">
							<li class="page-item">
								<p class="page-link" data-pagenum='${paging.endPage + 1}'>›</p>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><p class="page-link">›</p></li>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${paging.totalPage != paging.sch.pageNum}">
							<li class="page-item">
								<p class="page-link" data-pagenum='${paging.totalPage}'>»</p>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><p class="page-link">»</p></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</c:if>
	</div>
</main>
<!-- END Body -->
	<script type="text/javascript">
		let paging_pageNum = ${paging.sch.pageNum};
		let paging_amount = ${paging.sch.amount};
		let paging_searchType = '${paging.sch.searchType}';
		let paging_searchName = '${paging.sch.searchName}';
		
//		var optionsData = JSON.parse('${percode}');
	</script>
</body>
</html>