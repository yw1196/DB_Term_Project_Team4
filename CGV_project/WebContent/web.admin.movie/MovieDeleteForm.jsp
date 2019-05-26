<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화 정보 삭제</title>
</head>
<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>

	<h2>영화 아이디와 제목만 일치하게 입력하면 해당하는 영화의 정보가 삭제됩니다.</h2>
	<form method="post" action="MovieDeletePro.jsp">
		영화아이디 : <input type="text" name="id" maxlength="12"><br />
		영화제목 : <input type="text" name="title" maxlength="12"><br />
		<input type="submit" value="정보삭제"> <input type="reset"value="다시입력"> <input type="button" value="뒤로가기"onclick="location.href=''../web.admin/Admin.jsp'">
	</form>


</body>
</html>