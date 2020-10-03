<%request.setCharacterEncoding("UTF-8");%>
<%@page import="review.ReviewDTO"%>
<%@page import="review.ReviewDAO"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String msg = "후기등록에 실패 하였습니다.";
String location = "ReviewWriteUploadForm.jsp";

try {
	   ReviewDTO article = new ReviewDTO();
	   article.setName(request.getParameter("name"));
	   article.setTitle(request.getParameter("title"));
	   article.setContent(request.getParameter("content"));
	   article.setPassword(request.getParameter("password"));
	   article.setRank_point(Integer.parseInt(request.getParameter("rank_point")));
	   article.setRoom_name(request.getParameter("room_name"));
	   article.setBoardid((String) session.getAttribute("boardid"));
	   ReviewDAO dao = new ReviewDAO();
	  
	   int room_name = Integer.parseInt(request.getParameter("room_name"));
	   System.out.println(room_name);
	   
	   boolean result = dao.insertReview(article, room_name);
	   
	   if (result) {
			msg = "문의를 등록하였습니다.";
			location = "ReviewList.jsp";
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
<meta http-equiv="Refresh" content="0;url=ReviewList.jsp">
</body>