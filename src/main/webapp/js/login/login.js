function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires="
			+ todayDate.toGMTString() + ";"
}

function getCookie(Name) {
	var search = Name + "=";
	if (document.cookie.length > 0) {
		offset = document.cookie.indexOf(search);
		if (offset != -1) {
			offset += search.length;
			end = document.cookie.length;
			if (end == -1)
				end = document.cookie.length;
			return unescape(document.cookie.substring(offset, end));
		}
	}
}

//입력값 유호성 검사
function loginValidation(){
    if($("input[name=userId]").val().length == 0){
        alertMessage("경고!","아이디를 입력해주세요.","warning");
        $("input[name=userId]").focus();
        return false;
    }

    if($("input[name=userPwd]").val().length == 0){
        alertMessage("경고!","비밀번호를 입력해주세요.","warning");
        $("input[name=userPw]").focus();
        return false;
    }

    return true;
}

//로그인
function loginConfirm() {
    if(!loginValidation()) {
		return;
	} else {
		login();
	}	
}


function login() {
	
    let sendData = {
        "userId" : $("input[name=userId]").val(),
        "userPwd" : $("input[name=userPwd]").val(),
        "userNm" : $("input[name=userNm]").val()
    }


	if ($("#rememberId").prop("checked")) { //아이디 저장을 체크하였을때
		setCookie("loginId", $("#id").val(), 7); //쿠키이름을 id로 form.mb_id.value 값을 7일동안 저장
	} else { //아이디 저장을 체크하지 않았을때
		setCookie("loginId", "", 0); //날짜를 0으로 저장하여 쿠키 삭제
	}
	
	$.ajax({
        url : contextPath +"/loginWeb",
        contentType : "application/json",
        type : "GET",
        data : sendData,
        success : function(data){
	
			if(data == 1) {
				
				let id = $('#id').val();
				let password = $('#password').val();
				
				let memberInfo = {
							id: id,
							password: password
				};

				sessionStorage.setItem('memberInfo', JSON.stringify(memberInfo));				
				location.href = contextPath + "/openTms";
				
			} else {
				alertMessage("실패!","입력하신 정보가 올바르지 않습니다.","danger");
			}
        }

    });	
	
}


function alertMessage(title,message,type){
    if(type != "success" && type != "primary" && type != "danger" && type != "info" && type != "warning"){
        return false;
    }

    $("#alert").addClass("bg-"+type);
    $("#alertTitle").text(title);
    $("#alertMessage").text(message);

    $("#alert").alert().show();
    tagsInputAnimation($("#alert"),"fadeIn");
    setTimeout(function(){
        tagsInputAnimation($("#alert"),"fadeOut");
        setTimeout(function(){
            $("#alert").alert().hide();
            $("#alert").removeClass("bg-"+type);
        },1000);
    },2000);
}

function tagsInputAnimation(target,animation){
    $(target).addClass("animated "+ animation).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
        $(target).removeClass('animated ' + animation);
    });
}


$(window).on('load', function() {

	// iframe일 경우 top.href로 확장하기
	if ($(this)[0].name == "contentMain") {
		window.top.location.replace(contextPath+"/login");
	}

	if (getCookie("loginId")) {
			var id_value = getCookie("loginId").split(";");
			$("#id").val(id_value[0]);
			$("#rememberId").prop("checked", true);
	}

	$("#password").keydown(function(key) {
		if (key.keyCode == 13) {
			$("#login_btn").trigger('click');
		}

	});
});