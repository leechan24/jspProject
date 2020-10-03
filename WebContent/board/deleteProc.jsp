<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mgr" class="member.MemberDAO" />
<%
	String id = (String) session.getAttribute("idKey");
	String password = request.getParameter("password");
	boolean result = mgr.deleteMember(id,password);
	String msg = "회원 정보 수정에 실패 하였습니다.";
	String location = "delete.jsp";
	if (result) {
		session.invalidate();
		msg = "회원탈퇴를 하였습니다.";
		location = "index.jsp";
	}
%>
<script>
alert("<%=msg%>");
location.href="<%=location%>";
</script>