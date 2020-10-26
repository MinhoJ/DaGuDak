function login() {

	var member_id = loginForm.member_id.value;
	var password = loginForm.password.value;

	if (member_id == '' || password == '') {
		alert("아이디와 비밀번호를 입력하세요.");
		$("#submit").attr("disabled", "disabled");

		return;
	}
}

function keyevent() {
	$("#submit").removeAttr("disabled");
}
