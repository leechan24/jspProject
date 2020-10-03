
<%@page import="member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
	request.setCharacterEncoding("UTF-8");

	ArrayList<MemberDTO> mlist = null;
	mlist = dao.readMemberList();
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 리스트</title>
<link href="style.css" rel="stylesheet" type="text/css">

</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br />
		<table cellpadding="5">
			<tr>
				<td bgcolor="#FFFFCC">
					<table border="1" cellspacing="0" cellpadding="2" width="1200">
						<tr bgcolor="#996600">
							<td align="center" colspan="9"><font color="#FFFFFF"><b>회원
										정보</b></font></td>
						</tr>
						<tr>
							<td>회원id</td>
							<td>이름</td>
							<td>전화번호</td>
							<td>생년월일</td>
						</tr>
						<%
							for (int i = 0; i < mlist.size(); i++) {
								MemberDTO user = mlist.get(i);
						%>
						<tr>
							<td><%=user.getId()%></td>
							<td><%=user.getName()%></td>
							<td><%=user.getTel()%></td>
							<td><%=user.getBirthday()%></td>
						</tr>
						<%
							}
						%>
					</table>
			</div>
</body>
</html>