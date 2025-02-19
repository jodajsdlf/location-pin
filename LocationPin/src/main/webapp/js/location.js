$(function() {
	memuSelecter();
	function memuSelecter() { // 메뉴 선택 적용
		var currentPath = window.location.pathname;
		var firstSegment = currentPath.split('/')[3];
		$('.nav-menu li').removeClass('active open');


		// firstSegment가 포함된 링크를 찾기
		var $currentMenuItem = $('.nav-menu a[href*="' + firstSegment + '"]').closest('li');

		// 메뉴 항목이 존재할 경우 active 및 open 클래스를 추가
		if ($currentMenuItem.length) {
			$currentMenuItem.addClass('active');
			$currentMenuItem.parents('li').addClass('active open');
		}
	}  
	
	const form = $('form[id ="searchPage"]');

	$('#search-button').on('click', function() {
		let searchType = $('#searchType').val();
		let searchName = $('#searchName').val();
		if (searchName === null || searchName === '') {
			Swal.fire({
				icon: 'warning',
				title: 'Warning',
				text: '검색어를 입력해 주세요!'
			});
		} else {
			form.find('input[name="searchType"]').val(searchType);
			form.find('input[name="searchName"]').val(searchName);
			form.submit();
		}
	});
	
	$(document).on('keydown', '.form-control', function(e) {
		if (e.keyCode === 13) {
			$('#search-button').click();
		}
	});
	
	function setSearchNameField() { // 검색 종류 선택 시 셀렉트 박스 (초기)
		var selectedType = $('#searchType').val();
		var currentValue = $('#searchName').val();
	
		if (selectedType === 'category') {
	        var selectElement = '<select class="form-control" id="searchName">';			
			optionsData.forEach(function(option) {
			    selectElement += '<option value="' + option.category + '"' 
			                   + (currentValue == option.category ? ' selected' : '') 
			                   + '>' + option.category + '</option>';
			});			
			selectElement += '</select>';
			$('#searchName').replaceWith(selectElement);
    	} else {
			$('#searchName').replaceWith(
				'<input type="text" class="form-control" placeholder="Search" id="searchName" value="' + currentValue + '">'
			);
		}
	}	
	setSearchNameField(); // 초기 페이지 로드 시 검색설정
	
	function updateSearchNameField() { // 검색 종류 선택 시 셀렉트 박스 (재선택)
		var selectedType = $('#searchType').val();
		var currentValue = $('#searchName').val();

		if (selectedType === 'category') {
	        var selectElement = '<select class="form-control" id="searchName">';			
			optionsData.forEach(function(option) {
			    selectElement += '<option value="' + option.category + '"' 
			                   + (currentValue == option.category ? ' selected' : '') 
			                   + '>' + option.category + '</option>';
			});			
			selectElement += '</select>';
			$('#searchName').replaceWith(selectElement);
    	} else {
			$('#searchName').replaceWith(
				'<input type="text" class="form-control" placeholder="Search" id="searchName" value="">'
			);
		}
	}
	
	$('#searchType').change(function() { // searchType 변경 시 설정
		updateSearchNameField();
	});

	$(document).on("click", ".page-item", function() {
	    let pageNum = $(this).find('.page-link').data('pagenum');
	    let nowNum = $(".page-item.active p").data('pagenum');
	
	    if (nowNum != pageNum && pageNum > 0) {
	        $("#PageNum").val(pageNum);
	        document.forms['searchPage'].submit();
	    }
	});
	
	$("#search-form").on("submit", function(e) {
	    e.preventDefault();
	    
	    let searchType = $("#searchType").val();
	    let searchName = $("#searchName").val();
		let pageNum = $("#pageNum").val();
		let nowNum = $(".page-item.active p").data('pagenum');
	
		let url = `location.do?pageNum=${pageNum}&amount=15&searchType=${searchType}&searchName=${searchName}`;

	    $.ajax({
	        url: url,
	        method: "GET",
	        success: function() {
	            window.location.href = url;
	        },
	        error: function(err) {
	            console.error("검색 실패:", err);
	        }
	    });
	});


	function ajaxPost(urls, datas) {
		$(".loader").show();
		$.ajax({
			url: urls,
			type: "POST",
			data: datas,
			success: function(response) {
				$("#body").html(response);
			},
			error: function(xhr, status, error) {
				Swal.fire("warning", "자료 요청중 오류가 발생 하였습니다.", "error");
			},
			complete: function() {
				$(".loader").hide();
			}
		});
	}
});