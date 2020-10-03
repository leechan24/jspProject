<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<title>Example</title>
<style>

service .our-services {
   width:100%
    text-align: center;   
    margin: 0 auto;
}
service .our-services::after {
    content: "";
    display: block;
    clear: both;
}
service .our-services div {
    float: left;
    width: calc(50% - 40px);
    padding : 25px 0px 25px 0px;
    box-sizing: border-box;
    margin: 0 20px;  
}

service .our-services div.img-wrap {width:80%; max-width:1000px; margin: 0 auto; float:none;}

service .our-services h1 {
    margin: 0;
    padding : 20px 0px 5px 0px;
    font-weight: normal;
}
service .our-services h3 {
   font-family: 'Nanum Gothic', sans-serif; 
    font-size: 0.95em;
    margin: 0;
    text-align : left;
    padding-left:10px;
    padding-top: 10px;
}
service .our-services h6 {
    margin: 0;
    padding : 5px 0px 20px 0px;
    font-weight: normal;
}
service .our-services p {
   font-family: 'Nanum Gothic', sans-serif; 
   font-size: 0.7em;
   text-align: left;
    /* font-style: italic; */
    padding-left: 10px;
    
}

service .our-services img{
   margin-bottom: 8px;
   width: 100%;
   height: 280px;
   object-fit:cover;
}



/* service ,our-services img{
   text-align: left;
} */

</style>
</head>
<body>
<service>
<section class="our-services">
    <h1 align="center"><strong>OUR SERVICES</strong></h1>
    <h6 align="center">활력 있는 운동시설부터 스파와 고급 라운지까지, 다양한 최상의 시설을 경험해 보세요.</h6>
    <hr size = "3" width="1000px"> 
    <div class="img-wrap">
       <div>
          <img src='/JSP_Project/img/fitness.jpg'><br/>
           <h3>피트니스 센터</h3>
           <p>활력있는 생활을 추구하는 당신을 위한 맞춤공간 &nbsp;&nbsp;| &nbsp;&nbsp;위치 : 4F</p> 
       </div>
       <div>
            <img src='/JSP_Project/img/pool.jpg'><br/>
           <h3>호텔 수영장</h3>
           <p>자동 여과 및 수질관리 시스템으로 제공하는 최고의 경험  &nbsp;&nbsp;| &nbsp;&nbsp;위치 : 4F</p>
       </div>
       <div>
          <img src='/JSP_Project/img/spa.jpg'><br/>
           <h3>오리엔틱 스파</h3>
           <p>바쁜 도시의 일상에서 벗어난 편안한 휴식 &nbsp;&nbsp;| &nbsp;&nbsp;위치 : 7F</p>
       </div>
       <div>
          <img src='/JSP_Project/img/lounge.jpg'><br/>
         <h3>르 살롱</h3>
           <p>환상적인 야경을 자랑하는 투숙객 전문 라운지 &nbsp;&nbsp;| &nbsp;&nbsp;위치 : 1F</p>
       </div>
       <div>
          <img src='/JSP_Project/img/wifi.jpg'><br/>
           <h3>무료 와이파이</h3>
           <p>쌍용 리조트는 건물 어느곳에서든 끊김 없는 데이터 서비스를 제공합니다.</p>
       </div>    
       <div>
             <img src='/JSP_Project/img/room-service.jpg'><br/>
           <h3>In-Room 다이닝 서비스</h3>
           <p>추가비용 없이 일품요리를 객실 내에서 즐겨보세요. <em style="font-size: 0.7em;">(문의 02-3482-4632)</em></p>
       </div>
    </div>
</section>
</service>
</body>
</html>