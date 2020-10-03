<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mMgr" class="member.MemberDAO" />
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String msg = "로그인에 실패 하였습니다.";
	boolean result = mMgr.loginMember(id, pwd);
	if (result) {
		session.setAttribute("idKey", id);
		msg = "로그인 에 성공 하였습니다.";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "index.jsp";
</script>