<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>
<%
   request.setCharacterEncoding("euc-kr");
%>
<%
	String passward = request.getParameter("PW");

	HttpSession hs = request.getSession();
	String passcheck = (String) hs.getAttribute("passwd");
	if (passcheck.equals(passward)) {

	} else {
%>
<script>
	alert("비밀번호가 틀렸습니다.");
	history.go(-1);
</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>정보수정</title>
</head>
<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>
	<h2>정보수정폼</h2>

	<form method="post" action="UpdatePro.jsp">
		패스워드 : <input type="password" name="PW" maxlength="12"><br />
		이름 : <input type="text" name="NameV" maxlength="12"><br /> 생일
		: <input type="text" name="Birth" maxlength="12"><br /> 주소 :
		<input type="text" name="Address" maxlength="40"><br /> 번호 :
		<input type="text" name="Phonenumber" maxlength="15"><br /> <input
			type="submit" value="정보수정">
		<input type="reset" value="다시입력"> <input type="button"
			value="취소" onclick="location.href='../web.main/MainForm.jsp'">

	</form>
</body>
</html>