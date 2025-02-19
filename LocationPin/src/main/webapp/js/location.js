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
	
	$("#search-form").on("submit", function(e) {
        e.preventDefault();
        
        let searchType = $('#searchType').val();
        let searchName = $('#searchName').val();
        
        if (searchName === null || searchName.trim() === '') {
            Swal.fire({
                icon: 'warning',
                title: 'Warning',
                text: '검색어를 입력해 주세요!'
            });
            return;
        }
        
        // searchPage 폼에 값을 설정
        $('#formSearchType').val(searchType);
        $('#formSearchName').val(searchName);
        $('#formPageNum').val(1); // 검색 시 첫 페이지로 리셋
        
        // 폼 제출
        document.searchPage.submit();
    });

    // 페이지네이션 클릭 이벤트
    $(document).on("click", ".page-item", function() { 
        let pageNum = $(this).find('.page-link').data('pagenum');
        let nowNum = $(".page-item.active .page-link").data('pagenum');
        if (nowNum != pageNum && pageNum > 0) {
            $("#formPageNum").val(pageNum);
            document.searchPage.submit();
        }
    });

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