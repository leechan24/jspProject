<%
	request.setCharacterEncoding("UTF-8");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%
	MemberDAO mgr = new MemberDAO();
	String id = (String) session.getAttribute("idKey");
	MemberDTO memberInfo = mgr.getMember(id);
%>

<html>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script type="text/javascript" src="../js/update.js"></script>
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
	form {
    margin-bottom: 80px;
}
</style>
</head>
<body onLoad="regFrm.id.focus()" >
	<member> <font> <br /> <br />
		<form name="regFrm" method="post" action="updateProc.jsp">
			<input type="hidden" name="id" value="<%=id%>">
			<table cellpadding="5" align="center">
				<tr>
				<tr align="center" bgcolor="grey">
					<td colspan="3"><font color="black"><b>회원수정</b></font></td>
				</tr>
				<tr>
					<td width="20%">아이디</td>
					<td width="50%"><%=memberInfo.getId()%></td>
					<td width="30%">아이디를 적어 주세요.</td>
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
					<td colspan="3" align="center"><input type="button"
						value="회원수정" onclick="javascript:location.href='Reservation2.jsp'"> &nbsp; &nbsp; <input
						type="reset" value="다시쓰기">
				</tr>
			</table>
		</form>
	</font> </member>
</body>
</html>