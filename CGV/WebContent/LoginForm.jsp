<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="LoginForm.css">

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="main">
		<div class="info">
			<form action="LoginPro.jsp" method="post">
				<input type="text" name="id" maxlength="12" placeholder="ID"><br />
				<input type="password" name="passwd" maxlength="12" placeholder="PW"><br />
				<input type="submit" value="�α���"> <input type="button"
					value="ȸ������" onclick="location.href='RegisterForm.jsp'">
			</form>
		</div>
	</div>


</body>
</html>