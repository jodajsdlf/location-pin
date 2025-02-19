<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ include file="/WEB-INF/jsp/header.jsp"%>
<main id="js-page-content" role="main" class="page-content" style="height:100%;">
	<div class="fs-lg fw-300 p-5 bg-white border-faded rounded mb-g">
			<div>
				<h1 style="text-align: center;">오송 가게 목록</h1>
			</div>
			<!-- 검색 영역 -->
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
			<!-- /검색 영역 -->
			
			<!-- 테이블 영역 -->
			<div class="list_box">
				<p>
					<i class="fal fa-list-ul"></i>
					<a>검색 건수</a>
					<span class="point" id="point">${total}</span>
					<a>건</a>
				</p>
			</div>
			
			<div class="table-responsive">
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
						<c:if test="${total == 0}">
					        <tr>
					            <td colspan="6" class="no-data">
					            	<span>데이터가 없습니다.</span>
					            </td>
					        </tr>
					    </c:if>
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
		<!-- /테이블 영역 -->
		
		<!-- 페이징 영역 -->
		<c:if test="${total != 0}">
			<nav class="pagination-wrapper">
				<ul class="pagination">
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
		<!-- /페이징 영역 -->
	</div>
</main>
	 
	 <form action="<%= request.getContextPath() %>/location.do" method="get" name="searchPage">
		<input type="hidden" name="pageNum" id="formPageNum" value="${paging.sch.pageNum}">
		<input type="hidden" name="amount" value="${paging.sch.amount}"> 
		<input type="hidden" name="searchType" id="formSearchType" value="${paging.sch.searchType}"> 
		<input type="hidden" name="searchName" id="formSearchName" value="${paging.sch.searchName}">
	</form>
	 
	<script type="text/javascript">
		let pageNum = ${paging.sch.pageNum};
		let amount = ${paging.sch.amount};
		let searchType = '${paging.sch.searchType}';
		let searchName = '${paging.sch.searchName}';
	
	    var optionsData = JSON.parse('${categorycode}');
	</script>
 
 	<script type="text/javascript" src="<%= request.getContextPath() %>/js/location.js"></script>
</body>
<!-- END Body -->
</html>