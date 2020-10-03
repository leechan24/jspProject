
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%
   request.getParameter("UTF-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberdao" class="member.MemberDAO" />
<jsp:useBean id="member" class="member.MemberDTO" />

<%
   String UserCheckIn = request.getParameter("UserCheckIn");
   String UserCheckOut = request.getParameter("UserCheckOut");
   int room_Check = Integer.parseInt(request.getParameter("room_Check"));
   String customer_count = request.getParameter("customer_count");
   String id = (String) session.getAttribute("idKey");
   String Room_No = request.getParameter("Room_No");
   int totalPay = Integer.parseInt(request.getParameter("totalPay"));
   int days = Integer.parseInt(request.getParameter("days"));
   
   int totalPayPlusDays = totalPay * days;
   

   member = memberdao.getMember(id);
   String[] AllRooms = Room_No.split(",");
	List<String> rooms = Arrays.asList(AllRooms);	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function cardNoCheck(cardNo) {
		var cardnocheck = document.getElementById("cardnocheck"); //span ID로 입력하기.
		if (cardNo.length < 16) {
			cardnocheck.innerHTML = "16자를 정확히 입력하세요";
		} else{ cardnocheck.innerHTML = ""; }
	}
	
	function cardPwCheck(cardPw) {
		var cardpwcheck = document.getElementById("cardpwcheck"); //span ID로 입력하기.
		if (cardPw.length < 4) {
			cardpwcheck.innerHTML = "비밀번호를 정확히 입력하세요";
		}  else{ cardpwcheck.innerHTML = ""; }
	}
	
	function cardDayCheck(cardDay) {
		var carddaycheck = document.getElementById("carddaycheck"); //span ID로 입력하기.
		
		if (cardDay.length < 4) {
			carddaycheck.innerHTML = "카드 유효기간을 정확히 입력하세요";
		} else{ carddaycheck.innerHTML = ""; }
	}

	
	
</script>
<style type="text/css">
Reservation2 .back01 {
	background-color: #BDB8B5;
	height: 800px;
}

Reservation2 .back02 {
	background-color: white;
	width: 850px;
	height: 600px;
	text-align: center;
}

Reservation2 .table {
	width: 35%;
	height: 30%;
	cellpadding: 3;
	cellspacing: 3;
	border-collapse: collapse;
	border: 1px;
}
</style>
</head>
<body>
	<Reservation2><!-- 여기에 로그인한 고객 정보 불러오기~~ -->
	<div class="back01" align="center">
		<br> <br> <br>
		<div class="back02" align="center">
			<br>
			<h3 align="center">투숙고객 정보 확인</h3>
			<hr width="50%">
			<br>
			<form name="imsi" id="imsi" method="post">
				<table>

				</table>
			</form>
			<form method="post" action="Reservation3.jsp">
				<input type="hidden" name="totalPay" value="<%=totalPayPlusDays %>">
				<input type="hidden" name="UserCheckIn" value="<%=UserCheckIn%>"> 
				<input type="hidden" name="UserCheckOut" value="<%=UserCheckOut %>">
				<input type="hidden" name="room_Check" value="<%=room_Check %>">
				<input type="hidden" name="customer_count" value="<%=customer_count%>">
				<table align="center">
					<tr>
						<td align="center">방을 선택하세요!<br></td>
						<td>
							<% for(int i=0; i < rooms.size() ; i++) { %> 
							<input type="checkbox" name="RoomOk" value="<%=rooms.get(i) %>"><%=rooms.get(i) %>
							<%} %>						
						</td>
					</tr>					
					<tr>
						<td width="35%"><div align="center">
								성함<br>
							</div></td>
						<td><input type="text" name="customerName" size="15"
							value="<%=member.getName() %>"></td>
					</tr>
					<tr>
						<td width="35%"><div align="center">
								연락처<br>
							</div></td>
						<td><input type="text" name="customerTel" size="15"
							value="<%=member.getTel() %>"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><br>
							<hr> <br>예상 결제 가격은 <b>&dollar;<%=totalPayPlusDays%></b> 입니다.<br>
							<br>
							<hr> <br></td>
					</tr>
					<tr>
						<td width="35%"><div align="center">
								카드번호<br>(16자리)
							</div></td>
						<td><input type="text" name="cardNo" size="16" onkeyup="cardNoCheck(this.form.cardNo.value)">
						<span id="cardnocheck"></span></td>
					</tr>
					<tr>
						<td width="35%"><div align="center">
								비밀번호<br>(4자리)
							</div></td>
						<td><input type="password" name="cardPw" size="4" onkeyup="cardPwCheck(this.form.cardPw.value)">
						<span id="cardpwcheck"></span></td></td>
					</tr>
					<tr>
						<td width="35%"><div align="center">
								유효기간<br>(4자리)<br> <br>
							</div></td>
						<td><div style="white-space: nowrap;"><input type="text" name="cardDay" size="4" onkeyup="cardDayCheck(this.form.cardDay.value)">
						(월/년 순으로 입력)
						<span id="carddaycheck"></span></div></td>
					
					</tr>
					<tr>
						<td colspan="4" align="center">&nbsp;&nbsp; <input
							type="submit" value=" 계속 >> ">
							&nbsp;&nbsp;&nbsp;<input type="reset" value=" 다시 선택하기 ">
							&nbsp;
						</td>
					</tr>
				</table>
				<br> <br> <br>
			</form>
		</div>
	</div>
	</Reservation2>
</body>
</html>