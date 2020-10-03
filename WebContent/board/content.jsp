 <%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">




<title>글 내용 보기</title>


</head>
<style>

table {
    border-collapse: collapse;
    line-height: 10px;
    margin-top: 1px;
    margin-bottom: 30px;
}
table td,th {
    border-top:1px solid black;
    border-bottom:1px solid black;
   
    border-collapse: collapse;
    text-align: center;
    padding: 10px;
}
th {
   background: rgb(221, 221, 221);

}
 caption {
 margin-top : 50px;
 margin-bottom: 50px;
 }
</style>
<%
   int num = Integer.parseInt(request.getParameter("num"));
System.out.println("num--->"+num);
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
   try {
      BoardDAO dbPro = new BoardDAO();
      BoardDTO article = dbPro.getArticle(num, "3");
%>

<body>
    <table class="board_view" align="center">
        <caption><h2>문의내용 상세보기</h2></caption>
        
        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
         
        <tbody>
            <tr>
                <th>제목</th>
                <td><%=article.getTitle() %></td>
                <th>글번호</th>
                <td><%=article.getNum() %></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%=article.getName() %></td>
                <th>작성시간</th>
                <td><%=sdf.format(article.getReg_date()) %></td>
            </tr>
            <tr height=300>
                <th>내용</th>
                <td colspan="3" style="text-align:left;"><pre>
                    <%=article.getContent() %></pre>
                </td>
            </tr>
            <tr>
              <td colspan="5" style="border:white;text-align:right ;"><input id="selectdate" value="수정하기" type="button">&nbsp;&nbsp;<input id="selectdate" value="삭제하기" type="button"></td>
                
                </tr>
        </tbody>
    </table>

            <% } catch (Exception e) {} %>
   
</body>
</html>