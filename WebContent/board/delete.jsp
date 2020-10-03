
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDAO mgr = new MemberDAO();
	String id = (String) session.getAttribute("idKey");
	MemberDTO memberInfo = mgr.getMember(id);
%>
<html>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script type="text/javascript" src="../js/delete.js"></script>
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
		<form name="regFrm" method="post" action="deleteProc.jsp">
			<table cellpadding="5" align="center">
				<tr>
				<tr align="center" bgcolor="grey">
					<td colspan="3"><font color="black"><b>회원 탈퇴</b></font></td>
				</tr>
				<tr>
					<b>본인 확인을 위해 비밀번호를 확인해 주세요.</b>
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
					<td colspan="3" align="center"><input type="button"
						value="회원탈퇴" onclick="inputCheck()"> &nbsp; &nbsp; <input
						type="reset" value="다시쓰기">
				</tr>
			</table>
		</form>
	</font> </member>
</body>
</html>