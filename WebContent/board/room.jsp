<% 
	request.setCharacterEncoding("UTF-8");  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="review.ReviewDAO" %>   
<%@ page import="review.ReviewDTO" %>
<jsp:useBean id="reviewMgr" class="review.ReviewDAO"/>
<%
	String standardscore = reviewMgr.showRankRoom("Standard");
	String superiorscore = reviewMgr.showRankRoom("Superior");
	String deluxescore = reviewMgr.showRankRoom("Deluxe");
%>
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
<title>Room Information</title>
<style>
room h1 {
	font: normal normal normal 25px/1.4em brandon-grot-w01-light, sans-serif;
}

room body {
	font: 12px "맑은 고딕", "Malgun Gothic", sans-serif;
	line-height: 1.5;
}

room .room-kind, h1, .reservation {
	width: 750px;	/* 원래 700 */
	box-sizing: border-box;
	border-bottom: 1px solid #ccc;
	margin: 0 auto;
	padding: 25px 0;
}

room .room-kind:after {
	content: '';
	display: block;
	clear: both;
}

room .room-kind:first-child {
	border-top: 1px solid #ccc;
}

room .room-kind div {
	float: left;
	box-sizing: border-box;
}

room .room-kind div:first-child {
	width: 540px;
}

room .room-kind div:last-child {
	width: 200px;
	text-align: center;
}

room .room-kind img {
	float: left;
	margin-right: 15px;
}

room .room-title {
	font-size: 2em;
	font-weight: bold;
	margin: 0;
}

room .room-kind ul {
	list-style-type: none;
}

room .room-price {
	font-size: 2.5em;
}

room .room-kind a {
	width: 90px;
	height: 24px;
	display: inline-block;
	line-height: 24px; /*밑에 글자와의 간격 */
	background-color: #222;
	color: white;
	text-decoration: none;
}

room .room-kind a:hover { /*버튼 가져다대면 빨간색으로 */
	background-color: red;
}

room #selectdate {
	background-color: #222;
	color: white;
}
</style>

</head>
<body>
<room>
	<h1 align="center">ROOM Infomation</h1>
	<br />
	<br />
	<div class="room-kind">
		<div>
			<img src='/JSP_Project/img/Room/11.jpg' width=260px; height=230px;
				alt="사진1">
			<p class="room-title">스탠다드 룸</p>
			<p>스탠다드  룸은 최고의 야경을 자랑합니다.</p>
			<ul>
				<li>&bull; 객실 크기: 260 ft<sup>2</sup></li>
				<li>&bull; 침대: 더블베드 1개</li>
				<li>&bull; 평균점수: <%=standardscore %></li>
			</ul>
			 <i class="material-icons">computer</i> &nbsp; <i
				class="material-icons">wifi</i> &nbsp; <i class="material-icons">smoke_free</i>
		</div>
		<div>
			<p>
				최저<br> <span class="room-price">&dollar;150</span>
			</p>
			<a href="room1.jsp">자세히 보기</a>
		</div>
	</div>
	<div class="room-kind">
		<div>
			<img src='/JSP_Project/img/Room/22.jpg' width=260px; height=230px;
				alt="사진2">
			<p class="room-title">슈페리어 룸</p>
			<p>슈페리어 룸은 아늑함과 편리함을 제공합니다.</p>
			<ul>
				<li>&bull; 객실 크기: 330 ft<sup>2</sup></li>
				<li>&bull; 침대: 더블베드 1개</li>
				<li>&bull; 평균점수: <%=superiorscore %></li>
			</ul>
			 <i class="material-icons">computer</i> &nbsp; <i
				class="material-icons">wifi</i> &nbsp; <i class="material-icons">smoke_free</i>
			&nbsp; <i class="material-icons">fitness_center</i>
		</div>
		<div>
			<p>
				최저<br> <span class="room-price">&dollar;250</span>
			</p>
			<a href="room2.jsp">자세히 보기</a>
		</div>
	</div>
	<div class="room-kind">
		<div>
			<img src='/JSP_Project/img/Room/33.jpg' width=260px; height=230px;
				alt="사진3">
			<p class="room-title">디럭스 룸</p>
			<p>디럭스 룸은 우아하고 넓은 공간으로 편안함을 제공합니다.</p>
			<ul>
				<li>&bull; 객실 크기: 550 ft<sup>2</sup></li>
				<li>&bull; 침대: 더블베드 2개</li>
				<li>&bull; 평균점수: <%=deluxescore %></li>
			</ul>
			    <i class="material-icons">computer</i> &nbsp; 
				 <i class="material-icons">wifi</i> &nbsp; 
				 <i class="material-icons">smoke_free</i> &nbsp;
				 <i class="material-icons">restaurant</i> &nbsp; 
				 <i class="material-icons">fitness_center</i>
		</div>
		<div>
			<p>
				최저<br> <span class="room-price">&dollar;350</span>
			</p>
			<a href="room3.jsp">자세히 보기</a>
		</div>
	</div>
	<div class="room-kind">
		<div>
			<img src='/JSP_Project/img/Room/4.jpg' width=260px; height=230px;
				alt="사진2">
			<p class="room-title">로열 스위트 룸</p>
			<p>특별한 고객님들을 위해 마련된 품격있는<br>객실입니다.</p>
			<ul>
				<li>&bull; 객실 크기: 850 ft<sup>2</sup></li>
				<li>&bull; 침대: 킹베드 1개 / 더블베드 1개</li>
			</ul>
			     <i class="material-icons">computer</i> &nbsp; 
				 <i class="material-icons">wifi</i> &nbsp;
				 <i class="material-icons">smoking_rooms</i> &nbsp; 
				 <i class="material-icons">room_service</i>&nbsp; 
				 <i class="material-icons">restaurant</i> &nbsp; 
				 <i class="material-icons">fitness_center</i>
		</div>
		<div>
			<p>
				최저<br> <span class="room-price">&dollar;500</span>
			</p>
			<a href="room4.jsp">자세히 보기</a>
		</div>
	</div>
	</room>
</body>
</html>