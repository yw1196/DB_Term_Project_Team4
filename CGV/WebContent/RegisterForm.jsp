<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>
   <h2>ȸ��������</h2>
   
   <form method="post" action="RegisterPro.jsp">
      ���̵� : <input type="text" name="ID" maxlength="12"><br />
      �н����� : <input type="password" name="PW" maxlength="12"><br />
      �̸� : <input type="text" name="NameV" maxlength="12"><br />
      ���� : <input type="date" name="Birth" maxlength="12"><br />
      �ּ� : <input type="text" name="Address" maxlength="40"><br />
      ��ȣ : <input type="text" name="Phonenumber" maxlength="15"><br />
      <input type="submit" value="ȸ������">
      <input type="reset" value="�ٽ��Է�">
      <input type="button" value="���" onclick="location.href='LoginForm.jsp'">
   </form>
</body>
</html>