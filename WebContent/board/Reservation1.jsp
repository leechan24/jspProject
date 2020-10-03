<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="room.RoomDAO"%>
<%@ page import="room.RoomDTO"%>
<jsp:useBean id="roomMgr" class="room.RoomDAO" />
<jsp:useBean id="reservationMgr" class="reservation.ReservationDAO" />

<%
   request.setCharacterEncoding("UTF-8");  
   String UserCheckIn = request.getParameter("UserCheckIn");
   String UserCheckOut = request.getParameter("UserCheckOut");
   String Room_Name = request.getParameter("Room_Name");	// room1~3에서 넘어온 room_name
   String Room_Fee = request.getParameter("Room_Fee");	// room1~3에서 넘어온 Room_Fee
   String id = (String) session.getAttribute("idKey");	
   SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

   Date tmpCheckIn = transFormat.parse(UserCheckIn);
Date tmpCheckOut = transFormat.parse(UserCheckOut);
int compare = tmpCheckOut.compareTo(tmpCheckIn);
   
   reservationMgr.updateReservation();
   if(id == null){
%>
<script>
	alert("로그인 후 이용해주시기 바랍니다.")
	location.href = "login.jsp";
</script>
<%   }
    if(UserCheckIn == ""||UserCheckOut==""){
%>
<script>
	alert("일자를 선턱해 주세요.")
	location.href = 'javascript:history.back();';
</script>
<%   
   }
    if(compare<0){
%>
<script>
	alert("일자를 올바르게 선택해 주세요.")
	location.href = 'javascript:history.back();';
</script>
<%   
   }
%>
<!DOCTYPE html>
<html>
<head>
<style>
Reservation1 h1 {
	font-family: 'Open Sans Condensed', sans-serif;
}

Reservation1 body {
	font: 12px "맑은 고딕", "Malgun Gothic", sans-serif;
	line-height: 1.5;
}

Reservation1 .reservation__fontcolor {
	color: red;
}

Reservation1 .back01 {
	background-color: #BDB8B5;
	height: 800px;
}

Reservation1 .back02 {
	background-color: white;
	width: 850px;
	height: 500px;
	text-align: center;
}

Reservation01 table {
	text-align: center;
}

Reservation01  tr, td {
	background-color: #BDB8B5;
}
</style>
<script>
	var openWin;

	function ReservationCheck() { // nohead/RoomCheck.jsp로 보내기 전, 여기서 data 보내는 처리를 해줘야..
		form = document.regForm;

		url = "/JSP_Project/nohead/RoomCheck.jsp";
		window.open(url, "child", "ReservCheck", "width=300, height=150");

		form.target = "child";
		form.action = url;
		form.submit();
	}
</script>
</head>
<body>
	<Reservation1>
	<div class="back01" align="center">
		<br>
		<br>
		<br>
		<br>
		<div class="back02" align="center">
			<br>
			<br>
			<hr width="75%">
			<br>
			<h3 align="center">
				객실 :
				<%=Room_Name %>
				ROOM
			</h3>
			<h3 align="center">
				<br>
				<hr width="75%">
				<br> 체크인 -
				<%=UserCheckIn %>&nbsp;&nbsp;/&nbsp;&nbsp; 체크아웃 -
				<%=UserCheckOut%>
			</h3>
			<br>
			<hr width="75%">
			<form method="post" name="regForm" target="child">
				<input type="hidden" name="Room_Name" value="<%=Room_Name %>">
				<input type="hidden" name="Room_Fee" value="<%=Room_Fee %>">
				<!-- room_name과 room_pay -->
				<input type="hidden" id="UserCheckIn" name="UserCheckIn"
					value="<%=UserCheckIn%>"> <input type="hidden"
					id="UserCheckOut" name="UserCheckOut" value="<%=UserCheckOut %>">
				<br>
				<br>
				<table border="1" cellpadding="2" cellspacing="2" color="black"
					style="margin-left: auto; margin-right: auto;">
					<tr>
						<td width="30%"><div align="center">
								<strong>객실&인원수<br /> 입력
								</strong>
							</div></td>
						<td width="25%"><Strong>객실 </Strong> <select
							name="room_Check">
								<!-- 예약할 객실 수 -->
								<option value="1">1개</option>
								<option value="2">2개</option>
								<option value="3">3개</option>
						</select></td>
						<td width="25%"><Strong>인원 </Strong> <select
							name="customer_count">
								<option value="1">1명</option>
								<option value="2">2명</option>
								<%if(Room_Name.equals("Deluxe")) {%>
								<option value="3">3명</option>
								<option value="4">4명</option>
								<%} %>
						</select>
					</tr>
					<tr>
					</tr>
					<tr>
						<td colspan="4" align="center">&nbsp; &nbsp;<input
							style="background-color: #FAFAD2" type="submit" value="예약 확인"
							onclick="ReservationCheck()"> <!-- 윗부분 reservationcheck() 실행  -->
							&nbsp;
						</td>
					</tr>
				</table>
			</form>
			<div align="center">
				<form method="post" name="reggForm" action="Reservation2.jsp">
					<table cellpadding="2" cellspacing="2"
						style="margin-left: auto; margin-right: auto;">
						<tr>
							<td colspan="4" align="center">&nbsp; 
							
							<input type="hidden" id="Room_No" name="Room_No" value="-"> 
							<input type="hidden" id="totalPay" name="totalPay" value="-">
							<input type="hidden" id="room_Check" name="room_Check" value="-">
							<input type="hidden" id="UserCheckIn" name="UserCheckIn" value="<%=UserCheckIn%>">
							<input type="hidden" id="UserCheckOut" name="UserCheckOut" value="<%=UserCheckOut %>">
							<input type="hidden" id="customer_count" name="customer_count" value="-"> 
							<input type="hidden" id="days" name="days" value="-"> 
							<input style="background-color: #FAFAD2; text-align: center;"
								type="submit" value="계속 예약하기">&nbsp;&nbsp; <!-- reservation2로 ㄱㄱ -->
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	</Reservation1>
</body>
</html>