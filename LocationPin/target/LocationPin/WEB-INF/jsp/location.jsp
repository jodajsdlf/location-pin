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
				<h1 style="text-align: center;">오송 가게 List</h1>
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
				</colgroup>
				<thead class="">
					<tr>
						<th>번호</th>
						<th>가게명</th>
						<th>카테고리</th> 
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
	</div>
</main>
 
</body>
<!-- END Body -->
</html>