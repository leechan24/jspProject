
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberDAO" />

<%
	String id = request.getParameter("id");

	boolean result = mMgr.checkId(id);

	if (result) {
		out.println("는 이미 존재하는 ID입니다.");
	} else {
		out.println("는 사용 가능 합니다.");
	}
%>