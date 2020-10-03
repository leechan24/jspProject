<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>

<%
   int pageSize = 5;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

int currentPage = Integer.parseInt(pageNum); //head.jsp에 pageNum있음
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;
int count = 0;
int number = 0;
ArrayList articleList = null;
BoardDAO dbPro = new BoardDAO();
count = dbPro.getArticleCount("3");
if (count > 0) {
   articleList = dbPro.getArticles(startRow,endRow,"3");
}
number = count - (currentPage - 1) * pageSize;
%>
<html>
 <head>


 </head>
 <style>
 table{
    width: 50%;
    border-collapse: collapse;
    line-height: 20px;
    margin-top: 20px;
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

.w3-center {
    margin-bottom: 125px;
}

 </style>
 
 <body>
 <p class="w3-left" style="padding-left:30px;">
 </p><div style="text-align:center">
<h1>문의하기</h1>
   
  <span class="w3-center w3-middle">
 <b>궁금하신 사항을 문의해 주시면 성실하게 답변해 드리도록 하겠습니다.<br/>
주말이나 공휴일의 경우 답변이 늦어질 수 있으니 양해 바랍니다.</b></span></div>



  <%
     if(count==0){
  %>
  <table class="table table-striped" align="center">
    <tr class="w3-grey">
    <td style="border:white;text-align:right;"><a href="writeUploadForm.jsp" >글쓰기</a></td></tr>
    <tr class="w3-grey">
     <td align="center">문의가 없습니다.</td></tr></table>
     <%
         }else{
      %>
    
     <table class="table table-striped" align="center">
    
       <tr class="w3-grey">
          <td colspan="5" style="border:white;text-align:right;"><a href="writeUploadForm.jsp" >글쓰기</a></td>
          <tr>
         <th >작성자</th>
         <th >제목</th>
         <th >작성일</th></tr> 
            
         <%
         
         for (int i = 0; i < articleList.size(); i++) {
            BoardDTO article = (BoardDTO) articleList.get(i);
         
         %>
         <tbody>
         <tr >
         <td ><%=article.getName() %></td>
         <td >
         <img src="../img/lock.png" border="0" height="16">
      <a href = "txtPwForm.jsp?num=<%=article.getNum() %>"><%=article.getTitle() %> </a>
      </td>
        <td ><%=sdf.format(article.getReg_date()) %></td>
        
         </tr><% }%>
         </tbody>
     </table>
      
      <% }%><br><br>


   <div class="w3-center" style="text-align: center">
      <%
         int bottomLine = 5;
      if (count > 0) {
         int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
         int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
         int endPage = startPage + bottomLine - 1;
         if (endPage > pageCount)
            endPage = pageCount;
         if (startPage > bottomLine) {
      %><a href="list.jsp?pageNum=<%=startPage - bottomLine%>">[이전]</a>
      <%
         }
      %>
      <%
         for (int i = startPage; i <= endPage; i++) {
      %>
      <a href="list.jsp?pageNum=<%=i%>"> <%
    if (i != currentPage)
    out.print("[" + i + "]");
 else
    out.print("<font color='red'>[" + i + "]</font>");
 %></a>
      <%
         }
      if (endPage < pageCount) {
      %>
      <a href="list.jsp?pageNum=<%=startPage + bottomLine%>">[다음]</a>
      <%
         }
      }
      %>
   </div>
</body>
</html>