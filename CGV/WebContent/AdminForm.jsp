<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p>영화 정보 등록/수정/삭제</p>
	<p>영화관 정보 등록/수정/삭제</p>
	
	<form action="AdminPro.jsp" method="post">
		<input type="button" value="영화정보등록" onclick="location.href='MovieRegisterForm.jsp'">
		<input type="button" value="영화정보수정" onclick="location.href='MovieUpdateForm.jsp'">
		<input type="button" value="영화정보삭제" onclick="location.href='MovieDeleteForm.jsp'">		
	</form>
	<br />
	<br />
	<form action="AdminPro.jsp" method="post">
		<input type="button" value="영화관정보등록" onclick="location.href='CinemaRegisterForm.jsp'">
		<input type="button" value="영화관정보수정" onclick="location.href='CinemaUpdateForm.jsp'">
		<input type="button" value="영화관정보삭제" onclick="location.href='CinemaDeleteForm.jsp'">		
	</form>
</body>
</html>
