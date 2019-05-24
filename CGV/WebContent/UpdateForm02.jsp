<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>정보수정</title>
</head>
<body>
	<h2>정보수정폼</h2>
   
   <form method="post" action="UpdatePro.jsp">
      패스워드 : <input type="password" name="PW" maxlength="12"><br />
      이름 : <input type="text" name="NameV" maxlength="12"><br />
      생일 : <input type="text" name="Birth" maxlength="12"><br />
      주소 : <input type="text" name="Address" maxlength="40"><br />
      번호 : <input type="text" name="Phonenumber" maxlength="15"><br />
      <input type="submit" value="정보수정" onclick="location.href='LoginForm.jsp'"> 
      <input type="reset" value="다시입력">
      <input type="button" value="취소" onclick="location.href='LoginForm.jsp'">
      
   </form>
</body>
</html>