<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상영관 정보수정</title>
</head>
<body>
	<h2>상영관 수정 Form</h2>
	<h3>주의 - 상영관 아이디와 영화관 이름이 일치해야 수정이 가능합니다.</h3>
	<form method="post" action="ScreenUpdatePro.jsp">
		상영관 아이디 : <input type="text" name="id" maxlength="12"><br />
		총 좌석 수 : <input type="text" name="seat_totalnum" maxlength="20"><br />
		영화 아이디 : <input type="text" name="movie_id" maxlength="20"><br />
		영화관 이름 : <input type="text" name="cinema_name" maxlength="20"><br />
		<input type="submit" value="수정"> <input type="reset"
			value="다시입력"> <input type="button" value="뒤로가기"
			onclick="location.href='AdminForm.jsp'">
	</form>
</body>
</html>