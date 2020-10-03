<%@page import="room.RoomDTO"%>
<%@page import="payment.PaymentDTO"%>
<%@page import="reservation.ReservationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="member.MemberDTO" />
<jsp:useBean id="memberdao" class="member.MemberDAO" />
<jsp:useBean id="paymentdao" class="payment.PaymentDAO" />
<jsp:useBean id="roomdao" class="room.RoomDAO" />
<jsp:useBean id="reservationdao" class="reservation.ReservationDAO" />

<%
	String id = (String) session.getAttribute("idKey");
member = memberdao.getMember(id);
ArrayList<ReservationDTO> myReservationList = reservationdao.getReservation(id);
ArrayList<PaymentDTO> myPaymentList = paymentdao.getPayment(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>예약정보</title>
<style>
.reservation {
	width: 800px;
	margin: 0 auto;
	font-size: 14px;
	margin-bottom: 100px;
}

.reservation h1 {
	text-align: center;
	border-bottom: solid 2px #ddd;
	padding-bottom: 5px;
	margin-top: 50px;
}

.reservation hr {
	width: 25px;
	border: solid 1px #040404;
	text-align: left;
	margin-left: 0;
}

.reservation p {
	margin-top: 5px;
	font-weight: bold;
}

.reservation-info ul {
	margin: 0;
	padding: 20px;
	list-style: none;
	border: solid 1px #ddd;
}

.reservation-info li {
	border-bottom: solid 1px #ddd;
	padding: 8px;
}

.reservation-info li:last-child {
	border-bottom: none;
}

.reservation-info span {
	display: inline-block;
	width: 100px;
	font-weight: bold;
}

.reservation-info, .reservation-date, .reservation-list {
	margin-bottom: 20px;
}

.reservation-date div {
	border: solid 1px #ddd;
	padding: 20px;
}

.reservation-list table {
	width: 100%;
	border-collapse: collapse;
	border-top: solid 1px #898989;
}

.reservation-list th {
	background-color: #eee;
}

.reservation-list th, .reservation-list td {
	padding: 10px;
	text-align: center;
	border-bottom: solid 1px #ddd;
	border-right: solid 1px #ddd;
}

.reservation-list td:last-child {
	border-right: none;
}

.btn button {
	cursor: pointer;
}

.btn::after {
	content: "";
	display: block;
	clear: both;
}

.btn input:last-child {
	float: right;
	padding: 8px 12px;
	background-color: #c00;
	color: #fff;
	border: none;
}
</style>
</head>
<body>
	<section class="reservation">
		<h1>내 예약 확인</h1>
		<%
			for (int i = 0; i < myPaymentList.size(); i++) {
			RoomDTO tmpRoom = new RoomDTO();
			tmpRoom = roomdao.getRoom(myPaymentList.get(i).getRoom_no());
		%>
		<div class="reservation-info">
			<hr>

			<p>예약내역</p>

			<form action="myReserveProc.jsp" method="post">
				<input type="hidden" name="room_no" value="<%=myPaymentList.get(i).getRoom_no()%>">
				<ul>

					<li><span>예약 방</span><%=tmpRoom.getRoom_name()%></li>
					<li><span>방 번호</span><%=myPaymentList.get(i).getRoom_no()%></li>
					<li><span>예약일</span><%=myReservationList.get(i).getChk_in()%>
						&nbsp; - &nbsp;<%=myReservationList.get(i).getChk_out()%></li>
				</ul>
		</div>
		<div class="reservation-date">
			<hr>
			<p>결제금액</p>
			<div><%=myPaymentList.get(i).getTotal_pay()%></div>
		</div>
		<div class="reservation-list">
			<hr>
			<p>예약자 정보</p>
			<table>
				<tr>
					<th>아이디</th>
					<td colspan="3"><%=myPaymentList.get(i).getId()%></td>
				</tr>
				<tr>
					<th width="15%">이름</th>
					<td width="35%"><%=member.getName()%></td>
					<th width="15%">연락처</th>
					<td width="35%"><%=member.getTel()%></td>
				</tr>
			</table>
		</div>
		<div class="btn">
			<input type="submit" value="예약취소">
		</div>
		</form>
		<%
			}
		%>
		   <td style="border:white; text-align:right;"><a href="ReviewWriteUploadForm.jsp" >글쓰기</a></td>
	</section>
</body>
</html>