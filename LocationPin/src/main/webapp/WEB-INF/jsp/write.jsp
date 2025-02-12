<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ include file="/WEB-INF/jsp/header.jsp"%>
<script type="text/javascript">
	function fn_submit() {
		if (document.frm.x.value == "" || document.frm.y.value == "") {
			alert("내용을 입력하세요");
			document.frm.x.focus();
			return false;
		}
		document.frm.submit();
	}
</script>

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
				<h1 style="text-align: center;">Car Data Upload</h1>
			</div>
			<form name='frm' method="post" action="input.do">
				<table class="table table_input">
					<thead class="thead-light" style="margin-bottom: 10px;">
						<tr>
							<th>x</th>
							<td class="table-input"><input type='number'
								class="form-control" name='x' required></td>
						</tr>
						<tr>
							<th>y</th>
							<td class="table-input"><input type='number'
								class="form-control" name='y' maxlength='14' required>
							</td>
						</tr>
						<tr>
							<th>일자</th>
							<td class="table-input"><input type='number'
								class="form-control" name='rdate' maxlength='14' required>&nbsp;YYYYMMDDHHmmSS  ※ 미입력 시 현재 날짜가 등록됩니다.
							</td>
						</tr> 
						<tr>
							<td colspan=2 align='center'><input type='button'
								class="btn btn-primary" onclick='fn_submit()' value=' 저 장 '>
							</td>
						</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="fs-lg fw-300 p-5 bg-white border-faded rounded mb-g"
		style="width: 95%; margin: 0 auto;">
		<div class="table-responsive" style="width: 100%;">
			<table class="table table_input">
				<tr>
					<th>Method</th>
					<td>POST</td>
				</tr>
				<tr>
					<th>Host</th>
					<td><%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/api/input.do</td>
				</tr>
				<tr>
					<th>Header</th>
					<td>Content-Type: application/json</td>
				</tr>
				<tr>
					<th>Body</th>
					<td>{ "x":[float], "y":[float] }</td> 
				</tr>
				<tr>
					<th>Result</th>
					<td>{ "result":"OK" }</td>
				</tr>
			</table> 
			<%-- <table class="table table_input">
				<tr>
					<th>Method</th>
					<td>GET</td>
				</tr>
				<tr>
					<th>Host</th>
					<td><%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/api/input.do?i=dev02&d=20231122112233&t=25.2&h=80.5&c=455.6</td>
				</tr>
				<tr>
					<th>Result</th>
					<td>"OK"</td>
				</tr>
			</table>  --%>
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