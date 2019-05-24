<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화 정보 삭제</title>
</head>
<body>

	<h2>영화관 이름만 정확하게 입력하면 해당하는 영화관의 정보가 삭제됩니다.</h2>
	<form method="post" action="CinemaDeletePro.jsp">
		영화관 이름 : <input type="text" name="name" maxlength="12"><br />
		<input type="submit" value="정보삭제"> <input type="reset"value="다시입력"> <input type="button" value="뒤로가기"onclick="location.href='AdminForm.jsp'">
	</form>


</body>
</html>