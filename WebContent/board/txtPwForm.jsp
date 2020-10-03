<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
%>
<script>
	function check() {
		if (document.pwdform.password.value == '') {
			alert("비밀번호를 입력하세요");
			return false;
		}
	}
</script>
<style>
form {
    margin-bottom: 235px;
}
</style>
<center>
	<br>
	<br>
	<br>
	<form method="post" name="pwdform" action="contentPro.jsp?num=<%=num%>"
		onSubmit="return check()">
		<h3>비밀번호를 입력하세요</h3>
		<h4>
			Password &nbsp;&nbsp;&nbsp; <input type="password" name="password">
			<input type="hidden" name="num" value="<%=num%>">
		</h4>
		<br> <input type="submit" value="확인"> <input
			type="button" value="돌아가기"
			onclick="location.href='list.jsp?boardid=3'">
	</form>
</center>