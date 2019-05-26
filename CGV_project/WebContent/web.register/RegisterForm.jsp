<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="LoginForm.css" rel="stylesheet" type="text/css">

<meta charset="EUC-KR">
<title>회원가입</title>
</head>
<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>
	<div class="info con">
		<form method="post" action="RegisterPro.jsp">
			<div class="center"><input class="inputbar" type="text" name="ID" maxlength="12" placeholder="ID"></div>
			<div class="center"><input class="inputbar" type="password" name="PW" maxlength="12" placeholder="PW"></div>
			<div class="center"><input class="inputbar" type="text" name="NameV" maxlength="12" placeholder="Name"></div>
			<div class="center"><input class="inputbar" type="text" name="Birth" maxlength="12" placeholder="Birth"></div>
			<div class="center"><input class="inputbar" type="text" name="Address" maxlength="40" placeholder="Address"></div>
			<div class="center"><input class="inputbar" type="text" name="Phonenumber" maxlength="15" placeholder="Number"></div>
			<div class="center">
				<input type="submit" value="회원가입">
				<input type="reset" value="다시입력">
				<input type="button" value="취소" onclick="location.href='../web.main/MainForm.jsp'">
			</div>			
		</form>
	</div>

</body>
</html>