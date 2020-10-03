<%request.setCharacterEncoding("UTF-8");%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class = "board.BoardDTO"/>
<jsp:useBean id="dao" class = "board.BoardDAO"/>
<%
String msg = "문의등록에 실패 하였습니다.";
String location = "writeUploadForm.jsp";

try {
	   BoardDTO article = new BoardDTO();
	   article.setName(request.getParameter("name"));
	   article.setEmail(request.getParameter("email"));
	   article.setTel(Integer.parseInt(request.getParameter("tel")));
	   article.setTitle(request.getParameter("title"));
	   article.setCategory(request.getParameter("category"));
	   article.setContent(request.getParameter("content"));
	   article.setPassword(request.getParameter("password"));
	   article.setBoardid((String) session.getAttribute("boardid"));
	   BoardDAO dao1 = new BoardDAO();
	   
	   boolean result = dao1.insertInquire(article);
	   
	   if (result) {
			msg = "문의를 등록하였습니다.";
			location = "list.jsp";
			System.out.println(msg);
		};
		
} catch(Exception e) {
	   e.printStackTrace();
}


%>
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script> 
<body>
<meta http-equiv="Refresh" content="0;url=list.jsp">
</body>