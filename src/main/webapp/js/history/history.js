// 특수문자 정규식 변수(공백 미포함)
var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;

// ready for the page open
$(document).ready(function () {
    categorySelect();   // reset search SelectBox
    searchList();       // list of History

});

// $('html').click(function(e) {
//
//     if($("#modal2").hasClass("show") === true) {
//         document.getElementById("modal").style.zIndex = 1040;
//     } else {
//         document.getElementById("modal").style.zIndex = 1050;
//     }
//
// });

//

$(window).on('load', function() {
    $("#keyword").keydown(function(key) {
        if (key.keyCode == 13) {
            $("#searchButton").trigger('click');
        }
    });

    $('div.modal-body').find('#wordNm').change(function(){
        $('div.modal-body').find('#wordNm').removeClass('valid');
    });
    $('div.modal-body').find('#wordEngNm').change(function(){
        $('div.modal-body').find('#wordEngNm').removeClass('valid');
    });
    $('div.modal-body').find('#wordAbbr').change(function(){
        $('div.modal-body').find('#wordAbbr').removeClass('valid');
    });

    /*

    $('#modalTable1').dataTable( {
        "createdRow": function( row, data, dataIndex){
                if( data.fatalExist == "T"){
                    $(row).addClass('redClass');
                }
            }
    });
    */

});

//검색 SelectBox 초기화
function categorySelect() {
    $.ajax({
        url : contextPath +"/word/searchType",
        contentType : "application/json",
        type : "GET",
        success : function(data){
            for(var i = 0; i < data.length; i++) {
                if(data[i].columnName == 'WORD_NM') {
                    var option  = $("<option>");
                    $(option).val('wordNm').text('단어명');
                    $("#searchType").append($(option));
                }

                if(data[i].columnName == 'WORD_ABBR') {
                    var option  = $("<option>");
                    $(option).val('wordAbbr').text('단어 영문 약어명');
                    $("#searchType").append($(option));
                }

                if(data[i].columnName == 'WORD_ENG_NM') {
                    var option  = $("<option>");
                    $(option).val('wordEngNm').text('단어 영문명');
                    $("#searchType").append($(option));
                }

                if(data[i].columnName == 'WORD_DSCRPT') {
                    var option  = $("<option>");
                    $(option).val('wordDscrpt').text('단어 설명');
                    $("#searchType").append($(option));
                }

                if(data[i].columnName == 'SYNM_LIST') {
                    var option  = $("<option>");
                    $(option).val('synmList').text('이음동의어');
                    $("#searchType").append($(option));
                }
            }
        }
    });
}

// call History list
function callList(searchType, keyword, orderNumber) {
    // let order = 'asc';
    //
    // if(orderNumber == undefined) {
    //     orderNumber = 1;
    // }
    //
    // if (orderNumber == 1){
    //     order = 'asc';
    // } else {
    //     order = 'desc';
    // }
    //
    // //Sorting 하기 위한 컬럼들 서버로 가지고감
    // var columns = ['WORD_SEQ','WORD_NM','WORD_ABBR','WORD_ENG_NM', 'WORD_DSCRPT', 'SYNM_LIST'];
    //
    // var param = {
    //     "searchType" : searchType,
    //     "keyword" : keyword
    // }
    //
    // //sAjaxSource 를 사용하면 기본적인 DataTable에 사용되는 옵션들을 객체로 가지고 감.
    // $("#wordTable").DataTable({
    //     processing: true,
    //     serverSide: true,
    //     responsive: true,
    //     autoWidth: true,
    //     sAjaxSource : contextPath + '/word/list?columns='+columns +'&keyword=' + keyword + '&searchType=' + searchType,
    //     sServerMethod: "POST",
    //     "drawCallback": function (settings, json) {
    //         //$('[data-toggle="tooltip"]').tooltip('update');
    //         $('[data-toggle="popover"]').popover('update');
    //     },
    //     columns: [
    //         { data: 'wordSeq', width: "10%"},
    //         { data: 'wordNm' },
    //         { data: 'wordAbbr' },
    //         { data: 'wordEngNm' },
    //         { data: 'summaryWordDscrpt' }, //summaryWordDscrpt
    //         { data: 'synmList' }
    //     ],
    //     columnDefs: [
    //         { targets:[0], title: 'ID' },
    //         { targets:[1], title: '단어명' },
    //         { targets:[2], title: '단어 영문 약어명' },
    //         { targets:[3], title: '단어 영문명' },
    //         { targets:[4], title: '단어 설명' },
    //         { targets:[5], title: '이음동의어' }
    //     ],
    //     // order: [[orderNumber, 'asc']]
    //     order: [[orderNumber, order]],
    //
    //     createdRow: function (row, data, dataIndex) {
    //         // $(row).find('td:eq(4)').attr('data-toggle', "tooltip");
    //
    //         //$(row).find('td:eq(4)').attr('title', data["wordSeq"]);
    //         $(row).find('td:eq(4)').attr('data-container', 'body');
    //         $(row).find('td:eq(4)').attr('data-content', data["wordDscrpt"]);
    //         // $(row).find('td:eq(4)').attr('data-placement', "bottom");
    //         $(row).find('td:eq(4)').attr('data-toggle', "popover");
    //         $(row).find('td:eq(4)').attr('data-trigger', "hover");
    //     }
    // });

    $('#historyTable tbody').on('dblclick', 'tr', function () {

        let table = $("#historyTable").DataTable();

        var rowData = table.row( this ).data();

        if(rowData != undefined) {
            $("#newButton").click();
            openModal('update', rowData.wordSeq);
        }
    });

    $("#searchType").change(function () {
        $("#keyword").focus();
    });

    let dataTableHeight = document.getElementsByClassName('dataTables_scrollBody')[0];
    dataTableHeight.style.minHeight = '580px';
}

// after press search button
function searchHistory() {

    let searchType = $("#searchType").val();
    let keyword = $("#keyword").val();
    let dataTable = $("#historyTable").DataTable();

    if(keyword == '') {
        if($("#searchType").val() == 'all') {
            dataTable.clear().destroy();
            searchList();
        } else {
            alertMessage("Warning!","Please enter input.","warning");
            return false;
        };
    } else {
        dataTable.clear().destroy();
        searchList(searchType, keyword);
    }
}

// open Modal (add, edit, detail)
function openModal(type) {
    clearFormData();

    //add = add, update = edit, detail = detail :)

    if(type == 'add') {
        // show 'ADD' modal
        $("#modal #saveButton").show();
        $("#modal #updateButton").hide();

        // read only?
        $("#wordNm").attr('readonly', false);
        $("#wordEngNm").attr('readonly', false);
        $("#wordAbbr").attr('readonly', false);

    } else if (type == 'edit'){
        // show 'EDIT' modal
        $("#modal #saveButton").show();
        $("#modal #updateButton").hide();

        // // 등록 프로세스 관련 구역 및 버튼 hide
        // $('div #stage0').find('button').hide();
        // $('#stage0Helper').hide();
        // $('div #stage2').find('button').hide();
        // $('#stage2Helper').hide();
        // $('div.insertWord').hide();
        //
        // //버튼 관리
        // $("#modal #deleteButton").show();
        // $("#modal #updateButton").show();
        // $("#modal #saveButton").hide();
        // $("#modal .modal-title").html('단어 상세보기');
        // $("#insert_form input[name=wordSeq]").val(wordSeq);
        //
        // // 비활성화
        // $("#wordNm").attr('readonly', true).addClass('valid');
        // $("#wordEngNm").attr('readonly', true).addClass('valid');
        // $("#wordAbbr").attr('readonly', true).addClass('valid');
        //
        // // 인풋 길이
        // $('#wordEngNm').removeClass('input-short');
        // $('#wordAbbr').removeClass('input-short');

    } else if (type == 'detail'){
        // show 'EDIT' modal

        $("#modal #saveButton").hide();
        $("#modal #updateButton").show();

        // $('div.stage').css('display', 'none');
        //
        // $('#wordEngNm').addClass('input-short');
        // $('#wordAbbr').addClass('input-short');

        // $("#modal .modal-title").html('단어 신규 등록');

        // 비활성화
        $("#wordNm").attr('readonly', true);
        $("#wordEngNm").attr('readonly', true);
        $("#wordAbbr").attr('readonly', true);
    }
}


/* Template */
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

// list of History
function searchList(searchType, keyword, orderNumber) {

    // columns of History
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
    $("#historyTable").DataTable({
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
            { data: 'dataType' }
        ],
        columnDefs: [
            { targets:[0], title: 'Date' },
            { targets:[1], title: 'Description' },
            { targets:[2], title: 'Type' },
            { targets:[3], title: 'Category' }
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

    $('#historyTable tbody').on('dblclick', 'tr', function () {

        let table = $("#historyTable").DataTable();
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



// reset Search input
function resetSearch() {

    $("#searchType").val('all');
    $("#keyword").val('');

    let dataTable = $("#historyTable").DataTable();
    dataTable.destroy();
    searchList();

}
/* /Template */
