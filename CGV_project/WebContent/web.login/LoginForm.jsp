<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="LoginForm.css" rel="stylesheet" type="text/css">

<meta charset="EUC-KR">
<title>영화 예매 사이트</title>

</head>
<body>
	<div style="cursor:pointer;width:100px;height:100px;border:1px solid;"  onclick="location.href='../web.main/MainForm.jsp'">
		<img alt="" src="../home.jpg" style="width:100px; height:100px;">
	</div>
	<div class="main">


		<div class="info con">
			<form action="LoginPro.jsp" method="post">
				<div class="center">
					<input class="inputbar" type="text" name="id" maxlength="20" placeholder="ID">
				</div>
				<div class="center">	
					<input class="inputbar" type="password" name="passwd" maxlength="20"
						placeholder="PW">
				</div>
				<div class="button center">
					<input class="" type="submit" value="로그인"> <input class="" type="button"
						value="회원가입" onclick="location.href='../web.register/RegisterForm.jsp'">
				</div>

			</form>
		</div>

	</div>


</body>
</html>