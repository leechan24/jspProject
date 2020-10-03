function inputCheck() {
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
   document.regFrm.submit();
}

function win_close() {
   self.close();
}