
<%
	request.getParameter("UTF-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="roomdao" class="room.RoomDAO" />
<jsp:useBean id="paymentdao" class="payment.PaymentDAO" />
<jsp:useBean id="reservationdao" class="reservation.ReservationDAO" />

<%
	String UserCheckIn = request.getParameter("UserCheckIn");
String UserCheckOut = request.getParameter("UserCheckOut");
int room_Check = Integer.parseInt(request.getParameter("room_Check")); // 내가 선택한 객실수 insert
int customer_count = Integer.parseInt(request.getParameter("customer_count")); //인원수
int totalPay = Integer.parseInt(request.getParameter("totalPay")); //payment 인서트
String id = (String) session.getAttribute("idKey");
String msg = "예약에 실패 하였습니다.";

String[] room_No = request.getParameterValues("RoomOk"); //룸 넘버로 룸 예약 을 yes로 바꾼다. 룸넘버들
int numOfCheckRoom = room_No.length;
boolean isReservation = false;
boolean isPayment = false;
boolean isRoom = false;

if (room_Check < room_No.length) {
%>
<script>
	   	alert("예약한 방만큼만 객실을 선택하세요!!");
	   	location.href = "index.jsp";
	   </script>
<%
	}


for (String x : room_No) {

	int intx = Integer.parseInt(x);
	
	
	isReservation = reservationdao.insertReservation(UserCheckIn, UserCheckOut, intx, id);

	isRoom = roomdao.updateRoom(intx);

	isPayment = paymentdao.insertPayment(customer_count, totalPay/numOfCheckRoom, id, intx);

}
if (isReservation && isPayment && isRoom) {
	msg = "예약에 성공 하였습니다. 자세한 내역은 마이페이지에서 확인하세요!";
%>
<script>
		alert("<%=msg%>");
		location.href = "index.jsp";
</script>
<%
	} else {
%>
<script>
   alert("<%=msg%>
	");
	location.href = "index.jsp";
</script>
<%
	}
%>