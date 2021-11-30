function updateConfirm(){
    let sendData = {
        "wants": $("#newWants").val(),
        "needs": $("#newNeeds").val(),
        "savings": $("#newSavings").val()
    };

    $.ajax({
        url: contextPath + "/budget/updateBudget",
        contentType: "application/json",
        type: "POST",
        data: JSON.stringify(sendData),
        success: function () {
            resetSearch();
            // alertMessage("성공!","단어 등록 신청이 완료되었습니다.","success");
            $("#cancelButton").click();
            //dataTable.destroy();
            // callHistoryList('','',0);

            $("#c3-pie-chart").reload();
        },
        error: function () {
            alert("failed")

            // alertMessage("경고!","실패하였습니다. 관리자에게 문의해주세요.","danger");
            // $("#cancelButton").click();
        }
    });

}