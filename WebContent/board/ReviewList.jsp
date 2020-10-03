<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="review.ReviewDTO"%>
<%@page import="review.ReviewDAO"%>

<%
   int pageSize = 5;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

int currentPage = Integer.parseInt(pageNum); //head.jsp에 pageNum있음
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;
int count = 0;
int number = 0;
ArrayList articleList = null;
ReviewDAO dbPro = new ReviewDAO();
count = dbPro.getReviewCount("3");
if (count > 0) {
   articleList = dbPro.getReviews("3");
}
number = count - (currentPage - 1) * pageSize;
%>
<html>
<html>
 <head>


 </head>
 <style>
 h3 {
 align-content: center;
  }
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
    margin-bottom: 185px;
}

 </style>

<body>
   <p class="w3-left" style="padding-left: 30px;"></p>
   <div style="text-align: center">
      <h1>후기</h1>

      <span class="w3-center w3-middle"> <b>♥쌍용리조트 고객님들의 소중한 후기입니다♥
      </b></span>
   </div>

   <%
      if (count == 0) {
   %>
       <table class="table table-striped" align="center">
   <tr>
      </tr>
      <hr width="50%" align="center"/>
       <h3 align="center">후기가 없습니다 .</h3>
       <hr width="50%" align="center"/>
       </table>
   <%
      } else {
   %>
     <table class="table table-striped" align="center">
    
       <tr class="w3-grey">
          <tr>
         <th >작성자</th>
         <th >별점</th>
         <th >제목</th>
         <th >작성일</th></tr> 
      <%
         for (int i = 0; i < articleList.size(); i++) {
         ReviewDTO article = (ReviewDTO) articleList.get(i);
      %>
     
      <tr height="30">
         <td align="center" width="100"><%=article.getName()%></td>
         <td align="center" width="100"><%=article.getRank_point()%></td>
         <td align="left" width="100">
         <a href="ReviewContent.jsp?num=<%=article.getNum()%>"><%=article.getTitle()%>
         </a></td>
         <td align="center" width="150"><%=sdf.format(article.getReg_date())%></td>

      </tr>
      <%
         }
      %>
   </table>
   <%
      }
   %><br>
   <br>

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
      %><a href="Reviewlist.jsp?pageNum=<%=startPage - bottomLine%>">[이전]</a>
      <%
         }
      %>
      <%
         for (int i = startPage; i <= endPage; i++) {
      %>
      <a href="Reviewlist.jsp?pageNum=<%=i%>"> <%
    if (i != currentPage)
    out.print("[" + i + "]");
 else
    out.print("<font color='red'>[" + i + "]</font>");
 %></a>
      <%
         }
      if (endPage < pageCount) {
      %>
      <a href="Reviewlist.jsp?pageNum=<%=startPage + bottomLine%>">[다음]</a>
      <%
         }
      }
      %>
   </div>
</body>
</html>