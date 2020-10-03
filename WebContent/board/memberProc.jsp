<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="member.MemberDAO" />
<jsp:useBean id="user" class="member.MemberDTO" />
<jsp:setProperty property="*" name="user" />
<%
	boolean result = dao.insertMember(user);
	String msg = "회원 가입에 실패 하였습니다.";
	String location = "member.jsp";
	if (result) {
		msg = "회원가입을 하였습니다.";
		location = "login.jsp";
	}
%>
<script>
alert("<%=msg%>");
location.href="<%=location%>";
</script>