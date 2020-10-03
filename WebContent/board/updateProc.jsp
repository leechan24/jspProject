<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mgr" class="member.MemberDAO" />
<jsp:useBean id="bean" class="member.MemberDTO" />
<jsp:setProperty property="*" name="bean" />

<%
	boolean result = mgr.updateMember(bean);
	String msg = "회원 정보 수정에 실패 하였습니다.";
	String location = "update.jsp";
	if (result) {
		msg = "회원정보 수정을 하였습니다.";
		location = "index.jsp";
	}
%>
<script>
alert("<%=msg%>");
location.href="<%=location%>";
</script>