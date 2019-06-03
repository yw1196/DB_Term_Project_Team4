<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상영관 정보등록</title>
</head>
<body>
	<h2>상영관 등록 Form</h2>
	<h3>주의 - 영화 아이디와 영화관 이름은 해당 테이블에 값이 있어야 합니다.</h3>
	<form method="post" action="ScreenRegisterPro.jsp">
		영화관 이름 : <input type="text" name="cinema_name" maxlength="20"><br />
		상영관 아이디 : <input type="text" name="id" maxlength="12"><br />
		총 좌석 수 : <input type="text" name="seat_totalnum" maxlength="20"><br />
		영화 아이디 : <input type="text" name="movie_id" maxlength="20"><br />
		<input type="submit" value="등록"> <input type="reset"
			value="다시입력"> <input type="button" value="뒤로가기"
			onclick="location.href='AdminForm.jsp'">
	</form>
</body>
</html>