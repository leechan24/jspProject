<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Example</title>
<style>
index body {
   font: 15px '맑은 고딕', sans-serif;
   margin: 0;
}

index h1, section {
   text-align: center;
}

index h1 {
   margin-top: 60px;
}

index section p {
   margin-bottom: 60px;
   font-style: italic;
}

index figure img {
   margin-bottom: 30px;
}
</style>
<script lang="javascript">
function getCookie( cookieName ) { 
   var search = cookieName + "=";
   var cookie = document.cookie;
   /* 현재 쿠키가 존재할 경우 */ 
   if( cookie.length > 0 ) { 
      /* 해당 쿠키명이 존재하는지 검색한 후 존재하면 위치를 리턴. */ 
      startIndex = cookie.indexOf( cookieName ); 
      /* 만약 존재한다면 */ if( startIndex != -1 ) {
         /* 값을 얻어내기 위해 시작 인덱스 조절 */ 
         startIndex += cookieName.length;
         /* 값을 얻어내기 위해 종료 인덱스 추출 */
         endIndex = cookie.indexOf( ";", startIndex );
         /* 만약 종료 인덱스를 못찾게 되면 쿠키 전체길이로 설정 */ 
         if( endIndex == -1) endIndex = cookie.length;
         /* 쿠키값을 추출하여 리턴 */
         return unescape( cookie.substring( startIndex + 1, endIndex ) );
         } else { /* 쿠키 내에 해당 쿠키가 존재하지 않을 경우 */ return false; } }
       else { /* 쿠키 자체가 없을 경우 */ return false; } } 
       if( !getCookie("closepop") ){
          window.open('../nohead/popup.jsp',"타이틀","left=40,top=40,width=405,height=402,resizable=no, scrollbar=no, status=no,menubar=no,toolbar=no,location=no"); }

</script>
</head>
   <index>
   <div align="center">
      <img alt="" src="/JSP_Project/img/logo.jpg" width=500px; height=120px;>
   </div>
   <section>
      <p>&dash; Bad &amp; Breakfast &dash;</p>
      <figure>
         <img src='/JSP_Project/img/index.jpg' width=976px; height=626px;
            alt="메인사진">
      </figure>
   </section>
   </index>
</body>
</html>