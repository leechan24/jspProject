<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<!--첫번째줄은 아이콘 아이콘 불러온것  -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">

<title>.</title>
<script type="text/javascript" src="../js/review.js"></script>
 <%  
 String id = (String) session.getAttribute("idKey");
 if(id == null){
%>
<script>
	alert("로그인 후 이용해주시기 바랍니다.")
	location.href = "login.jsp";
</script>
<%   }%>
</head>

<style>
upload html, body {
	font: 12px "맑은 고딕", "Malgun Gothic", sans-serif;
	line-height: 1.7em;
}

upload h1 { /*  h1 : 문의 게시판이라고 크게 적으 놓은거    */
	padding-bottom: 20px;
	margin-top: 40px;
}

.container { /*문의하는 내용들 속성  */
	margin: auto;
	max-width: 1000px;
	overflow: auto;
	padding: 0 20px;
}

.btn { /*문의등록버튼  속성   */
	display: inline-block;
	font-size: 18px;
	color: #fff;
	background: #333;
	padding: 13px 20px;
	border: none;
	cursor: pointer;
	margin-left: 680px;
    margin-bottom: 50px;
}
p {
    text-align: center;
}

.contactHead {  /*후기게시판이라 적혀있는거  */
    font-size: 40px;
    color: gray;
    text-align: center;
}

.box i { /* 아이콘들  */
	margin-bottom: 10px;
}

.room {
    width: 100%;
    margin-left: 310px;
}

/* Contact Form */
#contact-Form .form-Group {
    margin-bottom: 20px;
    margin-left: 310px;
}

#contact-Form label { /* 이름, 이메일 ,문의내용  등의 이름을 label로*/
	display: block;
	margin-bottom: 5px;
}

#contact-Form input, /* 입력창들 기본 속성 */ #contact-Form textarea {
	width: 60%;
	padding: 10px;
	border: 1px #ddd solid;
}

#contact-Form textarea { /* 문의 내용의 height 지정  */
	height: 200px;
	resize: vertical;; /* 높이 조절만 가능하게  */
}

#contact-Form input:focus, /* 입력창들을 클릭했을때   */ #contact-Form textarea:focus
	{
	outline: none;
	border-color: #f7c08a;
}
#contact-Form .form-pw {
    margin-left: 310px;
}
</style>


<upload>
<body>
	<form name="ReviewFrm" method="post" action="ReviewWriteUploadProc.jsp">
		<section id="contact-Form" class="py-3">
			<!--문의하는 내용주제로 section  -->
			<div class="container">
				<h1 class="contactHead">
					<span>후기게시판</span>
				</h1>
				<h2>
					<p>♥고객님의 소중한 후기는 저희에게 힘이됩니다♥</p>
				</h2>
				<div class="form-Group">
					<label for="name">이름</label> <input type="text" name="name"
						id="name">
				</div>

				<div class="form-Group">
					<label for="title">제목</label> <input type="text" name="title"
						id="title">
				</div>
				<div class="room">

					<div class="roomstar">
						방종류 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;별점 <br /> <select
							name="room_name">
							<option value="1">스탠다드 &nbsp;&nbsp;&nbsp;</option>
							<option value="2">슈페리얼</option>
							<option value="3">디럭스</option>
						</select> <select name="rank_point">
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5">★★★★★</option>
						</select>
					</div>

				</div>
				<br>

				<div class="form-Group">
					<label for="content">후기</label>
					<textarea name="content" id="content"></textarea>
					<!-- textarea 를 써서  많은 양의 문의 내용을 입력할수 있게 ->   -->
				</div>
				<div class="form-pw">
				비밀번호<br>
				<input type="password" name="password" id="password"></div><br>
				<br>
				<button type="submit" class="btn" onClick="inputCheck()">후기등록</button>
			</div>
		</section>
	</form>

</body>
</upload>
</html>