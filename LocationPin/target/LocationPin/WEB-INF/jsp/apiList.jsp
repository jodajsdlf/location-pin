<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ include file="/WEB-INF/jsp/header.jsp"%>

<style>
.table-input {
	display: flex;
	align-items: center;
}

.form-control {
	width: 40%;
}
</style>


<main id="js-page-content" role="main" class="page-content"
	style="width: 100%; height: 100%;">
	<div class="fs-lg fw-300 p-5 bg-white border-faded rounded mb-g"
		style="width: 95%; margin: 0 auto;">
		<div class="table-responsive" style="width: 100%;">
			<div>
				<h1 style="text-align: center;">API</h1>
			</div>
			<table class="table table_input">
				<thead>
					<tr>
						<th colspan=2 class="text-center">Car API</th>
					</tr>
				</thead>
				<tr>
					<th>전체 데이터[json]</th>
					<td><%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/api/alldata.do
					</td>
				</tr>
				<tr>
					<th>개별 내용[json]</th>
					<td><%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/api/data.do?&num={num}
					</td>
				</tr>
				<tr>
					<th>최근 등록 조회[json]</th>
					<td><%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/api/newdata.do
					</td>
				</tr>
				<tr>
					<th>데이터량[json]</th>
					<td><%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/api/countdata.do
					</td>
				</tr>
			</table>
		</div>
	</div>
</main>
<script>
	<c:if test="${msg == 'save'}">
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
	toastr.success('저장을 완료하였습니다.');
	</c:if>
</script>
</body>
</html>