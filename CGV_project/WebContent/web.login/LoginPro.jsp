<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<%@ page import="java.sql.*"%>
<%@ page import="user.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	HttpSession hs = request.getSession();
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	hs.setAttribute("id", id);
	hs.setAttribute("passwd", passwd);
	

	LogonDBBean logon = LogonDBBean.getInstance();
	int check = logon.userCheck(id, passwd);
	int Acheck = logon.AdminCheck(id);

	if (check == 1) {
		response.sendRedirect("../web.main/MainForm.jsp");
%>
<%
	} else if (check == 0) {
%>
<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	alert("아이디가 맞지 않습니다.");
	history.go(-1);
</script>
<%
	}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="LoginPro.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	



</body>
</html>