<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans+Condensed:ital,wght@1,300&display=swap"
	rel="stylesheet">
<!--폰트  -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!--아이콘-->
<link type="text/css" rel="stylesheet"
	href="https://ggumimugg.cafe24.com/css/lightslider.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://ggumimugg.cafe24.com/js/lightslider.js"></script>
<script>
	$(document).ready(function() {
		$("#imageGallery").lightSlider({
			item : 1, // 한 번에 표시할 슬라이드 수
			slideMargin : 0, // 각 슬라이드 사이의 간격              
			auto : true, // 자동재생
			pauseOnHover : true, // 마우스를 올리면 자동 재생을 일시 중지
			loop : true, // 마지막 슬라이드일 때 처음으로 돌아가서 반복      
			pause : 3000, // 각 자동 재생 사이의 시간(ms)      
			gallery : true, // 하단에 썸네일 이미지 사용  
			currentPagerPosition : 'left', // 썸네일의 위치 'left', 'middle', 'right'
		/* thumbItem: 10 // 한 번에 표시할 썸네일 수(기본값: 10) */
		});
	});
</script>

<title>Room Information</title>
<style>
room3 h1 {
	font: normal normal normal 25px/1.4em brandon-grot-w01-light, sans-serif;
	padding-top: 15px;
}

room3 body {
	font: 12px "맑은 고딕", "Malgun Gothic", sans-serif;
	line-height: 1.5;
}

.room-kind, room3 h1, .intro, .intro2, .intro3, .intro4 {
	width: 800px;
	box-sizing: border-box;
	border-bottom: 1px solid #ccc;
	margin: 0 auto;
	padding: 25px 0;
}

.room-kind:after {
	content: '';
	display: block;
	clear: both;
}

.room-kind:first-child {
	border-top: 1px solid #ccc;
}

.room-kind div {
	float: left;
	box-sizing: border-box;
}

.room-kind div:last-child {
	text-align: center;
}

.room-kind img {
	float: left;
}

.room-price {
	font-size: 2.5em;
	line-height: 50px;
}

.room-kind a {
	width: 90px;
	height: 24px;
	display: inline-block;
	line-height: 24px; /*밑에 글자와의 간격 */
	color: black;
	text-decoration: none;
}

.room-kind .lSSlideOuter {
	width: 535px;
	margin-right: 15px;
}

.room-kind .form {
	width: 250px;
}

.lSAction a {
	width: 30px;
	height: 30px;
	background-repeat: no-repeat;
}

.lSAction .lSNext {
	background-position: -34px 0;
}

#selectdate {
	width: 120px;
	height: 50px;
	margin-left: 50px;
	background-color: #151616;
	color: white;
}

.form {
	width: 200px;
	height: 388px;
	box-sizing: border-box;
	border: 1px solid gray;
	margin: 0 auto;
	padding: 8px 15px;
}
</style>
</head>
<body>
<room3>
	<h1 align="center">DELUXE ROOM</h1>
	<div class="room-kind">
		<div class="room-kind2">
			<div id="light-Slider">
				<ul id="imageGallery">
					<li data-thumb="/JSP_Project/img/Room/3_01.jpg">
					<img src="/JSP_Project/img/Room/3_01.jpg"></li>
					<li data-thumb="/JSP_Project/img/Room/3_02.jpg">
					<img src="/JSP_Project/img/Room/3_02.jpg"></li>
					<li data-thumb="/JSP_Project/img/Room/3_03.jpg">
					<img src="/JSP_Project/img/Room/3_03.jpg"></li>
				</ul>
			</div>
			<div class="form">
				<form action="Reservation1.jsp" method="POST">
				<input type="hidden" name="Room_Name" value="Deluxe">
				<input type="hidden" name="Room_Fee" value="350">
					<p>
						최저<br>
						<span class="room-price">&dollar;350 <br>
						</span>
					</p>
					1박기준<br> <br> <label for="UserCheckIN">체크인</label>&nbsp;&nbsp;&nbsp;
					<input type="date" id="UserCheckIn" name="UserCheckIn"
						min="2020-08-01" max="2020-12-31" name="date"
						contenteditable="false"> <br /> <br> <label
						for="UserCheckOut">체크아웃</label> <input type="date"
						id="UserCheckOut" name="UserCheckOut" min="2020-08-01"
						max="2020-12-31" name="date" contenteditable="false"> <br>
					<br> <input id="selectdate" value="예약하기" type="submit">
				</form>
			</div>
		</div>
	</div>
	<div class="intro">
		객실 정보 : 최대인원: 2~3명 객실 크기: 550 ft<sup>2</sup><br> 침대 : 더블베드 2개
	</div>
	<div class="intro2">
		50m²의 디럭스 룸은 세련된 감각과 절제된 아름다움을 제공합니다. <br>
		따스한 컬러 톤이 주는 편안함 속에서 최고의 휴식을 경험하세요.
	</div>
	<div class="intro3">
		편의시설 : <i class="material-icons">computer</i> 컴퓨터 &nbsp; 
		<i class="material-icons">wifi</i>무선인터넷&nbsp;
		<i class="material-icons">fitness_center</i>피트니스&nbsp;
		<i class="material-icons">restaurant</i> 전용 라운지 &nbsp; 
		

	</div>
	<div class="intro3">
		이용약관 : <u>이용약관 보기</u>
	</div>
</room3>
</body>
</html>