// 특수문자 정규식 변수(공백 미포함)
var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;

$(document).ready(function () {

    categorySelect();   // reset search SelectBox
    searchList();       // list of History

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
// reset search SelectBox
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
// list of History
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
// reset Search input
function resetSearch() {

    $("#searchType").val('all');
    $("#keyword").val('');

    let dataTable = $("#domainTable").DataTable();
    dataTable.destroy();
    searchList();

}