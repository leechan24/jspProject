<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
   request.setCharacterEncoding("utf-8");
   String id = (String)session.getAttribute("idKey"); 
%>
<!DOCTYPE html>
<html>
<head>
   <title>Login Page</title>
   
   <!--Custom styles-->
   <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<script type="text/javascript">
function loginCheck(){
   if(document.loginFrm.id.value == ""){
      alert("아이디를 입력해 주세요.");
      document.loginFrm.id.focus();
      return;
   }
   if(document.loginFrm.pwd.value == ""){
      alert("비밀번호를 입력해 주세요.");
      document.loginFrm.pwd.focus();
      return;
   }
   document.loginFrm.submit();
}
</script>
<style>

login @import "compass/css3";

login * { box-sizing: border-box; }

login body {
  font-family: "HelveticaNeue-Light","Helvetica Neue Light","Helvetica Neue",Helvetica,Arial,"Lucida Grande",sans-serif;
  color:white;
  font-size:12px;
  background:#333 url(/images/classy_fabric.png);
}

login form {
 	background:#111; 
  width:300px;
  margin:30px auto;
  border-radius:0.4em;
  border:1px solid #191919;
  overflow:hidden;
  position:relative;
  box-shadow: 0 5px 10px 5px rgba(0,0,0,0.2);
  margin-bottom: 250px;
}

login form:after {
  content:"";
  display:block;
  position:absolute;
  height:1px;
  width:100px;
  left:20%;
  background:linear-gradient(left, #111, #444, #b6b6b8, #444, #111);
  top:0;
}

login form:before {
 	content:"";
  display:block;
  position:absolute;
  width:8px;
  height:5px;
  border-radius:50%;
  left:34%;
  top:-7px;
  box-shadow: 0 0 6px 4px #fff;
}

login .inset {
 	padding:20px; 
  border-top:1px solid #19191a;
}

login form h1 {
  font-size:18px;
  color: white;
  text-shadow:0 1px 0 black;
  text-align:center;
  padding:15px 0;
  border-bottom:1px solid rgba(0,0,0,1);
  position:relative;
}

login form h1:after {
 	content:"";
  display:block;
  width:250px;
  height:100px;
  position:absolute;
  top:0;
  left:50px;
  pointer-events:none;
  transform:rotate(70deg);
  background:linear-gradient(50deg, rgba(255,255,255,0.15), rgba(0,0,0,0));
  
}

login label {
 	color:#666;
  display:block;
  padding-bottom:9px;
}

 input[type=text],
 input[type=password] {
 	width:100%;
  padding:8px 5px;
  background:linear-gradient(#1f2124, #27292c);
  border:1px solid #222;
  box-shadow:
    0 1px 0 rgba(255,255,255,0.1);
  border-radius:0.3em;
  margin-bottom:20px;
  color: white;
}

login label[for=remember]{
 	color:white;
  display:inline-block;
  padding-bottom:0;
  padding-top:5px;
}

login input[type=checkbox] {
 	display:inline-block;
  vertical-align:top;
}

login .p-container {
 	padding:0 20px 20px 20px; 
}

login .p-container:after {
 	clear:both;
  display:table;
  content:"";
}

login .p-container span {
  display:block;
  float:left;
  color:#0d93ff;
  padding-top:8px;
}

 input[type=button] {
    padding: 5px 20px;
    border: 1px solid rgba(0, 0, 0, 0.4);
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.4);
    box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.3), inset 0 10px 10px rgba(255, 255, 255, 0.1);
    border-radius: 0.3em;
    background: #35393c;
    color: white;
    float: right;
    font-weight: bold;
    cursor: pointer;
    font-size: 13px;

}

login input[type=button]:hover {
  box-shadow:
    inset 0 1px 0 rgba(255,255,255,0.3),
    inset 0 -10px 10px rgba(255,255,255,0.1);
}

login input[type=text]:hover,
login input[type=password]:hover,
login label:hover ~ input[type=text],
login label:hover ~ input[type=password] {
 	background:#27292c;
}
c {
color: white;
 }
</style>

<login>

<body bgcolor="gray">
 <form name = "loginFrm" method = "post" action = "loginProc.jsp">
  <h1> Login</h1>
  <div class="inset">
  <p>
    <label for="email">ID</label>
    <input type="text" name="id" id="email">
  </p>
  <p>
    <label for="password">PASSWORD</label>
    <input type="password" name="pwd" id="password">
  </p>
  <p>
    
     <input type = "button"  name = "btn" value = "로그인"  onclick = "loginCheck()" > 
  </p>
  </div>
  <p class="p-container">
   <c>회원이 아니신가요?<c> &nbsp;<a href="member.jsp">회원가입</a>
  </p>
</form>
</body>
</login>
</html>