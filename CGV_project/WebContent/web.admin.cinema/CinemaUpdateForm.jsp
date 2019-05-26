<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화관 정보 수정</title>
</head>
<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>

	<h2>영화관 이름을 정확히 입력해야 영화관 정보수정이 가능합니다.</h2>
	<form method="post" action="CinemaUpdatePro.jsp">
		영화관 이름 : <input type="text" name="name" maxlength="12"><br />
		영화관 주소 : <input type="text" name="address" maxlength="50"><br />
		영화관 전화번호 : <input type="text" name="callnum" maxlength="20"><br />
		상영관 개수 : <input type="text" name="screen_num" maxlength="20"><br />
		<input type="submit" value="정보수정"> <input type="reset"
			value="다시입력"> <input type="button" value="뒤로가기"
			onclick="location.href='../web.admin/Admin.jsp'">
	</form>

</body>
</html>
