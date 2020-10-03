function inputCheck() {
   if (document.ReviewFrm.name.value == "") {
      alert("이름을 입력하세요");
      document.ReviewFrm.name.focus();
      return false;
   }

   if (document.ReviewFrm.title.value == "") {
      alert("제목을 입력하세요");
      document.ReviewFrm.title.focus();
      return false;
   }
   if (document.ReviewFrm.content.value == "") {
      alert("내용을 입력하세요");
      document.ReviewFrm.content.focus();
      return false;
   }
   if (document.ReviewFrm.password.value == "") {
      alert("비밀번호를 입력하세요");
      document.ReviewFrm.password.focus();
      return false;
   }

   location.href = "ReviewWriteUploadProc.jsp";
}
function win_close() {
   self.close();
}