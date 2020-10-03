function inputCheck() {

	var idcheck = document.getElementById("idcheck");
	
	if (!idcheck.innerHTML.includes("는 사용 가능 합니다.")) {
		alert("사용 불가 입니다.");
		document.regFrm.id.focus();
		return false;
	}
	if (document.regFrm.id.value == "") {
		alert("아이디를 입력해주세요.");
		document.regFrm.id.focus();
		return;
	}
	if (document.regFrm.password.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.regFrm.password.focus();
		return;
	}
	if (document.regFrm.repassword.value == "") {
		alert("비밀번호를 확인해 주세요");
		document.regFrm.repassword.focus();
		return;
	}
	if (document.regFrm.password.value != document.regFrm.repassword.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.regFrm.repassword.value = "";
		document.regFrm.repassword.focus();
		return;
	}
	if (document.regFrm.name.value == "") {
		alert("이름를 입력해 주세요.");
		document.regFrm.name.focus();
		return;
	}
	if (document.regFrm.birthday.value == "") {
		alert("생년월일을 입력해 주세요");
		document.regFrm.birthday.focus();
		return;
	}
	
	   
   // 미성년자 가입불가
   var birth1 = document.regFrm.birthday.value;	// member
   var birth2 = birth1.substr(0, 2);
   var birthyear = Number(birth2);
   if (birthyear >= 1 && birthyear <= 20) {
      alert("**미성년자는 회원 가입이 불가능합니다**");
      document.regFrm.birthday.focus();
      return;
   }
	

	if (document.regFrm.tel.value == "") {
		alert("전화번호를 입력해 주세요.");
		return;
	}

	document.regFrm.submit();
}

function win_close() {
	self.close();
}