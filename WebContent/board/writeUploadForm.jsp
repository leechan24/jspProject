<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  
  <!--첫번째줄은 아이콘 아이콘 불러온것  -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
 <link rel="stylesheet" href="css/style.css">

  <title>.</title>
  <script type="text/javascript" src="../js/wuFrm.js"></script>
  
</head>

<style>

upload html,body {
  font: 12px "맑은 고딕","Malgun Gothic",sans-serif;
  line-height: 1.7em; 
}


upload h1 {                   /*  h1 : 문의 게시판이라고 크게 적으 놓은거    */
  padding-bottom: 20px;
  margin-top: 40px;
}


.container {                 /*문의하는 내용들 속성  */
  margin: auto;
  max-width: 1100px;
  overflow: auto;
  padding: 0 20px;
  
}



.btn {                              /*문의등록버튼  속성   */
  display: inline-block;
  font-size: 18px;
  color: #fff;
  background: #333;
  padding: 13px 20px;
  border: none;
  cursor: pointer;
}


.contactHead {            /*크게 문의게시판이라고 적혀있는거*/
  font-size: 40px;
  color: gray;
}


.box i {                      /* 아이콘들  */
  margin-bottom: 10px;
}



/* Contact Form */
#contact-Form .form-Group {  /*  form-group -> 이름, 이메일 , 문의내용 등을 div로 묵은것  여백 주기 */
  margin-bottom: 20px;
}

#contact-Form label {        /* 이름, 이메일 ,문의내용  등의 이름을 label로*/
  display: block;
  margin-bottom: 5px;
}

#contact-Form input,         /* 입력창들 기본 속성 */
#contact-Form textarea {
  width: 60%;
  padding: 10px;
  border: 1px #ddd solid;
}

#contact-Form textarea {        /* 문의 내용의 height 지정  */
  height: 200px;
  resize : vertical;;              /* 높이 조절만 가능하게  */
}

#contact-Form input:focus,    /* 입력창들을 클릭했을때   */
#contact-Form textarea:focus {
  outline: none;
  border-color: #f7c08a;
}

</style>


<upload>
<body>
<form name="wuFrm" method="post" action="writeUploadProc.jsp"> 
  <section id="contact-Form" class="py-3">          <!--문의하는 내용주제로 section  -->
    <div class="container">
      <h1 class="contactHead"><span>문의게시판</span> </h1>  
      <h2><p>작성자 정보</p></h2>        
        <div class="form-Group">
          <label for="name">이름</label>
          <input type="text" name="name">
        </div>

        <div class="form-Group">
          <label for="email">이메일</label>
          <input type="email" name="email" id="email">
        </div>
        <div class="form-Group">
          <label for="tel">연락처</label>
          <input type="text" name="tel" id="tel">
        </div>
        <h2><p>문의 사항</p></h2>
        <div class="form-Group">
          <label for="category">유형</label>
           <select name = "category">
           <option value="1">예약 문의 </option>
           <option value="2">시설 문의 </option>
           <option value="3">회원 문의 </option>
           <option value="4">개선 문의 </option>
           <option value="5">기타 </option>
           </select>
        </div>
        
        <div class="form-Group">
          <label for="title">제목</label>
          <input type="text" name="title" id="title">
        </div>
        <div class="form-Group">
          <label for="content">문의내용</label>
          <textarea name="content" id="content"></textarea>      <!-- textarea 를 써서  많은 양의 문의 내용을 입력할수 있게 ->   -->
        </div>
                       비밀번호<br><input type="password" name="password" id="password"><br><br>
        <button type="submit" class="btn" onClick="inputCheck()">문의하기</button>
    </div>
  </section>
</form>
  
</body></upload>
</html>

