// 특수문자 정규식 변수(공백 미포함)
var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;

// ready for the page open
$(document).ready(function () {
    //categorySelect();        // reset search SelectBox
    callHistoryList();       // list of History

    $('#updateButton').click(function() {
        location.reload();
    });
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
            dataTable.destroy();
            resetSearch();
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

    //add = add, detail = edit, detail = detail :)

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
      //  $("#entryID").hide();
        $("#dateTime").show();
        $("#amount").show();
        $("#description").show();
        $("#transaction").show();
        $("#category").show();

    } else if (type == 'detail'){
        // show 'DETAIL' modal

        $("#modal #saveButton").hide();
        $("#modal #updateButton").show();
        $("#modal #deleteEntry").hide();

        $("#modal .modal-title").html('Edit History');

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
                console.log(data);
                $("#dateTime").show();
                $("#amount").show();
                $("#description").show();
                $("#transaction").show();
                $("#category").show();
            },
            error: function () {
                alert("failed");
            }
        });

    } else if (type == 'delete') {
        $("#modal #saveButton").hide();
        $("#modal #updateButton").hide();
        $("#modal #deleteEntry").hide();

        // $("#entryID").show();
        // $("#dateTime").hide();
        // $("#amount").hide();
        // $("#description").hide();
        // $("#transaction").hide();
        // $("#category").hide();

        console.log(num)

        let sendData = {
            "number": num
        };
        let dataTable = $("#historyTable").DataTable();

        $.ajax({
            url: contextPath + "/history/delete",
            contentType: "application/json",
            type: "GET",
            data: JSON.stringify(sendData),
            success: function (data) {
                // alertMessage("성공!","단어 등록 신청이 완료되었습니다.","success");
                //alert("Entry has been successfully deleted.");
                //$("#cancelButton").click();
                //dataTable.destroy();
                //resetSearch();

                // callHistoryList('','',0);
            },
            error: function () {
                alert("failed");

                // alertMessage("경고!","실패하였습니다. 관리자에게 문의해주세요.","danger");
                // $("#cancelButton").click();
            }
        });
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

    location.reload();

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
            resetSearch();
            // alertMessage("성공!","단어 등록 신청이 완료되었습니다.","success");
            $("#cancelButton").click();
            dataTable.destroy();
            // callHistoryList('','',0);

            $("#historyTable").reload();
        },
        error: function () {
            alert("failed")

            // alertMessage("경고!","실패하였습니다. 관리자에게 문의해주세요.","danger");
            // $("#cancelButton").click();
        }
    });

}

function deleteConfirm(num){
    let sendData = {
        "number": num
    };
    let dataTable = $("#historyTable").DataTable();

    $.ajax({
        url: contextPath + "/history/delete",
        contentType: "application/json",
        type: "POST",
        data: JSON.stringify(sendData),
        success: function () {
            // alertMessage("성공!","단어 등록 신청이 완료되었습니다.","success");
            alert("Entry has been successfully deleted. Refresh the table to see your changes.");
            //$("#cancelButton").click();
           // dataTable.destroy();
          //  resetSearch();

            //dataTable.ajax.reload();
            //window.location.reload();
            // callHistoryList('','',0);
        },
        error: function () {
            alert("failed");

            // alertMessage("경고!","실패하였습니다. 관리자에게 문의해주세요.","danger");
            // $("#cancelButton").click();
        }
    });

    location.reload();

}