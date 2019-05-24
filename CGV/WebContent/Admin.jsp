<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	Admin Page
	<form action="">
		영화관 정보등록 수정 삭제, 영화정보등록 수정 삭제, vip관리, 고객정보 확인, 영화목록 확인, 결제유무확인 및 티켓발매 
	</form>
	<input type="button" value="영화목록확인" onclick="location.href='MovieListCheckForm.jsp'">
	<input type="button" value="결제유무확인" onclick="location.href='ReservationCheckForm.jsp'">
	<br>
	
	영화관
	<input type="button" value="등록" onclick="location.href='ScreenInsertForm.jsp'">
	<input type="button" value="수정" onclick="location.href='ScreenUpdateForm.jsp'">
	<input type="button" value="삭제" onclick="location.href='ScreenDeleteForm.jsp'">
	<br>
	
	영화
	<input type="button" value="등록" onclick="location.href='MovieInsertForm.jsp'">
	<input type="button" value="수정" onclick="location.href='MovieUpdateForm.jsp'">
	<input type="button" value="삭제" onclick="location.href='MovieDeleteForm.jsp'">
	<br>
	
	회원관리
	<input type="button" value="회원정보" onclick="location.href='UserCheckForm.jsp'">
	<input type="button" value="vip관리" onclick="location.href='VIPCheckForm.jsp'">
	
	
</body>
</html>