<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>삭제</title>
</head>
	<form method="post" action="DeletePro.jsp">
      아이디 : <input type="text" name="ID" maxlength="12"><br />
   	비밀번호 : <input type="password" name="PW" maxlength="12"><br />
     <input type="submit" value="탈퇴">
     <input type="button" value="취소" onclick="location.href='MainForm.jsp'">
<body>

</body>
</html>