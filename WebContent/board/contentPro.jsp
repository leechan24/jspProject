<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%  
int num = Integer.parseInt(request.getParameter("num"));
String password = request.getParameter("password");

try {
	   BoardDTO article = new BoardDTO();
	   article.setNum(Integer.parseInt(request.getParameter("num")));
	   article.setPassword(request.getParameter("password"));
	   BoardDAO dao1 = new BoardDAO();
	   boolean result = dao1.pwCheck(num,password);
	if (result) {
         response.sendRedirect("content.jsp?num="+num);

	} else {
%>
<script language="JavaScript">
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%
	} }catch(Exception e) {
		   e.printStackTrace();
	}
	
%>