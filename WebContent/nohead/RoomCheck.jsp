<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="room.RoomDAO"%>
<%@ page import="room.RoomDTO"%>
<jsp:useBean id="roomMgr" class="room.RoomDAO" />
<script>
		// 3) --마지막으로 볼 것--
		function roomcheckok(values, totalPay, room_Check, customer_count, UserCheckIn, UserCheckOut) {	// 아래에서 '닫기'버튼 클릭 시 room_no가 있는 values를 reservation1.jsp로 돌려보냄
			opener.document.reggForm.Room_No.value = values;	
			// 정확한 위치는 form name이 reggForm이고, input name이 Room_No인 아랫부분			
			opener.document.reggForm.totalPay.value = totalPay;			
			opener.document.reggForm.room_Check.value = room_Check;			
			opener.document.reggForm.customer_count.value = customer_count;		

			    var sdd = UserCheckIn;
			    var edd = UserCheckOut;
			    var ar1 = sdd.split('-');	// 체크인날짜 split
			    var ar2 = edd.split('-');	// 체크아웃날짜 split
			    var da1 = new Date(ar1[0], ar1[1], ar1[2]);	// 체크인 split한거 하나씩 넣기
			    var da2 = new Date(ar2[0], ar2[1], ar2[2]);	// 체크아웃 split한거 하나씩 넣기
			    var dif = da2 - da1;	// 이러면 총 머무르는 날이 나오겄네
			    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
			    var cMonth = cDay * 30;// 월 만듬
			    var cYear = cMonth * 12; // 년 만듬
				if(sdd && edd){
					opener.document.reggForm.days.value = parseInt(dif/cDay);
				}
  
			self.close();		
			
		}
		
</script>
<%
	// 1)
request.setCharacterEncoding("UTF-8");
String room_Check = request.getParameter("room_Check"); // Reseravation1에서 넘어온 선택한 객실 수
int customer_count = Integer.parseInt(request.getParameter("customer_count")); // Reseravation1에서 넘어온 손님수
int Room_Fee = Integer.parseInt(request.getParameter("Room_Fee"));
String Room_Name = request.getParameter("Room_Name"); // Reseravation1에서 넘어온 room_name

String UserCheckIn = request.getParameter("UserCheckIn");
String UserCheckOut = request.getParameter("UserCheckOut");

ArrayList<Integer> alist = roomMgr.getReservOk(Room_Name); // RoomDAO에서 넘어온 메소드, 예약가능한 Room_No 저장용

int customer_can0 = 0;
if (Room_Name.equals("Deluxe")) { // 한 객실당 수용가능한 손님 수
	customer_can0 = 4;
} else {
	customer_can0 = 2;
}

int customer_can = customer_can0 * Integer.parseInt(room_Check);

int totalPay = Integer.parseInt(room_Check) * Room_Fee; // 총 예약금액

String msg = "";
%>
<%
	// 2)
String values = "";
if (alist.size() >= Integer.parseInt(room_Check) && customer_can >= customer_count) {
	// alist의 size가  내가 선택한 room_Check보다 클때만 ↓ + customer_can의 수가 내가 선택한 customer_count보다 크거나 같을때만
	msg = "예약 가능합니다.";
	for (int i = 0; i < alist.size(); i++) { //  room_no가 있는 alist를 각각의 string(values)로 쪼갬
		values += alist.get(i);
		values += ",";
	}
%>
<script>			
	alert("<%=msg%>");
</script>
<a href="#"
	onclick="roomcheckok('<%=values%>', '<%=totalPay%>', '<%=room_Check%>', '<%=customer_count%>', '<%=UserCheckIn%>', '<%=UserCheckOut%>')">
	닫기 </a>
<!-- 닫기버튼을 누름과 동시에 맨 위의 roomcheckok메소드 실행   -->
<%
	} else {
	msg = "예약이 불가능합니다.";
%>
<script>
alert("<%=msg%>
	");
<%}%>
	
</script>
