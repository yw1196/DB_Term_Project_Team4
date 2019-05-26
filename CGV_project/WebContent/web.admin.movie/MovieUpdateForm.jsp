<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화 정보 수정</title>
</head>
<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>

	<h2>영화 아이디와 제목이 일치해야지 영화 정보수정이 가능합니다.</h2>
	<form method="post" action="MovieUpdatePro.jsp">
		영화아이디 : <input type="text" name="id" maxlength="12"><br />
		영화제목 : <input type="text" name="title" maxlength="12"><br />
		감독 : <input type="text" name="director" maxlength="20"><br />
		출연진 : <input type="text" name="actors" maxlength="255"><br />
		줄거리 : <input type="text" name="plot" maxlength="255"><br />
		영화등급 : <input type="text" name="rating" maxlength="15"><br />
		개봉일 : <input type="date" name="startdate" maxlength="15"><br />
		러닝타임 : <input type="text" name="running_time" maxlength="15"><br />
		<input type="submit" value="정보수정"> <input type="reset"
			value="다시입력"> <input type="button" value="뒤로가기"
			onclick="location.href='../web.admin/Admin.jsp'">
	</form>

</body>
</html>