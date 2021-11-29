// 특수문자 정규식 변수(공백 미포함)
var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;

// ready for the page open
$(document).ready(function () {
    //categorySelect();        // reset search SelectBox
    callHistoryList();       // list of History

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

// reset Search input
function resetSearch() {
    location.reload();
}

//검색 SelectBox 초기화
// function categorySelect() {
//     $.ajax({
//         url : contextPath +"/word/searchType",
//         contentType : "application/json",
//         type : "GET",
//         success : function(data){
//             for(var i = 0; i < data.length; i++) {
//                 if(data[i].columnName == 'WORD_NM') {
//                     var option  = $("<option>");
//                     $(option).val('wordNm').text('단어명');
//                     $("#searchType").append($(option));
//                 }
//
//                 if(data[i].columnName == 'WORD_ABBR') {
//                     var option  = $("<option>");
//                     $(option).val('wordAbbr').text('단어 영문 약어명');
//                     $("#searchType").append($(option));
//                 }
//
//                 if(data[i].columnName == 'WORD_ENG_NM') {
//                     var option  = $("<option>");
//                     $(option).val('wordEngNm').text('단어 영문명');
//                     $("#searchType").append($(option));
//                 }
//
//                 if(data[i].columnName == 'WORD_DSCRPT') {
//                     var option  = $("<option>");
//                     $(option).val('wordDscrpt').text('단어 설명');
//                     $("#searchType").append($(option));
//                 }
//
//                 if(data[i].columnName == 'SYNM_LIST') {
//                     var option  = $("<option>");
//                     $(option).val('synmList').text('이음동의어');
//                     $("#searchType").append($(option));
//                 }
//             }
//         }
//     });
// }

// call History list
function callHistoryList(searchType, keyword, orderNumber) {
    $('#historyTable tbody').on('dblclick', 'tr', function () {

        let table = $("#historyTable").DataTable();

        var rowData = table.row( this ).data();

        if(rowData !== undefined) {
            $("#newButton").click();
            openModal('update', rowData.wordSeq);
        }
    });

    // $("#searchType").change(function () {
    //     $("#keyword").focus();
    // });

    let dataTableHeight = document.getElementsByClassName('dataTables_scrollBody')[0];
    dataTableHeight.style.minHeight = '580px';
}

// after press search button
function searchHistory() {

    let search = {
        "entryType": $("#entryType").val(),
        "keyword": $("#keyword").val(),
    };

    $.ajax({
        url: contextPath + "/history/search",
        contentType: "application/json",
        type: "POST",
        data: JSON.stringify(search),
        success: function () {
            alertMessage("성공!","단어 등록 신청이 완료되었습니다.","success");
            //resetSearch();
            //callHistoryList('','',0);
        },
        error: function () {
            alert("failed")

            // alertMessage("경고!","실패하였습니다. 관리자에게 문의해주세요.","danger");
            // $("#cancelButton").click();
        }
    });
}

// open Modal (add, edit, detail)
function openModal(type, num) {
    clearFormData();

    //add = add, update = edit, detail = detail :)

    if(type == 'add') {

        // show 'ADD' modal
        $("#modal #saveButton").show();
        $("#modal #updateButton").hide();
        $("#modal #deleteEntry").hide();

        $("#modal .modal-title").html('Add History');

        // read only?
        $("#wordNm").attr('readonly', false);
        $("#wordEngNm").attr('readonly', false);
        $("#wordAbbr").attr('readonly', false);

        // disable category options
        // if ($("#transaction option[value='expense']")){
        //     $("select option[value*='savings']").prop('disabled',true);
        // } else if ($("#transaction option[value='savings']")){
        //     $("select option[value*='wants']").prop('disabled',true);
        //     $("select option[value*='needs']").prop('disabled',true);
        // } else if ($("#transaction option[value='none']")){
        //     $("select option[value*='savings']").prop('disabled',true);
        //     $("select option[value*='wants']").prop('disabled',true);
        //     $("select option[value*='needs']").prop('disabled',true);
        //
        //     // later
        //
        // } else {
        //     $("select option[value*='savings']").prop('disabled',true);
        //     $("select option[value*='wants']").prop('disabled',true);
        //     $("select option[value*='needs']").prop('disabled',true);
        // }
        $("#entryID").hide();
        $("#dateTime").show();
        $("#amount").show();
        $("#description").show();
        $("#transaction").show();
        $("#category").show();

    } else if (type == 'edit'){
        // show 'EDIT' modal
        $("#modal #saveButton").hide();
        $("#modal #updateButton").show();
        $("#modal #deleteEntry").hide();

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
        $("#modal .modal-title").html('Edit History');
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
        $("#modal #deleteEntry").hide();


        // $('div.stage').css('display', 'none');
        //
        // $('#wordEngNm').addClass('input-short');
        // $('#wordAbbr').addClass('input-short');

        $("#modal .modal-title").html('History Detail');

        $("#entryID").show();
        $("#dateTime").show();
        $("#amount").show();
        $("#description").show();
        $("#transaction").show();
        $("#category").show();

        // 비활성화
        $("#dateInput").attr('readonly', true);
        $("#descriptionInput").attr('readonly', true);
        $("#amountInput").attr('readonly', true);
        $("#transactionInput").attr('readonly', true);
        //$("#transactionInput").attr('readonly', true);

        let sendData = {
            "number" : num
        }

        console.log(num);
        $.ajax({
            url: contextPath + "/history/detail",
            contentType: "application/json",
            type: "GET",
            data: sendData,
            success: function (data) {
                $("#insert_form #dateTime").val(data.dateTime);
                $("#insert_form #description").val(data.description);
                $("#insert_form #amount").val(data.amount);
                $("#insert_form #transaction").val(data.transaction);
                $("#insert_form #category").val(data.category);
            },
            error: function () {
                alert("failed")

                // alertMessage("경고!","실패하였습니다. 관리자에게 문의해주세요.","danger");
                // $("#cancelButton").click();
            }
        });

    } else if (type == 'delete'){
        $("#modal #saveButton").hide();
        $("#modal #updateButton").hide();
        $("#modal #deleteEntry").show();

        $("#entryID").show();
        $("#dateTime").hide();
        $("#amount").hide();
        $("#description").hide();
        $("#transaction").hide();
        $("#category").hide();


    }
}

// add function - when save button clicked
function saveConfirm(){
        let sendData = {
            "dateTime": $("#dateTime").val(),
            "amount": $("#amount").val(),
            "description": $("#description").val(),
            "transaction": $("#transaction").val(),
            "category": $("#category").val()
        };
        let dataTable = $("#historyTable").DataTable();

        $.ajax({
            url: contextPath + "/history/add",
            contentType: "application/json",
            type: "POST",
            data: JSON.stringify(sendData),
            success: function () {
                // alertMessage("성공!","단어 등록 신청이 완료되었습니다.","success");
                $("#cancelButton").click();
                dataTable.destroy();
                resetSearch();
                // callHistoryList('','',0);
            },
            error: function () {
                alert("failed")

                // alertMessage("경고!","실패하였습니다. 관리자에게 문의해주세요.","danger");
                // $("#cancelButton").click();
            }
        });
}


// update function - when save button clicked
function updateConfirm(){
    let sendData = {
        "number": $("#entryID").val(),
        "dateTime": $("#dateTime").val(),
        "amount": $("#amount").val(),
        "description": $("#description").val(),
        "transaction": $("#transaction").val(),
        "category": $("#category").val()
    };
    let dataTable = $("#historyTable").DataTable();

    $.ajax({
        url: contextPath + "/history/update",
        contentType: "application/json",
        type: "POST",
        data: JSON.stringify(sendData),
        success: function () {
            // alertMessage("성공!","단어 등록 신청이 완료되었습니다.","success");
            $("#cancelButton").click();
            dataTable.destroy();
            resetSearch();
            // callHistoryList('','',0);
        },
        error: function () {
            alert("failed")

            // alertMessage("경고!","실패하였습니다. 관리자에게 문의해주세요.","danger");
            // $("#cancelButton").click();
        }
    });
}

function deleteConfirm(){
    let sendData = {
        "number": $("#entryID").val()
    };
    let dataTable = $("#historyTable").DataTable();

    $.ajax({
        url: contextPath + "/history/delete",
        contentType: "application/json",
        type: "POST",
        data: JSON.stringify(sendData),
        success: function () {
            // alertMessage("성공!","단어 등록 신청이 완료되었습니다.","success");
            $("#cancelButton").click();
            dataTable.destroy();
            resetSearch();
            // callHistoryList('','',0);
        },
        error: function () {
            alert("failed")

            // alertMessage("경고!","실패하였습니다. 관리자에게 문의해주세요.","danger");
            // $("#cancelButton").click();
        }
    });
}

/* Template */
//데이터 타입 선택 시 데이터 길이 및 소수점 길이 설정
// function readOnlyOption(dataType) {
//     if(dataType == '') {
//         $("#insert_form input[name=dataLen]").attr('readonly', true);
//         $("#insert_form input[name=dcmlLen]").attr('readonly', true);
//         $("#insert_form input[name=dataLen]").val('');
//         $("#insert_form input[name=dcmlLen]").val('');
//
//         $("#dataLenStar").hide();
//         $("#dcmlLenStar").hide();
//     } else {
//         let data = {
//             cdNm : dataType
//         }
//
//         $.ajax({
//             url : contextPath +"/code/list",
//             contentType : "application/json",
//             type : "POST",
//             data : JSON.stringify(data),
//             async : false,
//             success : function(data) {
//                 console.log(data);
//                 if(data.length > 0) {
//                     if(data[0].dataLenYn == 'N') {
//                         $("#insert_form input[name=dataLen]").attr('readonly', true);
//                         $("#insert_form input[name=dcmlLen]").attr('readonly', true);
//                         $("#insert_form input[name=dataLen]").val('');
//                         $("#insert_form input[name=dcmlLen]").val('');
//
//                         $("#dataLenStar").hide();
//                         $("#dcmlLenStar").hide();
//                     } else if(data[0].dataLenYn == 'Y' && data[0].dcmlLenYn == 'N') {
//                         $("#insert_form input[name=dataLen]").attr('readonly', false);
//                         $("#insert_form input[name=dcmlLen]").attr('readonly', true);
//                         $("#insert_form input[name=dcmlLen]").val('');
//
//                         $("#dataLenStar").show();
//                         $("#dcmlLenStar").hide();
//                     } else {
//                         $("#insert_form input[name=dataLen]").attr('readonly', false);
//                         $("#insert_form input[name=dcmlLen]").attr('readonly', false);
//
//                         $("#dataLenStar").show();
//                         $("#dcmlLenStar").show();
//                     }
//                 }
//             }
//         });
//     }
// }
//
// //검색 SelectBox 초기화
// // reset search SelectBox
// function categorySelect() {
//     $.ajax({
//         url : contextPath +"/domain/searchType",
//         contentType : "application/json",
//         type : "GET",
//         success : function(data){
//             for(var i = 0; i < data.length; i++) {
//                 if(data[i].columnName == 'DOMAIN_NM') {
//                     let option  = $("<option>");
//                     $(option).val('domainNm').text('도메인명');
//                     $("#searchType").append($(option));
//                 }
//
//                 if(data[i].columnName == 'DOMAIN_TYPE_NM') {
//                     let option  = $("<option>");
//                     $(option).val('domainTypeNm').text('도메인 분류명');
//                     $("#searchType").append($(option));
//                 }
//
//                 if(data[i].columnName == 'DOMAIN_DSCRPT') {
//                     let option  = $("<option>");
//                     $(option).val('domainDscrpt').text('도메인 설명');
//                     $("#searchType").append($(option));
//                 }
//             }
//         }
//
//     });
//
// }
//
// //데이터 타입 선택 셀렉트 박스 초기화
// function dataTypeSelect() {
//
//     let data = new Object();
//
//     $.ajax({
//         url : contextPath +"/code/list",
//         contentType : "application/json",
//         type : "POST",
//         data : JSON.stringify(data),
//         async : false,
//         success : function(data){
//             $('#dataType').children('option:not(:first)').remove();
//             for(var i = 0; i < data.length; i++) {
//                 let option  = $("<option>");
//                 $(option).val(data[i].cdNm).text(data[i].cdNm);
//                 $("#dataType").append($(option));
//             }
//         }
//
//     });
// }
//
// // list of History
// function searchList(searchType, keyword, orderNumber) {
//
//     // columns of History
//     let columns = ['DOMAIN_SEQ','DOMAIN_NM','DOMAIN_TYPE_NM','DATA_TYPE', 'DATA_LEN', 'DCML_LEN', 'DOMAIN_DSCRPT', 'UPD_DT'];
//     let order = 'asc';
//
//     if(orderNumber == undefined) {
//         orderNumber = 1;
//     }
//
//     if(orderNumber == 1) {
//         order = 'asc';
//     } else {
//         order = 'desc'
//     }
//
//
//     //sAjaxSource 를 사용하면 기본적인 DataTable에 사용되는 옵션들을 객체로 가지고 감. 서버의 DomainVO 객체 확인하기
//     $("#historyTable").DataTable({
//         processing: true,
//         serverSide: true,
//         responsive: true,
//         autoWidth: true,
//         sAjaxSource : contextPath + '/domain/list?columns='+columns +'&keyword=' + keyword + '&searchType=' + searchType,
//         sServerMethod: "POST",
//
//         // popover
//         "drawCallback": function (settings, json) {
//             //$('[data-toggle="tooltip"]').tooltip('update');
//             $('[data-toggle="popover"]').popover('update');
//         },
//         columns: [
//             { data: 'domainSeq', width: "10%" },
//             { data: 'domainNm' },
//             { data: 'domainTypeNm' },
//             { data: 'dataType' }
//         ],
//         columnDefs: [
//             { targets:[0], title: 'Date' },
//             { targets:[1], title: 'Description' },
//             { targets:[2], title: 'Type' },
//             { targets:[3], title: 'Category' }
//         ],
//         order: [[orderNumber, order]],
//
//         // popover
//         createdRow: function (row, data, dataIndex) {
//             // $(row).find('td:eq(6)').attr('data-toggle', "tooltip");
//
//             // $(row).find('td:eq(6)').attr('title', data["domainDscrpt"]);
//
//             // 설명이 존재할 경우에만 popover 사용
//             if (data["domainDscrpt"] != "-"){
//                 $(row).find('td:eq(6)').attr('data-container', 'body');
//                 $(row).find('td:eq(6)').attr('data-content', data["domainDscrpt"]);
//                 $(row).find('td:eq(6)').attr('data-toggle', "popover");
//                 $(row).find('td:eq(6)').attr('data-trigger', "hover");
//             }
//
//         }
//     });
//
//     $('#historyTable tbody').on('dblclick', 'tr', function () {
//
//         let table = $("#historyTable").DataTable();
//         let rowData = table.row( this ).data();
//
//         if(rowData != undefined) {
//             $("#newButton").click();
//             openModal('update', rowData.domainSeq);
//         }
//
//     });
//
//     $("#searchType").change(function () {
//         $("#keyword").focus();
//     });
//
//     let dataTableHeight = document.getElementsByClassName('dataTables_scrollBody')[0];
//     dataTableHeight.style.minHeight = '580px';
// }
//
//
// //도메인 분류명 목록
// function searchList2() {
//
//     let keyword = $("#domainTypeNm").val().trim();
//     let searchType = 'domainTypeNm';
//     let domainSeq = $("#domainSeq").val().trim();
//
//
//     $("#domainTypeTable").DataTable({
//         dom: '<"datatable-scroll"t><"datatable-footer">',
//         paging: false,
//         autoWidth: false,
//         scrollY: "210",
//         language: {},
//         sAjaxSource : contextPath + '/domain/list?keyword=' + keyword + '&searchType=' + searchType + '&domainSeq=' + domainSeq,
//         sServerMethod: "POST",
//         columns: [
//             { data: 'domainSeq' },
//             { data: 'domainNm' },
//             { data: 'domainTypeNm' },
//             { data: 'dataType' },
//             { data: 'dataLen' },
//             { data: 'dcmlLen' }
//         ],
//         initComplete: function(settings, json) {
//             setTimeout(function() {
//                 $("#orderId").click();
//             }, 200);
//         }
//     });
//
// }
//
//
//
// // reset Search input
// function resetSearch() {
//
//     $("#searchType").val('all');
//     $("#keyword").val('');
//
//     let dataTable = $("#historyTable").DataTable();
//     dataTable.destroy();
//     searchList();
//
// }
/* /Template */
