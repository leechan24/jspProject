<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<title>회원가입</title>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">

	function idCheck(id) {
		var idcheck = document.getElementById("idcheck"); //span ID로 입력하기.
		if (id.length < 8) {
			idcheck.innerHTML = "8자 이상 입력하시오.";
		} else {
			idcheckOfServer(id);
		}
		url = "idCheck.jsp?id=" + id;
	}

	function idcheckOfServer(id) {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			var idcheck = document.getElementById("idcheck");

			if (this.readyState == 4 && this.status == 200) {
				var str = this.responseText;
				idcheck.innerHTML = str;
				return str;
			}
		};
		var params = "?id=" + encodeURIComponent(id);
		xhttp.open("GET", "../nohead/idCheck.jsp" + params, true);
		xhttp.send();
	}
	
	
</script>
<style>
member font {
	font: normal normal normal 25px/1.4em brandon-grot-w01-light, sans-serif;
	padding-top: 15px;
}

member body {
	font: 12px "맑은 고딕", "Malgun Gothic", sans-serif;
	line-height: 1.5;
}

member .form {
	width: 200px;
	height: 388px;
	box-sizing: border-box;
	border: 1px solid gray;
	margin: 0 auto;
	padding: 8px 15px;
}
</style>
</head>
<body onLoad="regFrm.id.focus()">
	<member> <font> <br /> <br />
		<form name="regFrm" method="post" action="memberProc.jsp">
			<input type="hidden" name="idCheckOk" value="no">
			<table cellpadding="5" align="center">
				<tr>
				<tr align="center" bgcolor="grey">
					<td colspan="3"><font color="black"><b>회원가입</b></font></td>
				</tr>
				<tr>
					<td width="20%">아이디</td>
					<td width="50%" colspan="2"><input type="text" name="id"
						size="15" onkeyup="idCheck(this.form.id.value)"> <span
						id="idcheck"></span></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="password" size="15"></td>
					<td>패스워드를 적어주세요.</td>
				</tr>
				<tr>
					<td>패스워드 확인</td>
					<td><input type="password" name="repassword" size="15"></td>
					<td>패스워드를 확인합니다.</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input name="name" size="15"></td>
					<td>이름을 적어주세요.</td>
				</tr>

				<tr>
					<td>생년월일</td>
					<td><input name="birthday" size="6"> ex)910316</td>
					<td>생년월일를 적어 주세요.</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input name="tel" size="15"></td>
					<td>전화번호를 입력해 주세요</td>
				<tr>
					<td colspan="3" align="center">
					<input type="button" value="회원가입" onclick="inputCheck()"> &nbsp; &nbsp; 
				    <input type="reset" value="다시쓰기"> &nbsp; &nbsp; 
					<input type="button" value="로그인" onclick="javascript:location.href='login.jsp'"></td>
				</tr>
			</table>
		</form>
	</font> </member>
</body>
</html>