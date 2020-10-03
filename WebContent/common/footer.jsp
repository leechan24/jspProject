<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.container {                 /*문의하는 내용들 속성  */
  margin: auto;
  max-width: 1100px;
  overflow: auto;
  padding: 0 15px;

}
.info-color {      /* 호텔정보 백그라운드와 컬러 지정  */
  background: #333;             /*다크회색  */
  color: #fff;                  /*회색 */
}
#contact-Footer {          /*저작권  표시*/
  text-align: center;
  background: #444;
  color: #fff;
  padding: 20px;
}
.box {   
  width:33.3%;
  box-sizing: border-box;          /* 밑에 주소, 번호, 이메일  */
  float: left;
  padding: 20px;                        /* 위에 애들 padding  */
  text-align:center;
}

.box i {                      /* 아이콘들  */
  margin-bottom: 10px;
}
</style>
<body>
<section id="contact-Info" class="info-color">  <!-- 호텔정보를 주제로 section   -->
    <div class="container">                    <!--밑에 아이콘들과  호텔 지역 , 전화번호, 이메일정보를 나눈것   -->
        <div class="box">
            <i class="fas fa-hotel fa-3x"></i>  <!-- 아이콘1  -->
            <h3>Location</h3>
            <p>SSANGYONG HOTEL</p>
          </div>
          <div class="box">
              <i class="fas fa-phone fa-3x"></i>   <!--아이콘2  -->
              <h3>Phone Number</h3>
              <p>010-4503-1808</p>
          </div>
          <div class="box">
              <i class="fas fa-envelope fa-3x"></i> <!--아이콘3 -->
              <h3>Email Address</h3>
              <p>SSANGYONG@naver.com</p>
          </div>
    </div>
  </section>

  <footer id="contact-Footer">               <!--저작권 표시  -->
    <p>Hotel SSANGYONG &copy; 2020, All RIghts Reserved</p>
  </footer>
</body>
</html>