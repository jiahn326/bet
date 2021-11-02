// 특수문자 정규식 변수(공백 미포함)
var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;

$(document).ready(function () {
	
	categorySelect();
	searchList();
	
	$("#keyword").keydown(function(key) {
		if (key.keyCode == 13) {
			$("#searchButton").trigger('click');
		}

	});

	$("#domainTypeNm").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
    	    if (x.match(replaceChar) || x.match(replaceNotFullKorean)) {
                x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "");
            }
            $(this).val(x);
        }
    }).on("keyup", function() {
         $(this).val($(this).val().replace(replaceChar, ""));
    });
});

$('html').click(function(e) {
	
	if($("#modal2").hasClass("show") === true) {
		document.getElementById("modal").style.zIndex = 1040;
	} else {
		document.getElementById("modal").style.zIndex = 1050;
	}

});

//데이터 타입 선택 시 데이터 길이 및 소수점 길이 설정
function readOnlyOption(dataType) {
	if(dataType == '') {
		$("#insert_form input[name=dataLen]").attr('readonly', true);
		$("#insert_form input[name=dcmlLen]").attr('readonly', true);
		$("#insert_form input[name=dataLen]").val('');
		$("#insert_form input[name=dcmlLen]").val('');

		$("#dataLenStar").hide();
		$("#dcmlLenStar").hide();
	} else {
		let data = {
			cdNm : dataType
		}
		
		$.ajax({
	        url : contextPath +"/code/list",
	        contentType : "application/json",
	        type : "POST",
			data : JSON.stringify(data),
			async : false,
	        success : function(data) {			
				console.log(data);		
				if(data.length > 0) {
					if(data[0].dataLenYn == 'N') {
						$("#insert_form input[name=dataLen]").attr('readonly', true);
						$("#insert_form input[name=dcmlLen]").attr('readonly', true);
						$("#insert_form input[name=dataLen]").val('');
						$("#insert_form input[name=dcmlLen]").val('');

						$("#dataLenStar").hide();
						$("#dcmlLenStar").hide();
					} else if(data[0].dataLenYn == 'Y' && data[0].dcmlLenYn == 'N') {
						$("#insert_form input[name=dataLen]").attr('readonly', false);
						$("#insert_form input[name=dcmlLen]").attr('readonly', true);
						$("#insert_form input[name=dcmlLen]").val('');

						$("#dataLenStar").show();
						$("#dcmlLenStar").hide();
					} else {
						$("#insert_form input[name=dataLen]").attr('readonly', false);
						$("#insert_form input[name=dcmlLen]").attr('readonly', false);

						$("#dataLenStar").show();
						$("#dcmlLenStar").show();
					}
				}
			}
	    });
	}
}

//검색 SelectBox 초기화
function categorySelect() {
	
	$.ajax({
        url : contextPath +"/domain/searchType",
        contentType : "application/json",
        type : "GET",
        success : function(data){
			for(var i = 0; i < data.length; i++) {
				if(data[i].columnName == 'DOMAIN_NM') {
					let option  = $("<option>");
					$(option).val('domainNm').text('도메인명');
					$("#searchType").append($(option));
				}
				
				if(data[i].columnName == 'DOMAIN_TYPE_NM') {
					let option  = $("<option>");
					$(option).val('domainTypeNm').text('도메인 분류명');
					$("#searchType").append($(option));
				}
				
				if(data[i].columnName == 'DOMAIN_DSCRPT') {
					let option  = $("<option>");
					$(option).val('domainDscrpt').text('도메인 설명');
					$("#searchType").append($(option));
				}
			}
        }

    });	
	
}

//데이터 타입 선택 셀렉트 박스 초기화
function dataTypeSelect() {
	
	let data = new Object();
	
	$.ajax({
        url : contextPath +"/code/list",
        contentType : "application/json",
        type : "POST",
		data : JSON.stringify(data),
		async : false,
        success : function(data){
			$('#dataType').children('option:not(:first)').remove();
			for(var i = 0; i < data.length; i++) {
					let option  = $("<option>");
					$(option).val(data[i].cdNm).text(data[i].cdNm);
					$("#dataType").append($(option));		
        	}
		}

    });	
}

//도메인 목록
function searchList(searchType, keyword, orderNumber) {

	//Sorting 하기 위한 컬럼들 서버로 가지고감
	let columns = ['DOMAIN_SEQ','DOMAIN_NM','DOMAIN_TYPE_NM','DATA_TYPE', 'DATA_LEN', 'DCML_LEN', 'DOMAIN_DSCRPT', 'UPD_DT'];
	let order = 'asc';
	
	if(orderNumber == undefined) {
		orderNumber = 1;
	}
	
	if(orderNumber == 1) {
		order = 'asc';
	} else {
		order = 'desc'
	}
	
	
	//sAjaxSource 를 사용하면 기본적인 DataTable에 사용되는 옵션들을 객체로 가지고 감. 서버의 DomainVO 객체 확인하기
	$("#domainTable").DataTable({	
	  	processing: true, 
	  	serverSide: true,
		responsive: true,
		autoWidth: true,
	  	sAjaxSource : contextPath + '/domain/list?columns='+columns +'&keyword=' + keyword + '&searchType=' + searchType,
		sServerMethod: "POST",

		// popover
		"drawCallback": function (settings, json) {
			//$('[data-toggle="tooltip"]').tooltip('update');
			$('[data-toggle="popover"]').popover('update');
		},
		columns: [
		    { data: 'domainSeq', width: "10%" },
			{ data: 'domainNm' },
			{ data: 'domainTypeNm' },
	      	{ data: 'dataType' },
	      	{ data: 'dataLen', width: "10%" },
	      	{ data: 'dcmlLen', width: "10%" },
			{ data: 'summaryDomainDscrpt' },
			{ data: 'updDt'}
	      ],
		columnDefs: [
			{ targets:[0], title: 'ID' },
			{ targets:[1], title: '도메인명' },
			{ targets:[2], title: '도메인 분류명' },
			{ targets:[3], title: '데이터 타입' },
			{ targets:[4], title: '데이터 길이' },
			{ targets:[5], title: '소수점 길이' },
			{ targets:[6], title: '설명' },
			{ targets:[7], title: '수정 날짜', visible: false }
		],
		order: [[orderNumber, order]],

		// popover
		createdRow: function (row, data, dataIndex) {
			// $(row).find('td:eq(6)').attr('data-toggle', "tooltip");

			// $(row).find('td:eq(6)').attr('title', data["domainDscrpt"]);

			// 설명이 존재할 경우에만 popover 사용
			if (data["domainDscrpt"] != "-"){
				$(row).find('td:eq(6)').attr('data-container', 'body');
				$(row).find('td:eq(6)').attr('data-content', data["domainDscrpt"]);
				$(row).find('td:eq(6)').attr('data-toggle', "popover");
				$(row).find('td:eq(6)').attr('data-trigger', "hover");
			}

		}
	  });

	$('#domainTable tbody').on('dblclick', 'tr', function () {
		
		let table = $("#domainTable").DataTable();
		let rowData = table.row( this ).data();
		
		if(rowData != undefined) {
			$("#newButton").click();
			openModal('update', rowData.domainSeq);
		}
		
	});
	
	$("#searchType").change(function () {		
	 	$("#keyword").focus();		
	});
	
	let dataTableHeight = document.getElementsByClassName('dataTables_scrollBody')[0];
	dataTableHeight.style.minHeight = '580px';
}


//도메인 분류명 목록
function searchList2() {
	
	let keyword = $("#domainTypeNm").val().trim();
	let searchType = 'domainTypeNm';
	let domainSeq = $("#domainSeq").val().trim();
	

	$("#domainTypeTable").DataTable({	
		dom: '<"datatable-scroll"t><"datatable-footer">',
		paging: false,
		autoWidth: false,
		scrollY: "210",
		language: {},
	  	sAjaxSource : contextPath + '/domain/list?keyword=' + keyword + '&searchType=' + searchType + '&domainSeq=' + domainSeq,
		sServerMethod: "POST",
		columns: [
		    { data: 'domainSeq' },
			{ data: 'domainNm' },
			{ data: 'domainTypeNm' },
	      	{ data: 'dataType' },
	      	{ data: 'dataLen' },
	      	{ data: 'dcmlLen' }
	      ],
		 initComplete: function(settings, json) {
			    setTimeout(function() {
			  $("#orderId").click();
			}, 200);
  		 }
	  });	

}

//검색 버튼 클릭 이벤트
function searchDomain() {
	
	let searchType = $("#searchType").val();
	let keyword = $("#keyword").val();
	let dataTable = $("#domainTable").DataTable();
  
	if(keyword == '') {
		if($("#searchType").val() == 'all') {
			dataTable.clear().destroy();
			searchList();
		} else {
			alertMessage("경고!","검색할 키워드를 입력해주세요.","warning");
			return false;
		};
	} else {
		dataTable.clear().destroy();
		searchList(searchType, keyword);
	}
}

//검색 초기화 아이콘 클릭 이벤트
function resetSearch() {
	
	$("#searchType").val('all');
	$("#keyword").val('');
	
	let dataTable = $("#domainTable").DataTable();
	dataTable.destroy();
	searchList();
	
}



//모달 초기화
//신규 등록 및 상세 보기
function openModal(type, domainSeq) {
	dataTypeSelect();
	clearFormData();
	readOnlyOption('');
	
	//add = 신규등록 , update = 상세보기
	if(type == 'add') {
		$("#modal #saveButton").show();
		$("#modal #updateButton").hide();
		$("#modal #deleteButton").hide();
		$("#modal .modal-title").html('도메인 신규 등록');
	} else if(type == 'update') {

		$("#modal #saveButton").hide();
		$("#modal #updateButton").show();
		$("#modal #deleteButton").show();
		$("#modal .modal-title").html('도메인 상세보기');
		
		$("#insert_form input[name=domainSeq]").val(domainSeq);
		
		
		let sendData = {
			"domainSeq" : domainSeq
		}
		
		$.ajax({
	        url : contextPath +"/domain/select",
	        contentType : "application/json",
	        type : "GET",
	        data : sendData,
			async : false,
	        success : function(data){
				$("#insert_form input[name=domainTypeNm]").val(data.domainTypeNm);
				$("#insert_form input[name=domainNm]").val(data.domainNm);
				$("#insert_form #dataType").val(data.dataType);
				$("#insert_form input[name=dataLen]").val(data.dataLen);
				if(data.domainDscrpt != null) {
					$("#insert_form #domainDscrpt").val(data.domainDscrpt.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'));
				}
				$("#insert_form input[name=dcmlLen]").val(data.dcmlLen);
				readOnlyOption(data.dataType);
	        }
	
	    });
		
	}
	
	//데이터 타입 선택 시 NUMBER일 경우 소수점 길이 활성화
	//XML 또는 DATETIME 일 경우 데이터 길이 및 소수점 길이 비활성화
	$("#dataType").change(function () {		
	 	let selectDataTypeValue = $("#insert_form #dataType").val().trim();
		readOnlyOption(selectDataTypeValue);		
	});
	
	$(".autoCreate").on("propertychange change keyup paste input", function(){		
		domainNameAutoCreate($("#domainTypeNm").val(), 
									$("#dataType").val(), 
									$("#dataLen").val(), 
									$("#dcmlLen").val());
	});

}


//입력 정보 유효성 검사
function insertValidation(){
		
	let result = true;	
		
	if($("#domainTypeNm").val().trim().length == 0){
        alertMessage("경고!","도메인 분류명을 입력해주세요.","warning");
        $("#domainTypeNm").focus();
		//$("#cancelButton2").click();
        result = false;
    }

	if($("#dataType").val().trim() == ''){
        alertMessage("경고!","데이터 타입을 선택해주세요.","warning");
        $("#dataType").focus();
		$("#cancelButton2").click();
        result = false;
    } else {
		let data = {
			cdNm : $("#dataType").val().trim()
		}
	
		$.ajax({
	        url : contextPath +"/code/list",
	        contentType : "application/json",
	        type : "POST",
			data : JSON.stringify(data),
			async : false,
	        success : function(data){	
				if($("#dataLen").val().length == 0 && data[0].dataLenYn == 'Y') {
					alertMessage("경고!","데이터 길이를 입력해주세요.","warning");
					$("#dataLen").focus();
					result = false;
				} else if(data[0].dcmlLenYn == 'Y') {
					if($("#dcmlLen").val().length == 0) {
						alertMessage("경고!","소수점 길이를 입력해주세요.","warning");
						$("#dataLen").focus();
						result = false;
					} else if(parseInt($("#dcmlLen").val()) > parseInt($("#dataLen").val())){
						alertMessage("경고!","데이터 길이는 소수점 길이보다 작을 수 없습니다.","warning");
						$("#dataLen").focus();
						result = false;
					}
				}
			}
	    });					
	}				
	

	if($("#domainNm").val().trim().length == 0){
        alertMessage("경고!","도메인명을 입력해주세요.","warning");
        $("#doaminNm").focus();
        result = false;
    }

	

	return result;

}

//신규 등록 시 도메인명 중복 체크
function duplicateNameCheck(sendData) {
		
	let flag = true;
	
	$.ajax({
        url : contextPath +"/domain/duplicationNameCheck",
        contentType : "application/json",
        type : "GET",
        data : sendData,
		async : false,
        success : function(data){
			if(data >= 1) {
				alertMessage("경고!","이미 등록된 도메인명입니다.","warning");
				//$("#cancelButton2").click();
				$("#modal2").removeClass("show");
				flag = false;
			}
        }

    });	

	return flag;
	
}

//도메인 분류명 검사
function duplicateDomainTypeName(domainTypeNm, type) {
	let sendData = {
		"domainTypeNm" : domainTypeNm
	}
	
	let domainSeq = $("#domainSeq").val();
	
	$.ajax({
        url : contextPath +"/domain/duplicateDomainTypeName",
        contentType : "application/json",
        type : "GET",
        data : sendData,
		async : false,
        success : function(data){
			
			let table2 = $("#domainTypeTable").DataTable();
			table2.destroy();
			
			//type = 1일경우 신규 등록, 2일경우 수정
			
			if(data.length == 0) {
				//중복 된 리스트가 없을 경우
				if(type == 1) {
					saveConfirm();
				} else if(type == 2) {
					updateConfirm();
				}
			} else if(data.length == 1) {
				//중복 된 리스트가 한개만 있을경우
				//신규 등록은 중복 된게 있으므로 중복 안내
				//업데이트는 해당 데이터 수정 시 입력한 도메인 분류명이 동일한지 확인 후 중복 안내
				if(type == 1) {
					//checkConfirm('도메인 신규 등록','중복되는 도메인 분류명이 존재합니다. 등록하시겠습니까?','insertDomain();');
					$("#domainTypeNmListTitle").html('도메인 신규 등록');
					$("#domainTypeButton").click();
					$("#saveButton2").show();
					$("#updateButton2").hide();
				} else if(type == 2) {		
					if(data[0].domainSeq == domainSeq) {
						updateConfirm();
					} else {
						//checkConfirm('도메인 수정','중복되는 도메인명이 존재합니다. 수정하시겠습니까?','updateDomain();');
						$("#domainTypeNmListTitle").html('도메인 수정');
						$("#domainTypeButton").click();
						$("#saveButton2").hide();
						$("#updateButton2").show();
					}
				}
			} else if(data.length >= 2) {
				//중복 된 리스트가 2개 이상일 경우 모두 중복 안내
				if(type == 1) {
					//checkConfirm('도메인 신규 등록','중복되는 도메인 분류명이 존재합니다. 등록하시겠습니까?','insertDomain();');
					$("#domainTypeNmListTitle").html('도메인 신규 등록');
					$("#domainTypeButton").click();
					$("#saveButton2").show();
					$("#updateButton2").hide();
				} else if(type == 2) {		
					//checkConfirm('도메인 수정','중복되는 도메인명이 존재합니다. 수정하시겠습니까?','updateDomain();');
					$("#domainTypeNmListTitle").html('도메인 수정');
					$("#domainTypeButton").click();
					$("#saveButton2").hide();
					$("#updateButton2").show();
				}
			}			
        }
    });
}

//저장 여부 Confirm 메세지 도메인 분류명 -> 도메인명 
function checkDoaminTypeNameConfirm(type) {
	let duplicateNameCheckData = $("#insert_form").serializeObject();
	
	if(!insertValidation()) {
		return;
	}
	
	if(!duplicateNameCheck(duplicateNameCheckData)){
		return;
	}
		
	let domainTypeName = $("#domainTypeNm").val().trim();
	duplicateDomainTypeName(domainTypeName,type);	
}

function saveConfirm() {
	checkConfirm('도메인 신규 등록','도메인 신규 등록하시겠습니까?','insertDomain();');
}

//저장 기능
function insertDomain() {

	//상세 내용 입력칸에서 엔터값 br로 변경
	$("#domainDscrpt").val($("#domainDscrpt").val().replace(/(?:\r\n|\r|\n)/g, '<br>'));
	
	let sendData = $("#insert_form").serializeObjectCustom();
	let dataTable = $("#domainTable").DataTable();


	$.ajax({
        url : contextPath +"/domain/insert",
        contentType : "application/json",
        type : "POST",
        data : JSON.stringify(sendData),
		async : false,
        success : function(data){
			if(data==1) {
				alertMessage("성공!","도메인이 생성되었습니다.","success");
				$("#cancelButton").click();
				$("#cancelButton2").click();
				dataTable.destroy();
				searchList('','',0);
			} else {
				alertMessage("실패!","도메인 생성에 실패했습니다.","danger");
				$("#cancelButton").click();
			}
        }

    });
}

//삭제 여부 Confirm 메세지 (Use N)
function deleteConfirm(domainSeq) {
	var domainSeq = $("#modal #domainSeq").val().trim();
	checkConfirm('도메인 삭제','해당 도메인을 삭제하시겠습니까?','deleteDomain('+domainSeq+')');
}

//삭제 기능 (Use N)
function deleteDomain(domainSeq) {
	
	let dataTable = $("#domainTable").DataTable();
	let sendData = {
		"domainSeq" : domainSeq
	}
	
	$.ajax({
        url : contextPath +"/domain/delete",
        contentType : "application/json",
        type : "POST",
        data : JSON.stringify(sendData),
		async : false,
        success : function(data){
			if(data==1) {
				alertMessage("성공!","해당 도메인이 삭제되었습니다.","success");
				$("#cancelButton").click();
				dataTable.destroy();
				searchList();
			} else {
				alertMessage("실패!","도메인 삭제에 실패했습니다.","danger");
			}
        }

    });
}

//수정 여부
function updateConfirm() {
	
	let duplicateNameCheckData = $("#insert_form").serializeObject();
	
	if(!insertValidation()) {
		return;
	}
	
	if(!duplicateNameCheck(duplicateNameCheckData)){
		return;
	}
	
	
	checkConfirm('도메인 수정','해당 도메인을 수정하시겠습니까?','updateDomain();');
}

//수정 기능
function updateDomain() {
	
	//상세 내용 입력칸에서 엔터값 br로 변경
	$("#domainDscrpt").val($("#domainDscrpt").val().replace(/(?:\r\n|\r|\n)/g, '<br>'));
	
	let sendData = $("#insert_form").serializeObjectCustom();
	let dataTable = $("#domainTable").DataTable();
	
	$.ajax({
        url : contextPath +"/domain/insert",
        contentType : "application/json",
        type : "POST",
        data : JSON.stringify(sendData),
		async : false,
        success : function(data){
			if(data==2) {
				alertMessage("성공!","도메인이 수정되었습니다.","success");
				$("#cancelButton").click();
				$("#cancelButton2").click();
				dataTable.destroy();
				searchList('','',7);
			} else {
				alertMessage("실패!","도메인 수정에 실패했습니다.","danger");
				$("#cancelButton").click();
				$("#cancelButton2").click();
			}
        }

    });
}

//도메인명 자동 생성
function domainNameAutoCreate(domainTypeNm, dataType, dataLen, dcmlLen){	
	if(dataType == 'VARCHAR') {
		dataType = 'VC';
	}
	
	if(dataLen == '' && dcmlLen == '') {
		$("#modal #domainNm").val(domainTypeNm.trim() + dataType);
	} else if(dcmlLen != '') {
		$("#modal #domainNm").val(domainTypeNm.trim() + dataType + '('+ dataLen.trim() + ',' + $("#dcmlLen").val().trim() +')');
	} else {
		$("#modal #domainNm").val(domainTypeNm.trim() + dataType + '('+ dataLen.trim() + ')');
	}
}