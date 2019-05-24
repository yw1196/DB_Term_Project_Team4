<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화정보등록</title>
</head>
<body>
	<h2>영화등록 Form</h2>
	<form method="post" action="CinemaRegisterPro.jsp">
		영화관 이름 : <input type="text" name="name" maxlength="12"><br />
		영화관 주소 : <input type="text" name="address" maxlength="50"><br />
		영화관 전화번호 : <input type="text" name="callnum" maxlength="20"><br />
		상영관 개수 : <input type="text" name="screen_num" maxlength="20"><br />
		<input type="submit" value="등록"> <input type="reset"
			value="다시입력"> <input type="button" value="뒤로가기"
			onclick="location.href='AdminForm.jsp'">
	</form>
</body>
</html>