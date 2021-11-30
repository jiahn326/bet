function updateConfirm(){
    let sendData = {
        "wants": $("#newWants").val(),
        "needs": $("#newNeeds").val(),
        "savings": $("#newSavings").val()
    };

    $.ajax({
        url: contextPath + "/budget/update",
        contentType: "application/json",
        type: "POST",
        data: JSON.stringify(sendData),
        success: function () {
            alertMessage("Plese reload the page to see updated changes","success");
            $("#cancelButton").click();
            //dataTable.destroy();
            // callHistoryList('','',0);

            $("#c3-pie-chart").reload();
            $("#bars_stacked_clustered").reload();
        },
        error: function () {
            alert("failed")

            // alertMessage("경고!","실패하였습니다. 관리자에게 문의해주세요.","danger");
            // $("#cancelButton").click();
        }
    });

}

function refreshPage(){
    window.location.reload();
}