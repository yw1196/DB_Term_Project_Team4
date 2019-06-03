<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>
	Admin Page
	<form action="">

	
	영화관
	<input type="button" value="등록" onclick="location.href='../web.admin.cinema/CinemaRegisterForm.jsp'">
	<input type="button" value="수정" onclick="location.href='../web.admin.cinema/CinemaUpdateForm.jsp'">
	<input type="button" value="삭제" onclick="location.href='../web.admin.cinema/CinemaDeleteForm.jsp'">
	<br>
	
	영화
	<input type="button" value="등록" onclick="location.href='../web.admin.movie/MovieRegisterForm.jsp'">
	<input type="button" value="수정" onclick="location.href='../web.admin.movie/MovieUpdateForm.jsp'">
	<input type="button" value="삭제" onclick="location.href='../web.admin.movie/MovieDeleteForm.jsp'">
	<br>
	
	상영관
	<input type="button" value="등록" onclick="location.href='../web.admin.screen/ScreenRegisterForm.jsp'">
	<input type="button" value="수정" onclick="location.href='../web.admin.screen/ScreenUpdateForm.jsp'">
	<input type="button" value="삭제" onclick="location.href='../web.admin.screen/ScreenDeleteForm.jsp'">
	<br>	
	
	회원관리
	<input type="button" value="회원정보" onclick="location.href='../web.admin.check/UserListCheckForm.jsp'">
	<input type="button" value="vip관리" onclick="location.href='../web.admin.check/VIPUserCheckForm.jsp'">
	<br>
	
	
	
	</form>

	<input type="button" value="영화목록확인" onclick="location.href='../web.admin.check/MovieListCheckForm.jsp'">
	<input type="button" value="결제유무확인" onclick="location.href='../web.admin.check/ReservationCheckForm.jsp'">
	<br>
	
	
</body>
</html>