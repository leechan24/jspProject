<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="http://www.w3ii.com/lib/w3.css">

<style>
html , body {
font-family: fantasy;
}
</style>
<script>
function setCookie( name, value, expiredays ) { 
   
   var todayDate = new Date();
   todayDate.setDate( todayDate.getDate() + expiredays ); 
   document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
   } 
   function closeWin(){
      setCookie("closepop","closepop",1); window.close(); }  //하루
   


</script>

<body>
<h1><font color="purple">NOTICE</font></h1><br/>

<h3><font color="black">쌍용 리조트는 고객님과 구성원들의 건강과 안전을 최우선으로 생각하고 있습니다.
현재 코로나19 상황을 고려해 야외수영장을 8월 28일까지 휴장, 조식뷔페는 9월 중 영업을 재개합니다.
전 객실 일 2회 방역 및 소독을 진행하고있습니다.
질병관리본부와 서울시청이 지정한 방역 수칙에 대한 쌍용 리조트의 자세한 준수사항은 공지사항을 참조하여 주시길 바랍니다.</font></h3>

<input type="checkbox" name="Notice" onClick="closeWin()"> <font style="font-size:8pt">
오늘 하루 동안 열지 않음</font>
</body>