function inputCheck() {
   if (document.wuFrm.name.value == "") {
      alert("이름을 입력하세요");
      document.wuFrm.name.focus();
      return false;
   }

   if (document.wuFrm.email.value == "") {
      alert("이메일을 입력하세요");
      document.wuFrm.email.focus();
      return false;
   }

   if (document.wuFrm.tel.value == "") {
      alert("연락처를 입력하세요");
      document.wuFrm.tel.focus();
      return false;
   }
   if (document.wuFrm.title.value == "") {
      alert("제목을 입력하세요");
      document.wuFrm.title.focus();
      return false;
   }
   if (document.wuFrm.content.value == "") {
      alert("내용을 입력하세요");
      document.wuFrm.content.focus();
      return false;
   }
   if (document.wuFrm.password.value == "") {
      alert("비밀번호를 입력하세요");
      document.wuFrm.password.focus();
      return false;
   }

   location.href = "writeUploadProc.jsp";
}
function win_close() {
   self.close();
}