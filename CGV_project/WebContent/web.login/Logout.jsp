<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	HttpSession hs = request.getSession();

	hs.invalidate();
%>
<script>
	alert("로그아웃 되었습니다.");
	location.href = "../web.main/MainForm.jsp";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>