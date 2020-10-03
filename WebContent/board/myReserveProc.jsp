<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="roomdao" class="room.RoomDAO" />
<jsp:useBean id="paymentdao" class="payment.PaymentDAO" />
<jsp:useBean id="reservationdao" class="reservation.ReservationDAO" />

<%
	String id = (String) session.getAttribute("idKey");
	int room_no = Integer.parseInt(request.getParameter("room_no"));
	boolean isRoom =  roomdao.cancleRoom(room_no);
	boolean isReservation = reservationdao.deleteReservation(id, room_no);
	boolean isPayment =  paymentdao.deletePayment(id, room_no);
	
	String msg = "예약취소를 실패 하였습니다.";
	String location = "myReserve.jsp";
	if (isReservation && isRoom && isPayment) {
		msg = "예약을 취소했습니다.";
		location = "index.jsp";
	}
%>
<script>
alert("<%=msg%>");
location.href="<%=location%>";
</script>