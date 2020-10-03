
<%
   request.setCharacterEncoding("UTF-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   String board = "";
   //pageNum이 넘어와야 pageNum이 바뀜
   if (request.getParameter("pageNum") != null) {
      session.setAttribute("pageNum", request.getParameter("pageNum"));
   }
   //boardid가 넘어와야 세션이 변경됨: 현재 게시판 분류에 따른 입력,수정을 적용
   if (request.getParameter("boardid") != null) {
      session.setAttribute("boardid", request.getParameter("boardid"));
      session.setAttribute("pageNum", "1"); //boardid가 바뀔때 pageNum을 1로 변경
   }

   String pageNum = (String) session.getAttribute("pageNum");
   if (pageNum == null)
      pageNum = "1";
   String boardid = (String) session.getAttribute("boardid");
   if (boardid == null)
      boardid = "1";

   //board : 게시판 이름 프린트
   if (boardid.equals("1"))
      board = "공지사항";
   else if (boardid.equals("2"))
      board = "자유게시판";
   else if (boardid.equals("3"))
      board = "Q&A";
   else
      board = "회원입력";
%>
<html lang="ko">
<head>
<title>호텔 예약 서비스</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
   href="https://fonts.googleapis.com/css2?family=Open+Sans+Condensed:ital,wght@1,300&display=swap"
   rel="stylesheet">
<!--폰트  -->
<link rel="stylesheet"
   href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!--아이콘-->
</head>
<style>
header {
   background-color: black;
}

header ul {
   display: flex;
   justify-content: center;
   flex-wrap: wrap;
   align-items: baseline;
   list-style: none;
   margin: 0;
   padding: 0;
}

header a {
   color: white;
   text-decoration: none;
   display: block;
   line-height: 60px;
   padding: 0 25px;
}




.dropdown {
    position: relative;
}
.dropdown-menu {
    color: white;
    padding: 16px;
    font-size: 16px;
    cursor: pointer;
}
.dropdown-content {
    position: absolute;
    background-color: #f9f9f9;
    min-width: 130px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
    display: block;
    text-decoration: none;
    color: black;
    padding: 0px 10px;
    padding-left: 15px;
    
}   
.dropdown-content {
    position: absolute;
    color: white;
    margin-top: 2px;
    background-color: #aba7a7;
    min-width: 50px;
    width : 100px;
    display:none;
    opacity: 0.4;
    
}
.dropdown:hover .dropdown-content {
    display: block;
}
</style>

<script>
   window.onload = function() {
      var atag = document.getElementsByTagName("a");
      var url = document.location.href.split("/");

      if (url[url.length - 2] == "member") {
         atag[4].style.color = "grey";
      } else if (url[url.length - 2] == "chartjsPro") {
         atag[5].className += " w3-red";
      } else if (url[url.length - 2] == "inquire") {
         atag[6].className += " w3-red";
      } else {
         atag[
<%=boardid%>
   ].className += " w3-red";
      }
   }
</script>
<body>
   <header>
      <ul>
         <li><a href="<%=request.getContextPath()%>/board/index.jsp">HOME</a></li>
         <li><a
            href="<%=request.getContextPath()%>/board/room.jsp?boardid=1">ROOMS</a></li>
         <li><a
            href="<%=request.getContextPath()%>/board/service.jsp?boardid=2">SERVICES</a></li>
         <li><a
            href="<%=request.getContextPath()%>/board/list.jsp?boardid=3">CONTACT</a></li>   
            <li><a
            href="<%=request.getContextPath()%>/board/ReviewList.jsp?boardid=2">REVIEW</a></li>   
         <%
            if (session.getAttribute("idKey") == null) {
         %>
         <li><a
            href="<%=request.getContextPath()%>/board/login.jsp?boardid=4">Login</a></li>
         <%
            } else {
         %>
         
        <li class="dropdown">
          <div class="dropdown-menu">MYPAGE</div>
          <div class="dropdown-content">
            <a class="dropdown-item" href="<%=request.getContextPath()%>/board/update.jsp?boardid=5">회원수정</a>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/board/myReserve.jsp?boardid=5">예약정보</a>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/board/ReviewWriteUploadForm.jsp?boardid=5">후기작성</a>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/board/logout.jsp?boardid=5">로그아웃</a>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/board/delete.jsp?boardid=5">회원탈퇴</a>
          </div>
        </li>
      </ul>                        
         <%
            }
         %>
      
   </header>
</body>
</html>