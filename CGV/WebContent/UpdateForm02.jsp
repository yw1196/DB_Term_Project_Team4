<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��������</title>
</head>
<body>
	<h2>����������</h2>
   
   <form method="post" action="UpdatePro.jsp">
      �н����� : <input type="password" name="PW" maxlength="12"><br />
      �̸� : <input type="text" name="NameV" maxlength="12"><br />
      ���� : <input type="text" name="Birth" maxlength="12"><br />
      �ּ� : <input type="text" name="Address" maxlength="40"><br />
      ��ȣ : <input type="text" name="Phonenumber" maxlength="15"><br />
      <input type="submit" value="��������" onclick="location.href='LoginForm.jsp'"> 
      <input type="reset" value="�ٽ��Է�">
      <input type="button" value="���" onclick="location.href='LoginForm.jsp'">
      
   </form>
</body>
</html>